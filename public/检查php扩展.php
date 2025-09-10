<?php
/**
 * PHP 扩展和函数检查脚本
 * 检查项目所需的 PHP 插件和禁用函数状态
 */

// 设置响应内容类型为 HTML
header('Content-Type: text/html; charset=utf-8');

// 开始输出
?> 
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PHP 扩展和函数检查</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            line-height: 1.6;
            color: #333;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f5f5f5;
        }
        .container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 30px;
        }
        h1 {
            color: #2c3e50;
            margin-bottom: 30px;
            text-align: center;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
        }
        h2 {
            color: #34495e;
            margin-top: 30px;
            margin-bottom: 20px;
        }
        .check-item {
            margin-bottom: 15px;
            padding: 10px;
            border-radius: 4px;
            border-left: 4px solid;
        }
        .success {
            background-color: #d4edda;
            color: #155724;
            border-left-color: #28a745;
        }
        .warning {
            background-color: #fff3cd;
            color: #856404;
            border-left-color: #ffc107;
        }
        .error {
            background-color: #f8d7da;
            color: #721c24;
            border-left-color: #dc3545;
        }
        .info {
            background-color: #d1ecf1;
            color: #0c5460;
            border-left-color: #17a2b8;
        }
        .footer {
            margin-top: 40px;
            text-align: center;
            color: #6c757d;
            font-size: 14px;
            border-top: 1px solid #dee2e6;
            padding-top: 20px;
        }
        .php-version {
            text-align: center;
            font-size: 18px;
            color: #6c757d;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>PHP 扩展和函数检查</h1>
        
        <!-- 显示 PHP 版本信息 -->
        <div class="php-version">
            当前 PHP 版本: <?php echo phpversion(); ?>
        </div>
        
        <!-- 检查 PHP 插件安装情况 -->
        <h2>一、PHP 扩展安装检查</h2>
        
        <!-- 检查 fileinfo 扩展 -->
        <div class="check-item <?php echo extension_loaded('fileinfo') ? 'success' : 'error'; ?>">
            <strong>fileinfo 扩展:</strong> 
            <?php 
            if (extension_loaded('fileinfo')) {
                echo "已安装 ✓";
                $finfo = finfo_open(FILEINFO_MIME_TYPE);
                if ($finfo) {
                    echo " (版本: " . phpversion('fileinfo') . ")";
                    finfo_close($finfo);
                }
            } else {
                echo "未安装 ✗ 请安装 fileinfo 扩展";
            }
            ?>
        </div>
        
        <!-- 检查 redis 扩展 -->
        <div class="check-item <?php echo extension_loaded('redis') ? 'success' : 'error'; ?>">
            <strong>redis 扩展:</strong> 
            <?php 
            if (extension_loaded('redis')) {
                echo "已安装 ✓";
                echo " (版本: " . phpversion('redis') . ")";
            } else {
                echo "未安装 ✗ 请安装 redis 扩展";
            }
            ?>
        </div>
        
        <!-- 检查 swoole 扩展 -->
        <div class="check-item <?php echo extension_loaded('swoole') ? 'success' : 'error'; ?>">
            <strong>swoole 扩展:</strong> 
            <?php 
            if (extension_loaded('swoole')) {
                echo "已安装 ✓";
                $swooleVersion = phpversion('swoole');
                echo " (版本: " . $swooleVersion . ")";
                
                // 检查是否是 Swoole 4 或更高版本
                if (version_compare($swooleVersion, '4.0.0', '>=')) {
                    echo " - 满足 Swoole 4+ 要求";
                } else {
                    echo " <span class='warning'>- 版本低于 4.0.0，建议升级</span>";
                }
            } else {
                echo "未安装 ✗ 请安装 swoole4 扩展";
            }
            ?>
        </div>
        
        <!-- 检查 PHP 禁用函数 -->
        <h2>二、PHP 禁用函数检查</h2>
        
        <!-- 检查 proc_open 函数 -->
        <div class="check-item <?php echo function_exists('proc_open') ? 'success' : 'error'; ?>">
            <strong>proc_open 函数:</strong> 
            <?php 
            if (function_exists('proc_open')) {
                echo "可用 ✓";
            } else {
                echo "已被禁用 ✗ 请从 php.ini 的 disable_functions 中移除 proc_open";
                
                // 尝试显示 disable_functions 的配置值
                $disabledFunctions = ini_get('disable_functions');
                if (!empty($disabledFunctions)) {
                    echo "<br><small>当前禁用的函数列表: " . $disabledFunctions . "</small>";
                }
            }
            ?>
        </div>
        
        <!-- 环境信息汇总 -->
        <h2>三、环境信息汇总</h2>
        
        <div class="info">
            <p><strong>服务器操作系统:</strong> <?php echo PHP_OS; ?></p>
            <p><strong>服务器软件:</strong> <?php echo isset($_SERVER['SERVER_SOFTWARE']) ? $_SERVER['SERVER_SOFTWARE'] : '未知'; ?></p>
            <p><strong>PHP 配置文件路径:</strong> <?php echo php_ini_loaded_file(); ?></p>
        </div>
        
        <div class="footer">
            <p>检查完成时间: <?php echo date('Y-m-d H:i:s'); ?></p>
        </div>
    </div>
</body>
</html>