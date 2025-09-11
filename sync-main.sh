#!/bin/bash

# =============================================================================
# Git 仓库同步脚本
# 用途：用于同步 Git 仓库代码，包括子模块更新、提交和推送更改
# 并确保仓库内所有文件所有者设置为 www-data（解决 root 用户修改文件导致的权限问题）
# =============================================================================

# ==============
# 全局变量定义
# ==============
# 默认同步的 Git 分支名称
DEFAULT_BRANCH="main"

# 锁文件路径，用于防止脚本多个实例同时运行
LOCK_FILE="/tmp/sync-main.lock"

# 日志文件路径，记录脚本执行过程
LOG_FILE="/var/log/sync-main.log"

# 文件所有者设置（根据用户需求，固定为 www-data）
FILE_OWNER="www-data"

# ==============
# 错误码定义
# ==============
# 各种错误情况的退出码常量定义
E_NOT_GIT_REPO=1           # 非 Git 仓库错误
E_CANNOT_CHANGE_DIR=2      # 无法切换目录错误
E_LOCK_FAILED=3            # 获取锁失败错误
E_GIT_OPERATION_FAILED=4   # Git 操作失败错误
E_PERMISSION_DENIED=5      # 权限不足错误

# ==============
# 日志级别控制
# ==============
# 是否启用详细输出模式（默认为关闭）
VERBOSE=false

# ==============
# 工具函数定义
# ==============

# 工具函数：打印带时间戳和级别的日志信息
# 参数1: 日志级别（INFO/WARN/ERROR）
# 参数2: 日志消息内容
log() {
    local timestamp="$(date +'%Y-%m-%d %H:%M:%S')"
    local level="$1"
    local message="$2"
    local log_entry="[$timestamp] [$level] $message"
    
    # 输出到控制台，便于实时查看
    echo -e "$log_entry"
    
    # 同时写入日志文件，便于后续排查问题
    echo -e "$log_entry" >> "$LOG_FILE"
}

# 工具函数：打印信息级别日志
# 参数1: 日志消息内容
info() {
    log "INFO" "$1"
}

# 工具函数：打印警告级别日志
# 参数1: 日志消息内容
warn() {
    log "WARN" "$1"
}

# 工具函数：打印错误级别日志
# 参数1: 日志消息内容
error() {
    log "ERROR" "$1"
}

# 工具函数：检查命令执行结果并处理
# 参数1: 命令的退出码
# 参数2: 失败时的错误消息
# 参数3: 成功时的提示消息（可选）
check_result() {
    local exit_code=$1
    local error_message=$2
    local success_message=$3
    
    # 如果命令执行失败，打印错误信息并返回操作失败码
    if [ $exit_code -ne 0 ]; then
        error "$error_message"
        return $E_GIT_OPERATION_FAILED
    fi
    
    # 如果命令执行成功且提供了成功消息，则打印成功信息
    if [ -n "$success_message" ]; then
        info "$success_message"
    fi
    
    # 命令执行成功，返回 0
    return 0
}

# ==============
# 功能函数定义
# ==============

# 函数：显示帮助信息
show_help() {
    echo "Git 仓库同步脚本"
    echo "用途：用于同步 Git 仓库代码，包括子模块更新、提交和推送更改，并确保所有文件所有者为 www-data。"
    echo ""
    echo "用法：$0 [选项]"
    echo "选项："
    echo "  -b, --branch <分支名>  指定要同步的分支名称（默认为 'main'）"
    echo "  -v, --verbose          启用详细输出模式，显示更多执行细节"
    echo "  -h, --help             显示此帮助信息"
    echo ""
    echo "示例："
    echo "  $0                    使用默认设置同步 main 分支"
    echo "  $0 --branch develop   同步 develop 分支"
    echo "  $0 --verbose          启用详细日志输出"
}

# 函数：检查并确保指定分支存在，如果不存在则创建
# 参数1: 分支名称
ensure_branch() {
    local branch_name=$1
    
    # 检查分支是否存在
    if git rev-parse --verify "$branch_name" >/dev/null 2>&1; then
        info "分支 $branch_name 存在，直接切换"
        git checkout "$branch_name" >/dev/null 2>&1
        return $?
    else
        info "分支 $branch_name 不存在，正在创建并切换到它"
        git checkout -b "$branch_name" >/dev/null 2>&1
        return $?
    fi
}

