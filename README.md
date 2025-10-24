# 鱼群模拟项目 (Fish Flocking Simulation)

这是一个基于Three.js的鱼群模拟项目，使用GPU计算来实现大量鱼类的群体行为。

## 功能特点

- 🐟 **鱼群行为模拟**：实现分离、对齐、凝聚三种基本群体行为
- 🎮 **交互控制**：鼠标移动会影响鱼群行为，模拟捕食者效果
- 🎥 **相机控制**：支持鼠标拖拽旋转、滚轮缩放
- ⚡ **GPU加速**：使用GPU计算实现高性能模拟
- 🎨 **3D渲染**：支持动画和材质效果

## 运行方法

### 🌐 在线部署（Vercel）

#### 快速部署到 Vercel

```bash
# 1. 安装 Vercel CLI
npm install -g vercel

# 2. 进入项目目录
cd flock-electron

# 3. 部署到 Vercel
npm run vercel:deploy
```

#### 使用 GitHub 自动部署

1. 将代码推送到 GitHub 仓库
2. 在 [Vercel Dashboard](https://vercel.com/dashboard) 中导入项目
3. Vercel 会自动检测项目并部署

#### 本地预览部署

```bash
# 预览部署效果
npm run vercel:preview

# 本地测试 Web 版本
npm run web:start
```

### 🖥️ 本地运行

#### 方法1：使用Python服务器（推荐，自动端口）

```bash
# 进入项目目录
cd flock-electron

# 启动服务器（自动寻找可用端口）
python3 server.py
```

服务器会自动寻找可用端口（8000-8009），启动后显示实际访问地址。

#### 方法2：使用启动脚本

```bash
# 基础启动脚本（自动端口）
./start.sh

# 高级启动脚本（支持指定端口）
./start-advanced.sh          # 自动端口
./start-advanced.sh 8080      # 指定端口8080
./start-advanced.sh --port 9000  # 指定端口9000
```

#### 方法3：使用Node.js服务器

```bash
# 安装http-server
npm install -g http-server

# 进入项目目录
cd flock-electron

# 启动服务器
http-server -p 8000 --cors
```

#### 方法4：使用其他HTTP服务器

任何支持CORS的HTTP服务器都可以，比如：
- Live Server (VS Code扩展)
- 其他本地服务器

## 🚀 智能端口管理

项目现在支持智能端口管理：

- **自动端口检测**：如果8000端口被占用，会自动尝试8001、8002...直到8009
- **手动指定端口**：可以使用 `./start-advanced.sh 8080` 指定特定端口
- **端口冲突提示**：如果指定端口被占用，会给出清晰的错误提示和解决方案

## 控制说明

- **鼠标移动**：影响鱼群行为，模拟捕食者
- **鼠标拖拽**：旋转相机视角
- **滚轮**：缩放视图
- **GUI面板**：可以调整各种参数
  - Separation：分离距离
  - Alignment：对齐距离  
  - Cohesion：凝聚距离
  - Size：鱼的大小
  - Count：鱼的数量

## 技术实现

- **Three.js**：3D图形库
- **WebGL**：GPU渲染
- **GLTF模型**：3D鱼模型
- **GPU计算**：群体行为计算
- **着色器**：自定义渲染效果

## 文件结构

```
flock/
├── index.html          # 主页面
├── server.py           # Python HTTP服务器
├── README.md           # 说明文档
└── public/
    └── fish.glb        # 3D鱼模型文件
```

## 🚀 Vercel 部署详细说明

### 部署前准备

1. **确保项目结构正确**：
   - `index.html` 在根目录
   - `public/` 目录包含所有静态资源
   - `vercel.json` 配置文件已创建

2. **检查依赖**：
   ```bash
   npm install
   ```

### 部署步骤

#### 方法1：使用 Vercel CLI

```bash
# 安装 Vercel CLI
npm install -g vercel

# 登录 Vercel
vercel login

# 部署项目
vercel

# 生产环境部署
vercel --prod
```

#### 方法2：GitHub 集成部署

1. 将代码推送到 GitHub 仓库
2. 访问 [Vercel Dashboard](https://vercel.com/dashboard)
3. 点击 "New Project"
4. 选择你的 GitHub 仓库
5. Vercel 会自动检测项目配置并部署

### 部署配置说明

项目包含 `vercel.json` 配置文件，包含以下设置：

- **静态文件服务**：使用 `@vercel/static` 构建器
- **路由配置**：所有请求重定向到 `index.html`
- **CORS 头设置**：支持跨域资源共享
- **环境变量**：设置生产环境

### 部署后访问

部署成功后，你会获得一个 Vercel 提供的 URL，例如：
- `https://your-project-name.vercel.app`
- `https://your-project-name-git-main.vercel.app`

### 自定义域名

1. 在 Vercel Dashboard 中选择项目
2. 进入 "Settings" → "Domains"
3. 添加你的自定义域名
4. 按照提示配置 DNS 记录

## 注意事项

1. **必须使用HTTP服务器**：直接打开HTML文件会因为CORS限制无法加载GLB模型
2. **模型要求**：建议使用低多边形模型（100-300个面）以获得最佳性能
3. **浏览器兼容性**：需要支持WebGL2的现代浏览器
4. **性能优化**：鱼群数量过多可能影响性能，可通过GUI调整
5. **Vercel 部署**：确保所有静态资源路径正确，避免 404 错误

## 故障排除

### 模型无法加载
- 确保使用HTTP服务器而不是直接打开文件
- 检查模型文件路径是否正确
- 确认浏览器支持WebGL

### 性能问题
- 减少鱼群数量
- 降低模型复杂度
- 关闭其他占用GPU的程序

### 显示异常
- 检查浏览器控制台是否有错误信息
- 确认Three.js库正确加载
- 尝试刷新页面

## 开发说明

本项目基于Three.js官方示例修改，主要改动包括：
- 更换为鱼模型
- 调整水下场景效果
- 优化相机控制
- 添加中文注释

## 许可证

基于Three.js许可证，详见：https://github.com/mrdoob/three.js/blob/dev/LICENSE
