# 🐟 鱼群模拟器 - 打包成EXE文件

## 快速开始

### 方法一：一键打包（推荐）

```bash
# 在项目目录运行
./build.sh
```

### 方法二：手动打包

```bash
# 1. 安装依赖
npm install

# 2. 开发模式测试
npm run electron

# 3. 打包成可执行文件
npm run build:win    # Windows版本
npm run build:mac    # macOS版本
npm run build        # 自动检测系统
```

## 📋 完整步骤

### 1. 环境准备

确保已安装：
- **Node.js** (版本 16+): https://nodejs.org/
- **npm** (通常随Node.js安装)

验证安装：
```bash
node --version
npm --version
```

### 2. 安装依赖

```bash
cd /Users/zuobowen/Documents/GitHub/MJID/flock
npm install
```

### 3. 测试运行

```bash
npm run electron
```

### 4. 打包

```bash
# Windows用户
npm run build:win

# macOS用户  
npm run build:mac

# 自动检测系统
npm run build
```

## 📁 输出文件

打包完成后，在 `dist/` 目录中找到：

- **Windows**: `鱼群模拟器 Setup 1.0.0.exe`
- **macOS**: `鱼群模拟器-1.0.0.dmg`

## 🚀 分发给朋友

### Windows用户接收：
1. 发送 `鱼群模拟器 Setup 1.0.0.exe` 文件
2. 朋友双击安装
3. 安装完成后在开始菜单找到"鱼群模拟器"

### macOS用户接收：
1. 发送 `鱼群模拟器-1.0.0.dmg` 文件  
2. 朋友双击挂载DMG
3. 拖拽应用到Applications文件夹

## 🎮 使用说明

### 操作控制：
- **鼠标移动**：影响鱼群行为
- **拖拽**：旋转视角
- **滚轮**：缩放
- **F11**：全屏模式
- **F12**：开发者工具

### 功能特性：
- ✅ 2500条鱼的群体模拟
- ✅ GPU加速计算
- ✅ 真实的水下光照效果
- ✅ 流畅的动画表现
- ✅ 跨平台支持

## 🔧 故障排除

### 如果打包失败：

1. **清理缓存**：
```bash
npm cache clean --force
rm -rf node_modules
npm install
```

2. **检查Node.js版本**：
```bash
node --version  # 需要16+
```

3. **权限问题**：
```bash
chmod +x build.sh
```

### 如果运行时出错：

1. 确保 `index.html` 在项目根目录
2. 确保 `public/` 文件夹包含所有资源
3. 检查控制台错误信息

## 📦 项目结构

```
flock/
├── index.html          # 主页面
├── main.js            # Electron主进程
├── package.json       # 项目配置
├── build.sh           # 一键打包脚本
├── public/            # 静态资源
│   ├── sardine.glb    # 鱼模型
│   └── ...
└── dist/              # 打包输出目录
```

## 🎯 技术栈

- **Three.js**: 3D图形渲染
- **WebGL**: GPU计算
- **Electron**: 桌面应用框架
- **GLTF**: 3D模型格式

## 📞 支持

如果遇到问题，请检查：
1. Node.js版本是否16+
2. 网络连接是否正常
3. 磁盘空间是否充足
4. 杀毒软件是否拦截

---

**注意**：首次打包可能需要下载Electron二进制文件，请确保网络连接正常。
