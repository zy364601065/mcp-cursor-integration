#!/bin/bash

# 使用 GitHub API 创建仓库的脚本

set -e

REPO_NAME="mcp-cursor-integration"
REPO_DESCRIPTION="MCP 与 Cursor 联动完整指南和配置示例"

echo "🚀 创建 GitHub 仓库: $REPO_NAME"
echo ""

# 检查是否提供了 GitHub token
if [ -z "$GITHUB_TOKEN" ]; then
    echo "❌ 错误: 需要设置 GITHUB_TOKEN 环境变量"
    echo ""
    echo "请执行以下步骤:"
    echo "1. 访问 https://github.com/settings/tokens"
    echo "2. 生成一个新的 Personal Access Token (需要 repo 权限)"
    echo "3. 运行: export GITHUB_TOKEN=your_token_here"
    echo "4. 然后重新运行此脚本"
    exit 1
fi

# 获取 GitHub 用户名
echo "📋 获取 GitHub 用户信息..."
USERNAME=$(curl -s -H "Authorization: token $GITHUB_TOKEN" https://api.github.com/user | grep -o '"login": "[^"]*' | cut -d'"' -f4)

if [ -z "$USERNAME" ]; then
    echo "❌ 错误: 无法获取 GitHub 用户信息，请检查 token 是否有效"
    exit 1
fi

echo "✅ 用户: $USERNAME"
echo ""

# 检查仓库是否已存在
echo "🔍 检查仓库是否已存在..."
EXISTS=$(curl -s -o /dev/null -w "%{http_code}" -H "Authorization: token $GITHUB_TOKEN" "https://api.github.com/repos/$USERNAME/$REPO_NAME")

if [ "$EXISTS" = "200" ]; then
    echo "⚠️  仓库已存在: https://github.com/$USERNAME/$REPO_NAME"
    read -p "是否继续推送代码到现有仓库？(y/n): " continue_push
    if [ "$continue_push" != "y" ] && [ "$continue_push" != "Y" ]; then
        echo "❌ 操作已取消"
        exit 1
    fi
else
    # 创建新仓库
    echo "📦 创建新仓库..."
    RESPONSE=$(curl -s -X POST \
        -H "Authorization: token $GITHUB_TOKEN" \
        -H "Accept: application/vnd.github.v3+json" \
        https://api.github.com/user/repos \
        -d "{
            \"name\": \"$REPO_NAME\",
            \"description\": \"$REPO_DESCRIPTION\",
            \"private\": false,
            \"auto_init\": false
        }")
    
    # 检查是否创建成功
    if echo "$RESPONSE" | grep -q '"message"' ; then
        echo "❌ 错误: 创建仓库失败"
        echo "$RESPONSE" | grep -o '"message": "[^"]*' | cut -d'"' -f4
        exit 1
    fi
    
    echo "✅ 仓库创建成功: https://github.com/$USERNAME/$REPO_NAME"
fi

# 添加远程仓库并推送
echo ""
echo "📤 推送代码到 GitHub..."

# 检查是否已有远程仓库
if git remote | grep -q "^origin$"; then
    echo "⚠️  远程仓库 'origin' 已存在，正在更新..."
    git remote set-url origin "https://$GITHUB_TOKEN@github.com/$USERNAME/$REPO_NAME.git"
else
    git remote add origin "https://$GITHUB_TOKEN@github.com/$USERNAME/$REPO_NAME.git"
fi

# 设置默认分支为 main
git branch -M main 2>/dev/null || true

# 推送代码
echo "正在推送..."
git push -u origin main

echo ""
echo "✅ 完成！"
echo "🔗 仓库地址: https://github.com/$USERNAME/$REPO_NAME"
echo ""
echo "💡 提示: 为了安全，建议撤销刚才使用的 token 或使用更安全的认证方式"
