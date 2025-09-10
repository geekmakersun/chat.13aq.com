#!/bin/bash

# 先切换到www-data用户，然后运行swoole重启命令
su -s /bin/bash -c "
  cd /var/www/chat.13aq.com
  /usr/bin/php7.4 think swoole restart
" www-data 2>&1 | tee -a ./runtime/log/swoole.log