#!/bin/bash

# GitHub 代码推送脚本
# 使用 Personal Access Token 方式

echo "========================================="
echo "   GitHub 代码推送助手"
echo "========================================="
echo ""
echo "当前状态："
echo "  - 用户名: dzotojimiyo799-code"
echo "  - 仓库: haoya-dental-clinic"
echo "  - 待推送文件: 32 个"
echo ""

# 检查是否在正确的目录
if [ ! -d ".git" ]; then
    echo "❌ 错误：当前目录不是 Git 仓库"
    echo "请先进入项目目录"
    exit 1
fi

# 检查远程仓库
if ! git remote get-url origin &> /dev/null; then
    echo "正在配置远程仓库..."
    git remote add origin https://github.com/dzotojimiyo799-code/haoya-dental-clinic.git
    echo "✅ 远程仓库配置完成"
fi

echo ""
echo "========================================="
echo "   第一步：创建 Personal Access Token"
echo "========================================="
echo ""
echo "请按照以下步骤操作："
echo ""
echo "1. 在浏览器中打开以下网址："
echo "   https://github.com/settings/tokens/new"
echo ""
echo "2. 配置 Token："
echo "   - Note（备注）: Haoya Dental Clinic Deploy"
echo "   - Expiration（过期时间）: No expiration"
echo "   - Select scopes（权限）: 勾选 'repo'"
echo ""
echo "3. 点击底部的 'Generate token' 按钮"
echo ""
echo "4. ⚠️ 重要：立即复制生成的 Token"
echo "   Token 格式类似: ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
echo ""
read -p "按回车键继续（确保您已复制 Token）..."

echo ""
echo "========================================="
echo "   第二步：推送代码"
echo "========================================="
echo ""
echo "准备推送代码到 GitHub..."
echo ""
echo "当提示输入用户名和密码时："
echo "  - Username: dzotojimiyo799-code"
echo "  - Password: 粘贴您刚才复制的 Token"
echo ""

# 执行推送
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "========================================="
    echo "   ✅ 推送成功！"
    echo "========================================="
    echo ""
    echo "您的代码已成功推送到 GitHub！"
    echo ""
    echo "下一步：启用 GitHub Pages"
    echo "----------------------------------------"
    echo "1. 在浏览器中打开："
    echo "   https://github.com/dzotojimiyo799-code/haoya-dental-clinic/settings/pages"
    echo ""
    echo "2. 在 'Source' 下选择 'Deploy from a branch'"
    echo ""
    echo "3. 在 'Branch' 下选择 'main' 分支"
    echo ""
    echo "4. 文件夹选择 '/ (root)'"
    echo ""
    echo "5. 点击 'Save' 按钮"
    echo ""
    echo "⏳ GitHub Pages 将在 1-2 分钟内完成部署"
    echo ""
    echo "部署完成后，您的网站地址为："
    echo "   https://dzotojimiyo799-code.github.io/haoya-dental-clinic/"
    echo ""
else
    echo ""
    echo "========================================="
    echo "   ❌ 推送失败"
    echo "========================================="
    echo ""
    echo "可能的原因："
    echo "1. Token 输入错误"
    echo "2. Token 已过期"
    echo "3. Token 权限不足"
    echo ""
    echo "解决方法："
    echo "1. 重新生成 Token: https://github.com/settings/tokens/new"
    echo "2. 确保 Token 有 'repo' 权限"
    echo "3. 重新运行此脚本"
    echo ""
fi
