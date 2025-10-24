#!/bin/bash

echo "🐟 鱼群模拟器 - 开始打包..."

# 检查 Node.js 是否安装
if ! command -v node &> /dev/null; then
    echo "❌ 错误：未找到 Node.js，请先安装 Node.js"
    echo "下载地址：https://nodejs.org/"
    exit 1
fi

# 检查 npm 是否安装
if ! command -v npm &> /dev/null; then
    echo "❌ 错误：未找到 npm，请先安装 npm"
    exit 1
fi

echo "✅ Node.js 版本：$(node --version)"
echo "✅ npm 版本：$(npm --version)"

# 安装依赖
echo "📦 安装依赖包..."
npm install

if [ $? -ne 0 ]; then
    echo "❌ 依赖安装失败"
    exit 1
fi

echo "✅ 依赖安装完成"

# 清理之前的构建
echo "🧹 清理之前的构建文件..."
rm -rf dist/

# 开始打包
echo "🔨 开始打包应用..."

# 根据操作系统选择打包命令
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    echo "🍎 检测到 macOS 系统，打包 macOS 版本..."
    npm run build:mac
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
    # Windows
    echo "🪟 检测到 Windows 系统，打包 Windows 版本..."
    npm run build:win
else
    # Linux 或其他
    echo "🐧 检测到 Linux 系统，打包通用版本..."
    npm run build
fi

if [ $? -eq 0 ]; then
    echo "🎉 打包完成！"
    echo "📁 输出文件位置：dist/ 目录"
    echo ""
    echo "📋 分发说明："
    echo "1. 将 dist/ 目录中的可执行文件发送给朋友"
    echo "2. 朋友双击安装即可使用"
    echo ""
    echo "🔧 功能说明："
    echo "- 鼠标移动：影响鱼群行为"
    echo "- 拖拽：旋转视角"
    echo "- 滚轮：缩放"
    echo "- F11：全屏"
    echo "- F12：开发者工具"
else
    echo "❌ 打包失败，请检查错误信息"
    exit 1
fi
