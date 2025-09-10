#!/bin/bash

# 先切换到www-data用户，然后运行swoole停止命令
OUTPUT=$(su -s /bin/bash -c "
  cd /var/www/chat.13aq.com
  /usr/bin/php7.4 think swoole stop
" www-data 2>&1)

# 将英文提示转换为中文提示
CHINESE_OUTPUT=${OUTPUT//"no swoole http server process running."/"Swoole HTTP 服务器未在运行。"}

# 输出中文提示到控制台并同时记录到日志文件
echo "$CHINESE_OUTPUT" | tee -a ./runtime/log/swoole.log