# 鱼群模拟器 - 打包说明

## 环境要求

1. **Node.js** (版本 16 或更高)
   - 下载地址：https://nodejs.org/
   - 安装后验证：`node --version`

2. **npm** (通常随 Node.js 一起安装)
   - 验证：`npm --version`

## 安装依赖

在项目根目录运行：

```bash
npm install
```

## 开发模式运行

```bash
npm run electron
```

## 打包成可执行文件

### Windows 用户

```bash
# 打包 Windows 版本
npm run build:win
```

### macOS 用户

```bash
# 打包 macOS 版本
npm run build:mac
```

### 通用打包

```bash
# 根据当前系统打包
npm run build
```

## 输出文件

打包完成后，可执行文件将生成在 `dist/` 目录中：

- **Windows**: `dist/鱼群模拟器 Setup 1.0.0.exe`
- **macOS**: `dist/鱼群模拟器-1.0.0.dmg`

## 分发说明

1. **Windows 用户**：
   - 发送 `鱼群模拟器 Setup 1.0.0.exe` 文件
   - 接收者双击安装即可使用

2. **macOS 用户**：
   - 发送 `鱼群模拟器-1.0.0.dmg` 文件
   - 接收者双击挂载，拖拽到应用程序文件夹

## 功能特性

- ✅ 完整的鱼群模拟效果
- ✅ 鼠标交互控制
- ✅ 相机控制（拖拽旋转、滚轮缩放）
- ✅ 全屏支持（F11）
- ✅ 开发者工具（F12）
- ✅ 跨平台支持

## 故障排除

### 如果打包失败：

1. 确保所有依赖已安装：
   ```bash
   npm install
   ```

2. 清理缓存重新安装：
   ```bash
   npm cache clean --force
   rm -rf node_modules
   npm install
   ```

3. 检查 Node.js 版本：
   ```bash
   node --version
   npm --version
   ```

### 如果运行时出错：

1. 确保 `index.html` 文件在项目根目录
2. 确保 `public/` 文件夹包含所有资源文件
3. 检查控制台错误信息

## 自定义配置

如需修改应用信息，编辑 `package.json` 中的 `build` 部分：

```json
{
  "build": {
    "appId": "com.yourcompany.fish-flocking",
    "productName": "鱼群模拟器",
    "directories": {
      "output": "dist"
    }
  }
}
```
