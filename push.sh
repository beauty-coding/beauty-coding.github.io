#!/bin/bash

echo "同步到服务器 开始"
time=$(date "+%Y-%m-%d %H:%M:%S")
git add .

read -t 30 -p "请输入提交注释:" msg

if  [ ! "$msg" ] ;then
    echo "[commit message], 提交人: yufw, 提交时间: ${time}"
	git commit -m "提交人: yufw, 提交时间: ${time}"
else
    echo "[commit message] $msg, 提交人: yufw, 提交时间: ${time}"
	git commit -m "$msg, 提交人: yufw, 提交时间: ${time}"
fi

git push
echo "同步到服务器 成功"