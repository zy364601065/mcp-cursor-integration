# 创建 GitHub 仓库的三种方法

## 方法一：使用自动化脚本（推荐）⭐

### 步骤 1: 获取 GitHub Personal Access Token

1. 访问 https://github.com/settings/tokens
2. 点击 "Generate new token" > "Generate new token (classic)"
3. 填写信息：
   - **Note**: `MCP-Cursor-Integration`
   - **Expiration**: 选择合适的时间（建议 90 天）
   - **Scopes**: 勾选 `repo` (完整仓库权限)
4. 点击 "Generate token"
5. **重要**: 复制生成的 token（只显示一次）

### 步骤 2: 运行脚本

```bash
cd ~/Desktop/ZFPlayer-master

# 设置 token（替换 your_token_here 为你的实际 token）
export GITHUB_TOKEN=your_token_here

# 运行脚本
./create-github-repo.sh
```

脚本会自动：
- ✅ 创建 GitHub 仓库 `mcp-cursor-integration`
- ✅ 添加远程仓库
- ✅ 推送所有文档到 GitHub

## 方法二：使用 GitHub 网站（最简单）

### 步骤 1: 创建仓库

1. 访问 https://github.com/new
2. 填写信息：
   - **Repository name**: `mcp-cursor-integration`
   - **Description**: `MCP 与 Cursor 联动完整指南和配置示例`
   - **Visibility**: 选择 Public 或 Private
   - **不要**勾选 "Initialize this repository with a README"
3. 点击 "Create repository"

### 步骤 2: 推送代码

在终端执行：

```bash
cd ~/Desktop/ZFPlayer-master

# 添加远程仓库（替换 YOUR_USERNAME 为你的 GitHub 用户名）
git remote add origin https://github.com/YOUR_USERNAME/mcp-cursor-integration.git

# 设置默认分支
git branch -M main

# 推送代码
git push -u origin main
```

## 方法三：使用 GitHub CLI（如果已安装）

```bash
cd ~/Desktop/ZFPlayer-master

# 登录 GitHub（如果还没有）
gh auth login

# 创建仓库并推送
gh repo create mcp-cursor-integration --public --source=. --remote=origin --push
```

## 验证

创建完成后，访问你的仓库页面：
- https://github.com/YOUR_USERNAME/mcp-cursor-integration

你应该能看到以下文件：
- ✅ README.md
- ✅ MCP-Cursor-Integration.md
- ✅ README-MCP.md
- ✅ mcp-config-example.json
- ✅ GITHUB-SETUP.md
- ✅ setup-github.sh
- ✅ PROJECT-SUMMARY.md
- ✅ create-github-repo.sh

## 需要帮助？

如果遇到问题：

1. **权限错误**: 确保 token 有 `repo` 权限
2. **仓库已存在**: 脚本会提示是否推送到现有仓库
3. **网络问题**: 检查网络连接和防火墙设置
4. **Git 配置**: 确保 Git 用户名和邮箱已配置

## 安全提示

⚠️ **重要**: 
- 不要在代码中硬编码 token
- 使用环境变量存储 token
- 定期轮换 token
- 使用最小权限原则

---

**推荐使用方法一**，最简单快捷！
