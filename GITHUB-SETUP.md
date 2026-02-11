# GitHub 仓库设置指南

## 方法一：通过 GitHub 网站创建（推荐）

### 步骤 1: 创建新仓库

1. 访问 [GitHub](https://github.com)
2. 点击右上角的 "+" 按钮
3. 选择 "New repository"
4. 填写仓库信息：
   - **Repository name**: `mcp-cursor-integration`
   - **Description**: `MCP 与 Cursor 联动完整指南和配置示例`
   - **Visibility**: 选择 Public 或 Private
   - **不要**勾选 "Initialize this repository with a README"（因为我们已经有文件了）
5. 点击 "Create repository"

### 步骤 2: 推送本地文件到 GitHub

在终端中执行以下命令：

```bash
# 1. 进入项目目录（如果需要创建新目录）
cd ~/Desktop
mkdir mcp-cursor-integration
cd mcp-cursor-integration

# 2. 复制文档文件到新目录
cp ~/Desktop/ZFPlayer-master/MCP-Cursor-Integration.md .
cp ~/Desktop/ZFPlayer-master/README-MCP.md .
cp ~/Desktop/ZFPlayer-master/mcp-config-example.json .

# 3. 初始化 Git 仓库
git init

# 4. 添加文件
git add .

# 5. 提交
git commit -m "Initial commit: MCP 与 Cursor 联动文档"

# 6. 添加远程仓库（替换 YOUR_USERNAME 为你的 GitHub 用户名）
git remote add origin https://github.com/YOUR_USERNAME/mcp-cursor-integration.git

# 7. 推送到 GitHub
git branch -M main
git push -u origin main
```

## 方法二：使用 GitHub CLI

如果你安装了 GitHub CLI (`gh`)，可以使用以下命令：

```bash
# 1. 创建新目录
cd ~/Desktop
mkdir mcp-cursor-integration
cd mcp-cursor-integration

# 2. 复制文件
cp ~/Desktop/ZFPlayer-master/MCP-Cursor-Integration.md .
cp ~/Desktop/ZFPlayer-master/README-MCP.md .
cp ~/Desktop/ZFPlayer-master/mcp-config-example.json .

# 3. 初始化并创建 GitHub 仓库
git init
git add .
git commit -m "Initial commit: MCP 与 Cursor 联动文档"
gh repo create mcp-cursor-integration --public --source=. --remote=origin --push
```

## 方法三：在当前项目目录中创建

如果你想在当前 ZFPlayer 项目中添加这些文档：

```bash
cd ~/Desktop/ZFPlayer-master

# 添加文件到 Git（如果还没有初始化）
git init  # 如果还没有初始化
git add MCP-Cursor-Integration.md README-MCP.md mcp-config-example.json

# 提交
git commit -m "Add MCP and Cursor integration documentation"

# 创建 GitHub 仓库并推送
gh repo create mcp-cursor-integration --public --source=. --remote=origin --push
```

## 验证

创建完成后，访问你的 GitHub 仓库页面，应该能看到以下文件：

- ✅ `MCP-Cursor-Integration.md` - 完整文档
- ✅ `README-MCP.md` - 项目说明
- ✅ `mcp-config-example.json` - 配置示例

## 后续步骤

1. **添加 .gitignore**（如果需要）:
   ```bash
   echo "node_modules/" > .gitignore
   echo ".env" >> .gitignore
   ```

2. **添加 LICENSE**（可选）:
   - 在 GitHub 仓库页面点击 "Add file" > "Create new file"
   - 文件名输入 `LICENSE`
   - 选择 MIT License 或其他许可证

3. **添加 Topics**（标签）:
   - 在仓库页面点击 ⚙️ Settings
   - 在 Topics 部分添加: `mcp`, `cursor`, `ai`, `development-tools`

4. **启用 GitHub Pages**（可选）:
   - 在 Settings > Pages 中启用
   - 选择 main 分支作为源
   - 这样可以在线查看文档

## 需要帮助？

如果遇到问题，请检查：

1. ✅ GitHub 账户是否已登录
2. ✅ 是否有创建仓库的权限
3. ✅ Git 是否已正确配置
4. ✅ 网络连接是否正常
