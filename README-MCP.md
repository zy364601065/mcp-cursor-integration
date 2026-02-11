# MCP 与 Cursor 联动项目

这是一个关于 MCP (Model Context Protocol) 与 Cursor 编辑器集成的完整文档和示例项目。

## 📚 文档

详细文档请查看: [MCP-Cursor-Integration.md](./MCP-Cursor-Integration.md)

## 🚀 快速开始

### 1. 安装 Cursor

访问 [Cursor 官网](https://cursor.sh/) 下载并安装最新版本。

### 2. 配置 MCP 服务器

编辑 Cursor 的 MCP 配置文件（通常位于 `~/.cursor/mcp.json`）：

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "your_token_here"
      }
    }
  }
}
```

### 3. 重启 Cursor

配置完成后重启 Cursor 以使配置生效。

## 📦 包含的 MCP 服务器示例

本项目文档涵盖了以下 MCP 服务器：

- ✅ GitHub MCP Server
- ✅ Postman MCP Server  
- ✅ IDA Pro MCP Server
- ✅ 文件系统 MCP Server
- ✅ 数据库 MCP Server

## 🔧 配置示例

### GitHub MCP

```json
{
  "github": {
    "command": "npx",
    "args": ["-y", "@modelcontextprotocol/server-github"],
    "env": {
      "GITHUB_PERSONAL_ACCESS_TOKEN": "ghp_xxxxxxxxxxxx"
    }
  }
}
```

### Postman MCP

```json
{
  "postman": {
    "command": "npx",
    "args": ["-y", "@modelcontextprotocol/server-postman"],
    "env": {
      "POSTMAN_API_KEY": "PMAK-xxxxxxxxxxxx"
    }
  }
}
```

## 📖 使用场景

1. **代码开发**: 通过 GitHub MCP 管理代码仓库
2. **API 测试**: 使用 Postman MCP 测试和管理 API
3. **二进制分析**: 通过 IDA Pro MCP 分析二进制文件
4. **文件管理**: 使用文件系统 MCP 管理项目文件
5. **数据查询**: 通过数据库 MCP 查询和管理数据

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📄 许可证

MIT License
