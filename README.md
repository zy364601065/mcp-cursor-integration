# MCP 与 Cursor 联动完整指南

> 这是一个关于 MCP (Model Context Protocol) 与 Cursor 编辑器集成的完整文档和配置示例项目。

## 什么是 MCP

[Model Context Protocol（MCP）](https://modelcontextprotocol.io/docs/getting-started/intro) 让 Cursor 可以连接到外部工具和数据源，扩展 AI 助手的能力。

## 📚 文档导航

- **[Cursor 官方文档](https://cursor.com/cn/docs/context/mcp#mcp)** - 详细的信息和使用指南
- **[MCP 官方文档](https://modelcontextprotocol.io/)** - MCP 协议规范

## 🚀 快速开始

### 配置 MCP 服务器

1. 打开 Cursor → **Settings** → **Cursor Settings**
2. 找到 **Tool & MCP**
3. 点击 **New MCP server** 添加新的服务器
4. 将下面的配置复制到配置文件中
5. 重启 Cursor 使配置生效

---

## 📖 使用案例

### 1. 🎨 Figma Desktop MCP

#### 官方文档
- [Figma MCP 设置指南](https://help.figma.com/hc/en-us/articles/35281186390679-Figma-MCP-collection-How-to-setup-the-Figma-desktop-MCP-server)
- [本地服务器安装](https://developers.figma.com/docs/figma-mcp-server/local-server-installation/)

#### 视频教程
- [YouTube 教程](https://www.youtube.com/watch?v=nPnkMPabCfI)

#### MCP 配置

```json
{
  "mcpServers": {
    "figma-desktop": {
      "url": "http://127.0.0.1:3845/mcp"
    }
  }
}
```

#### 如何在 Cursor 中使用

配置完成后，你可以在 Cursor 中直接与 Figma 设计文件交互：

- **获取设计信息**: "获取当前 Figma 文件中使用的所有颜色值"
- **提取设计令牌**: "从 Figma 设计中提取所有字体和间距信息"
- **读取组件**: "列出当前设计文件中的所有组件"
- **导出资源**: "导出设计中的图标和图片资源"

**使用场景**:
- 从设计稿中自动提取设计令牌（Design Tokens）
- 生成 CSS 变量或主题配置文件
- 同步设计系统中的颜色、字体和间距

---

### 2. 🚀 Postman MCP

#### MCP 配置

```json
{
  "mcpServers": {
    "Postman": {
      "url": "https://mcp.postman.com/minimal",
      "headers": {
        "Authorization": "Bearer your_postman_api_key_here"
      }
    }
  }
}
```

> **注意**: 将 `your_postman_api_key_here` 替换为你的 Postman API Key。获取方式：Postman → Settings → API Keys

#### 如何在 Cursor 中使用

配置完成后，你可以在 Cursor 中管理 Postman 集合和测试 API：

- **运行测试**: "在 Postman 中运行 '用户认证 API' 集合"
- **创建集合**: "创建一个新的 Postman 集合用于测试登录接口"
- **查看结果**: "显示刚才运行的 API 测试结果，列出所有失败的请求"
- **管理环境**: "更新 Postman 环境变量 base_url 为 https://api.example.com"
- **导出文档**: "将 '用户 API' 集合导出为 OpenAPI 规范"

**使用场景**:
- 自动化 API 测试流程
- CI/CD 集成测试
- API 健康检查和监控
- 快速验证接口功能

---

### 3. 🐙 GitHub MCP

#### 官方文档
- [GitHub MCP Server](https://github.com/github/github-mcp-server?tab=readme-ov-file)

#### MCP 配置

```json
{
  "mcpServers": {
    "GitHub": {
      "command": "docker run -i --rm -e GITHUB_PERSONAL_ACCESS_TOKEN ghcr.io/github/github-mcp-server",
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "your_github_token_here"
      },
      "args": []
    }
  }
}
```

> **注意**: 
> - 将 `your_github_token_here` 替换为你的 GitHub Personal Access Token
> - 需要安装 Docker
> - Token 需要 `repo` 权限

#### 如何在 Cursor 中使用

配置完成后，你可以在 Cursor 中直接管理 GitHub 仓库：

- **创建 Issue**: "在 mcp-cursor-integration 仓库中创建一个新的 issue，标题是 '修复文档错误'"
- **搜索仓库**: "搜索包含 'react' 的公开仓库"
- **查看 PR**: "列出 mcp-cursor-integration 仓库中所有打开的 pull requests"
- **读取文件**: "获取仓库 README.md 的内容"
- **创建分支**: "在仓库中创建一个新分支 feature/new-feature"
- **管理标签**: "给 issue #1 添加 'bug' 标签"

**使用场景**:
- 自动创建 bug 报告和 feature 请求
- 从代码注释生成 issue
- 批量管理项目任务
- 快速查看和更新仓库内容

---

### 4. 🔍 IDA Pro MCP

#### 官方文档
- [IDA Pro MCP](https://github.com/mrexodia/ida-pro-mcp)

#### 安装步骤

根据官方文档安装 IDA Pro MCP 服务器。

#### MCP 配置

```json
{
  "mcpServers": {
    "ida-pro-mcp": {
      "command": "/opt/homebrew/Cellar/python@3.11/3.11.6_1/Frameworks/Python.framework/Versions/3.11/bin/python3",
      "args": [
        "/opt/homebrew/lib/python3.11/site-packages/ida_pro_mcp/server.py",
        "--ida-rpc",
        "http://127.0.0.1:13337"
      ]
    }
  }
}
```

> **注意**: 
> - 路径需要根据你的实际安装位置调整
> - 确保 IDA Pro 已启动并启用 RPC 服务
> - 默认 RPC 端口为 13337

#### 如何在 Cursor 中使用

配置完成后，你可以在 Cursor 中分析二进制文件：

- **列出函数**: "列出当前二进制文件中的所有函数"
- **反汇编代码**: "反汇编地址 0x1000 处的代码"
- **查找引用**: "查找字符串 'password' 的所有引用位置"
- **分析函数**: "分析 main 函数，找出它调用的所有网络相关函数"
- **查看结构**: "列出所有结构体定义"
- **读取内存**: "读取地址 0x2000 处的 64 字节内存"

**使用场景**:
- 恶意软件分析
- 漏洞研究和代码审计
- 二进制文件逆向工程
- 安全研究

---

## 💡 使用技巧

### 配置多个 MCP 服务器

你可以在配置文件中同时配置多个 MCP 服务器：

```json
{
  "mcpServers": {
    "figma-desktop": {
      "url": "http://127.0.0.1:3845/mcp"
    },
    "Postman": {
      "url": "https://mcp.postman.com/minimal",
      "headers": {
        "Authorization": "Bearer your_postman_api_key_here"
      }
    },
    "GitHub": {
      "command": "docker run -i --rm -e GITHUB_PERSONAL_ACCESS_TOKEN ghcr.io/github/github-mcp-server",
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "your_github_token_here"
      },
      "args": []
    },
    "ida-pro-mcp": {
      "command": "/path/to/python3",
      "args": [
        "/path/to/ida_pro_mcp/server.py",
        "--ida-rpc",
        "http://127.0.0.1:13337"
      ]
    }
  }
}
```

### 安全提示

⚠️ **重要**: 
- 不要在配置文件中硬编码真实的 API 密钥和 Token
- 使用环境变量存储敏感信息
- 定期轮换 API 密钥
- 使用最小权限原则

---

## 🔧 故障排除

### MCP 服务器连接失败

1. **检查配置格式**: 确保 JSON 格式正确
2. **验证路径**: 检查命令路径和文件路径是否正确
3. **查看日志**: 在 Cursor 的开发者工具中查看错误日志
4. **重启服务**: 重启 Cursor 和相关服务
5. **网络连接**: 对于 URL 类型的服务器，检查网络连接

### 常见问题

**Q: 如何查看已配置的 MCP 服务器？**  
A: 在 Cursor Settings → Tool & MCP 中查看

**Q: MCP 服务器会影响性能吗？**  
A: 通常不会，但如果服务器执行耗时操作可能会短暂延迟响应

**Q: 可以同时使用多个 MCP 服务器吗？**  
A: 可以，在配置文件中添加多个服务器配置即可

---

## 🤝 贡献

欢迎提交 Issue 和 Pull Request 来改进本文档！

如果你有新的 MCP 服务器使用案例，欢迎分享！

---

## 📄 许可证

MIT License

---

**创建时间**: 2026年2月11日  
**最后更新**: 2026年2月11日
