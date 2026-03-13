#!/bin/bash

# GitHub Pages 部署脚本
# 此脚本将帮您完成 GitHub 仓库创建和网站部署

echo "========================================="
echo "   GitHub Pages 部署助手"
echo "========================================="
echo ""

# 检查 GitHub CLI
if ! command -v gh &> /dev/null; then
    echo "❌ GitHub CLI 未安装"
    echo "请运行: brew install gh"
    exit 1
fi

# 检查登录状态
if ! gh auth status &> /dev/null; then
    echo "========================================="
    echo "   第一步：登录 GitHub"
    echo "========================================="
    echo ""
    echo "请按照以下步骤登录 GitHub："
    echo ""
    echo "1. 在浏览器中打开以下网址："
    echo "   https://github.com/login/device"
    echo ""
    echo "2. 输入设备代码（请复制下方代码）："
    echo ""
    
    # 获取设备代码
    CODE_OUTPUT=$(gh auth login --web 2>&1 | grep -A 2 "First copy your one-time code" || true)
    if [ -n "$CODE_OUTPUT" ]; then
        echo "$CODE_OUTPUT"
    fi
    
    echo ""
    echo "3. 点击浏览器中的 'Authorize' 按钮"
    echo "4. 返回终端继续"
    echo ""
    
    # 等待用户按回车
    read -p "按回车键继续..."
    
    # 再次检查登录状态
    if ! gh auth status &> /dev/null; then
        echo ""
        echo "⚠️  检测到您可能还未完成登录"
        echo "请尝试手动运行: gh auth login"
        echo ""
        exit 1
    fi
fi

echo ""
echo "✅ GitHub 登录成功！"
echo ""

# 获取 GitHub 用户名
GITHUB_USER=$(gh api user --jq '.login')
echo "您的 GitHub 用户名: $GITHUB_USER"
echo ""

# 仓库名称
REPO_NAME="haoya-dental-clinic"
REPO_DESC="汕博雅口腔诊所官方网站"

echo "========================================="
echo "   第二步：创建 GitHub 仓库"
echo "========================================="
echo ""
echo "仓库名称: $REPO_NAME"
echo "仓库描述: $REPO_DESC"
echo ""

# 检查仓库是否已存在
if gh repo view $GITHUB_USER/$REPO_NAME &> /dev/null; then
    echo "⚠️  仓库 $GITHUB_USER/$REPO_NAME 已存在"
    echo ""
    read -p "是否使用现有仓库？(y/n): " use_existing
    if [ "$use_existing" != "y" ] && [ "$use_existing" != "Y" ]; then
        echo "已取消部署"
        exit 1
    fi
else
    echo "正在创建仓库..."
    
    # 创建仓库
    gh repo create $REPO_NAME \
        --public \
        --description "$REPO_DESC" \
        --source=. \
        --remote=origin \
        --push
    
    if [ $? -eq 0 ]; then
        echo "✅ 仓库创建成功！"
    else
        echo "❌ 仓库创建失败"
        echo "请检查网络连接或手动创建仓库"
        exit 1
    fi
fi

echo ""
echo "========================================="
echo "   第三步：推送代码到 GitHub"
echo "========================================="
echo ""

# 检查是否已初始化 Git
if [ ! -d ".git" ]; then
    echo "正在初始化 Git 仓库..."
    git init
    git branch -m main
fi

# 检查远程仓库
if ! git remote get-url origin &> /dev/null; then
    git remote add origin https://github.com/$GITHUB_USER/$REPO_NAME.git
fi

echo "正在推送代码到 GitHub..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo "✅ 代码推送成功！"
else
    echo "❌ 代码推送失败"
    exit 1
fi

echo ""
echo "========================================="
echo "   第四步：启用 GitHub Pages"
echo "========================================="
echo ""
echo "请按照以下步骤启用 GitHub Pages："
echo ""
echo "1. 在浏览器中打开："
echo "   https://github.com/$GITHUB_USER/$REPO_NAME/settings/pages"
echo ""
echo "2. 在 'Source' 下选择 'Deploy from a branch'"
echo "3. 在 'Branch' 下选择 'main' 分支"
echo "4. 文件夹选择 '/ (root)'"
echo "5. 点击 'Save' 按钮"
echo ""
echo "⏳ GitHub Pages 将在 1-2 分钟内完成部署"
echo ""

# 等待用户确认
read -p "按回车键继续..."

echo ""
echo "========================================="
echo "   🎉 部署完成！"
echo "========================================="
echo ""
echo "您的网站已成功部署到 GitHub Pages！"
echo ""
echo "📱 网站地址："
echo "   https://$GITHUB_USER.github.io/$REPO_NAME/"
echo ""
echo "📄 重要页面："
echo "   首页：https://$GITHUB_USER.github.io/$REPO_NAME/"
echo "   文章列表：https://$GITHUB_USER.github.io/$REPO_NAME/articles.html"
echo "   FAQ页面：https://$GITHUB_USER.github.io/$REPO_NAME/faq.html"
echo ""
echo "🔧 后续更新网站："
echo "   git add ."
echo "   git commit -m '更新描述'"
echo "   git push"
echo ""
echo "GitHub Pages 会自动部署您的更新！"
echo ""
