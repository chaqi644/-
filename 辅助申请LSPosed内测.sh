#!/bin/bash

# 定义颜色
RED='\033[31m'          # 红色
GREEN='\033[32m'        # 绿色
YELLOW='\033[33m'       # 黄色
RESET='\033[0m'         # 重置颜色

# 默认密钥位置
KEY_PATH="/data/user/0/bin.mt.plus/files/term/home/.ssh/id_ed25519"

# 检查 ssh-keygen 是否可用
if ! command -v ssh-keygen > /dev/null 2>&1; then
    echo -e "${RED}请使用 MT 管理器扩展包环境执行！${RESET}\n"
    exit 1
fi

# 记录脚本开始的时间戳
START_TIME=$(date +%s)

# 提示用户输入挑战码
echo -e -n "${YELLOW}请输入挑战码: ${RESET} "
read CHALLENGE_CODE
echo

# 使用用户提供的挑战码进行签名
SIGNED_OUTPUT=$(echo -n "${CHALLENGE_CODE}" | ssh-keygen -Y sign -n lsposed -f "${KEY_PATH}" 2>&1)

# 输出签名结果
echo -e "${GREEN}签名结果: ${RESET}${SIGNED_OUTPUT}\n"
