# MCP 与 Cursor 联动完整指南

> 这是一个关于 MCP (Model Context Protocol) 与 Cursor 编辑器集成的完整文档和配置示例项目。

## 📚 文档导航

- **[完整文档](./MCP-Cursor-Integration.md)** - 详细的配置和使用指南
- **[快速开始](./README-MCP.md)** - 快速配置步骤
- **[GitHub 设置指南](./GITHUB-SETUP.md)** - 如何创建 GitHub 仓库
- **[项目总结](./PROJECT-SUMMARY.md)** - 项目文件说明

## 🚀 快速开始

### 1. 配置 MCP 服务器

编辑 Cursor 的 MCP 配置文件（通常位于 `~/.cursor/mcp.json` 或 `~/.config/cursor/mcp.json`）：

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

更多配置示例请查看 [mcp-config-example.json](./mcp-config-example.json)

### 2. 重启 Cursor

配置完成后重启 Cursor 以使配置生效。

## 📦 包含的内容

- ✅ 完整的 MCP 与 Cursor 集成文档
- ✅ 多个 MCP 服务器配置示例（GitHub、Postman、IDA Pro 等）
- ✅ 使用场景和最佳实践
- ✅ 常见问题解答

## 🔧 支持的 MCP 服务器

- **GitHub** - 管理 GitHub 仓库、Issues、Pull Requests
- **Postman** - 管理 API 集合和环境
- **IDA Pro** - 二进制文件分析
- **文件系统** - 文件操作和管理
- **数据库** - 数据库查询和管理

## 📖 详细文档

查看 [MCP-Cursor-Integration.md](./MCP-Cursor-Integration.md) 获取完整的使用指南。

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📄 许可证

MIT License

---

**创建时间**: 2026年2月11日