# 函数：检查是否处于游离状态（detached HEAD）并尝试解决
resolve_detached_head() {
    # 检查当前 HEAD 是否指向一个有效的分支引用
    if git symbolic-ref --quiet HEAD >/dev/null 2>&1; then
        $VERBOSE && info "HEAD 处于正常状态，指向一个分支。"
        return 0
    fi
    
    warn "检测到 HEAD 处于游离状态。"
    
    # 尝试获取最接近的分支名称
    local branch_name="$(git describe --tags --exact-match HEAD 2>/dev/null)"
    
    # 如果未找到匹配的标签，尝试获取最近的分支引用
    if [ -z "$branch_name" ]; then
        $VERBOSE && info "游离状态未指向任何标签，尝试获取最近的分支名称..."
        branch_name="$(git rev-parse --abbrev-ref HEAD)"
        
        # 如果仍然无法获取有效分支名，尝试使用 name-rev 命令
        if [ "$branch_name" = "HEAD" ]; then
            branch_name="$(git name-rev --name-only HEAD)"
            branch_name=${branch_name#remotes/origin/}  # 移除可能的远程前缀
            branch_name=${branch_name%%/*}  # 移除可能的提交路径
        fi
    fi
    
    # 尝试切换到找到的分支或默认分支
    if [ -n "$branch_name" ] && git show-ref --verify --quiet "refs/heads/$branch_name"; then
        info "尝试切换到最接近的分支：$branch_name"
        git checkout "$branch_name" >/dev/null 2>&1
        return $?
    else
        info "无法确定接近的分支，将切换到默认分支：$DEFAULT_BRANCH"
        git checkout "$DEFAULT_BRANCH" >/dev/null 2>&1
        return $?
    fi
}

# 函数：尝试从指定分支拉取最新代码，并处理未提交的更改
# 参数1: 分支名称
pull_from_branch() {
    local branch_name=$1
    
    # 确保切换到目标分支
    ensure_branch "$branch_name"
    check_result $? "切换到分支 $branch_name 失败" "成功切换到分支 $branch_name"
    if [ $? -ne 0 ]; then
        return $E_GIT_OPERATION_FAILED
    fi
    
    # 使用 "ours" 策略选项优先采用本地分支上的更改
    $VERBOSE && info "正在从远程仓库拉取最新代码（优先使用本地更改）..."
    git pull -Xours origin "$branch_name" >/dev/null 2>&1
    check_result $? "从远程仓库拉取代码失败" "成功拉取最新代码"
    if [ $? -ne 0 ]; then
        warn "合并时遇到冲突，本地更改被优先使用"
    fi
    
    # 检查是否存在被删除的文件，并从暂存区移除
    if git ls-files --deleted | grep -q .; then
        $VERBOSE && info "检测到已删除的文件，将从暂存区移除..."
        git ls-files --deleted -z | xargs -0 git rm --cached >/dev/null 2>&1
        check_result $? "移除已删除文件失败" "成功移除已删除文件"
        
        # 仅当有更改时才提交
        if ! git diff --cached --quiet; then
            git commit -m "删除本地已删除的文件" --allow-empty >/dev/null 2>&1
            check_result $? "提交删除操作失败" "成功提交删除操作"
        fi
    fi
    
    # 尝试应用之前暂存的变更（如果有）
    if git stash list | grep -q "On branch $branch_name"; then
        $VERBOSE && info "检测到有暂存的变更，尝试应用..."
        git stash pop >/dev/null 2>&1
        check_result $? "应用暂存变更失败" "成功应用暂存变更"
    fi
    
    return 0
}

# 函数：处理子模块更新操作
update_submodules() {
    # 检查是否存在子模块配置文件
    if [ ! -f ".gitmodules" ]; then
        $VERBOSE && info "当前仓库没有子模块配置文件，跳过子模块更新"
        return 0
    fi
    
    info "========== 开始处理子模块 更新 =========="
    
    # 初始化和更新子模块（一次性执行，避免重复操作）
    git submodule update --init --recursive --depth=1 --progress >/dev/null 2>&1
    check_result $? "初始化和更新子模块失败" "成功初始化和更新子模块"
    if [ $? -ne 0 ]; then
        return $E_GIT_OPERATION_FAILED
    fi
    
    # 遍历所有子模块，更新每个子模块
    info "遍历所有子模块，进行更新操作..."
    git submodule foreach --recursive '
        echo "正在处理子模块:【$name】"
        git checkout main >/dev/null 2>&1
        git pull --progress origin main >/dev/null 2>&1
        echo "完成处理子模块:【$name】"
        echo "============="
    '
    check_result $? "更新子模块失败" "所有子模块更新完成"
    
    info "========== 子模块更新 完成 =========="
    return 0
}

# 函数：添加、提交和推送代码更改到远程仓库
# 参数1: 分支名称
commit_and_push_changes() {
    local branch_name=$1
    
    # 添加所有改变的文件到暂存区
    $VERBOSE && info "添加所有更改的文件到暂存区..."
    git add --all >/dev/null 2>&1
    check_result $? "添加文件到暂存区失败" "成功添加所有更改的文件"
    if [ $? -ne 0 ]; then
        return $E_GIT_OPERATION_FAILED
    fi
    
    # 如果有要提交的变更，进行提交
    if ! git diff --cached --quiet; then
        local commit_message="自动同步更新 $(date +'%Y-%m-%d %H:%M:%S')"
        $VERBOSE && info "有变更需要提交，提交信息：$commit_message"
        git commit -m "$commit_message" >/dev/null 2>&1
        check_result $? "提交更改失败" "成功提交更改"
        if [ $? -ne 0 ]; then
            return $E_GIT_OPERATION_FAILED
        fi
        
        # 在试图推送之前检查是否处于游离状态
        resolve_detached_head
        check_result $? "解决游离状态失败" "确认 HEAD 状态正常"
        if [ $? -ne 0 ]; then
            return $E_GIT_OPERATION_FAILED
        fi
        
        # 推送代码到远程仓库
        info "推送代码到远程仓库..."
        git push origin "$branch_name" >/dev/null 2>&1
        check_result $? "推送代码到远程仓库失败" "成功推送代码到远程仓库"
        if [ $? -ne 0 ]; then
            return $E_GIT_OPERATION_FAILED
        fi
    else
        info "没有检测到需要提交的变更"
    fi
    
    return 0
}

# 函数：递归更改仓库中所有文件的所有者为 www-data
# 参数1: 仓库路径
change_file_owner() {
    local repository_path=$1
    local owner="$FILE_OWNER"
    
    # 开始递归修改文件所有者
    info "递归更改仓库中所有文件所有者为 $owner..."
    
    # 先处理文件
    find "$repository_path" -type f -not -path '*/.git/*' -exec chown $owner {} \;
    check_result $? "更改文件所有者失败" "成功更改所有文件所有者为 $owner"
    if [ $? -ne 0 ]; then
        warn "部分文件可能未能成功更改所有者，请检查权限设置"
    fi
    
    # 再处理目录
    find "$repository_path" -type d -not -path '*/.git/*' -exec chown $owner {} \;
    check_result $? "更改目录所有者失败" "成功更改所有目录所有者为 $owner"
    if [ $? -ne 0 ]; then
        warn "部分目录可能未能成功更改所有者，请检查权限设置"
    fi
    
    info "文件所有者递归修改完成"
    return 0
}

# ==============
# 锁机制函数
# ==============

# 函数：创建并检查锁文件，防止脚本多个实例同时运行
acquire_lock() {
    # 检查是否存在锁文件
    if [ -f "$LOCK_FILE" ]; then
        # 检查锁文件对应的进程是否存在
        local pid=$(cat "$LOCK_FILE" 2>/dev/null)
        if [ -n "$pid" ] && kill -0 $pid 2>/dev/null; then
            error "脚本已经在运行中（PID: $pid），请稍后再试"
            return $E_LOCK_FAILED
        fi
        # 如果进程不存在，删除旧的锁文件
        warn "发现旧的锁文件，已删除"
        rm -f "$LOCK_FILE"
    fi
    
    # 创建新的锁文件，写入当前进程 ID
    echo $$ > "$LOCK_FILE"
    return 0
}

# 函数：安全退出脚本，清理资源
# 参数1: 退出码
safe_exit() {
    # 清理函数：在脚本退出时执行
    local exit_code=$1
    
    # 释放锁文件
    if [ -f "$LOCK_FILE" ]; then
        rm -f "$LOCK_FILE"
        $VERBOSE && info "已释放锁文件"
    fi
    
    info "脚本执行完成，退出码: $exit_code"
    exit $exit_code
}

# ==============
# 主函数：主执行流程
# ==============
main() {
    # 解析命令行参数
    while [[ $# -gt 0 ]]; do
        case $1 in
            -b|--branch)
                DEFAULT_BRANCH="$2"
                shift 2
                ;;
            -v|--verbose)
                VERBOSE=true
                shift
                ;;
            -h|--help)
                show_help
                exit 0
                ;;
            *)
                warn "未知选项: $1"
                show_help
                exit 1
                ;;
        esac
    done
    
    # 设置退出处理函数，捕获 SIGINT（Ctrl+C）和 SIGTERM 信号
    trap "safe_exit 1" SIGINT SIGTERM
    
    # 尝试获取锁，确保脚本不会多个实例同时运行
    acquire_lock
    if [ $? -ne 0 ]; then
        safe_exit $E_LOCK_FAILED
    fi
    
    # 打印脚本开始执行的信息
    info "========== Git 仓库同步脚本 开始执行 =========="
    info "同步分支: $DEFAULT_BRANCH"
    
    # 检查是否在一个 Git 仓库内
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        error "当前目录不是一个Git仓库"
        safe_exit $E_NOT_GIT_REPO
    fi
    info "确认当前目录是一个 Git 仓库"
    
    # 检查 Git 仓库是否有提交
    if ! git rev-parse HEAD >/dev/null 2>&1; then
        warn "当前 Git 仓库中没有发现任何提交"
        info "创建一个空的初始化提交"
        git commit --allow-empty -m "初始化仓库" >/dev/null 2>&1
        check_result $? "创建初始化提交失败" "成功创建初始化提交"
        if [ $? -ne 0 ]; then
            safe_exit $E_GIT_OPERATION_FAILED
        fi
    fi
    info "已找到当前仓库的 HEAD 引用"
    
    # 获取脚本所在的目录作为主仓库路径
    main_repository=$(cd "$(dirname "$0")" && pwd)
    info "主仓库目录:【$main_repository】"
    
    # 切换到主仓库目录
    cd "$main_repository" || {
        error "不能切换到主仓库目录【$main_repository】"
        safe_exit $E_CANNOT_CHANGE_DIR
    }
    info "成功切换到主仓库目录"
    
    # 在任何可能更改 HEAD 的 Git 命令前后进行检查
    resolve_detached_head
    check_result $? "解决游离状态失败" "确认 HEAD 状态正常"
    if [ $? -ne 0 ]; then
        safe_exit $E_GIT_OPERATION_FAILED
    fi
    
    # 从默认分支拉取最新信息，并处理潜在合并冲突
    pull_from_branch "$DEFAULT_BRANCH"
    check_result $? "从分支拉取代码失败" "成功从分支拉取最新代码"
    if [ $? -ne 0 ]; then
        safe_exit $E_GIT_OPERATION_FAILED
    fi
    
    # 再次检查 HEAD 状态，确保拉取后状态正常
    resolve_detached_head
    check_result $? "解决游离状态失败" "再次确认 HEAD 状态正常"
    if [ $? -ne 0 ]; then
        safe_exit $E_GIT_OPERATION_FAILED
    fi
    
    # 处理子模块更新
    update_submodules
    check_result $? "更新子模块失败" "子模块更新完成"
    
    # 添加、提交和推送更改
    commit_and_push_changes "$DEFAULT_BRANCH"
    check_result $? "提交和推送更改失败" "更改已成功提交并推送"
    
    # 更改文件所有者为 www-data（根据用户需求，确保所有文件权限正确）
    change_file_owner "$main_repository"
    
    # 打印脚本执行完成的信息
    info "========== Git 仓库同步脚本 执行完成 =========="
    safe_exit 0
}

# 执行主函数，并传递所有命令行参数
main "$@"
