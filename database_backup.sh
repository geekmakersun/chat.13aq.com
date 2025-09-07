#!/bin/bash

# 数据库备份脚本
# 从.env文件中读取数据库配置

# 设置脚本所在目录为工作目录
cd "$(dirname "$0")"

# 从.env文件中提取数据库配置（使用更可靠的方式）
DB_HOST=$(sed -n 's/^HOSTNAME = \s*//p' .env | tr -d '\r')
DB_PORT=$(sed -n 's/^HOSTPORT = \s*//p' .env | tr -d '\r')
DB_USER=$(sed -n 's/^USERNAME = \s*//p' .env | tr -d '\r')
DB_PASS=$(sed -n 's/^PASSWORD = \s*//p' .env | tr -d '\r')
DB_NAME=$(sed -n 's/^DATABASE = \s*//p' .env | tr -d '\r')
DB_PREFIX=$(sed -n 's/^PREFIX = \s*//p' .env | tr -d '\r')

# 定义备份文件路径和名称
BACKUP_DIR="/var/www/chat.local.13aq.com/database"
BACKUP_FILENAME="${DB_NAME}_backup_$(date +'%Y%m%d_%H%M%S').sql"
BACKUP_PATH="${BACKUP_DIR}/${BACKUP_FILENAME}"

# 确保备份目录存在
mkdir -p "${BACKUP_DIR}"

# 执行数据库备份
mysqldump -h "${DB_HOST}" -P "${DB_PORT}" -u "${DB_USER}" -p"${DB_PASS}" "${DB_NAME}" > "${BACKUP_PATH}"

# 检查备份是否成功
if [ $? -eq 0 ]; then
    echo "数据库备份成功！备份文件: ${BACKUP_PATH}"
    # 可选：压缩备份文件
    # gzip "${BACKUP_PATH}"
    # echo "备份文件已压缩: ${BACKUP_PATH}.gz"
    # 可选：删除7天前的备份文件，保持目录清洁
    find "${BACKUP_DIR}" -name "${DB_NAME}_backup_*.sql*" -type f -mtime +7 -delete
    echo "已删除7天前的备份文件"
else
    echo "错误：数据库备份失败！"
    exit 1
fi