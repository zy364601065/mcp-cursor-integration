# MCP 与 Cursor 联动完整指南

> 这是一个关于 MCP (Model Context Protocol) 与 Cursor 编辑器集成的完整文档和配置示例项目。

# 什么是MCP
[Model Context Protocol（MCP）](https://modelcontextprotocol.io/docs/getting-started/intro) 让 Cursor 可以连接到外部工具和数据源

## 📚 文档导航

- **[完整文档](https://cursor.com/cn/docs/context/mcp#mcp)** - 详细的信息和使用指南

## 🚀 快速开始

### 1. 配置 MCP 服务器
1.打开 Cursor → Settings → Cursor Settings.
2.找到 Tool & MCP.
3.新增 New MCP server.

## 使用案例
### 1. figma
官方文档
https://help.figma.com/hc/en-us/articles/35281186390679-Figma-MCP-collection-How-to-setup-the-Figma-desktop-MCP-server
https://developers.figma.com/docs/figma-mcp-server/local-server-installation/
视频教程 
https://www.youtube.com/watch?v=nPnkMPabCfI

mcp
"figma-desktop": {
       "url": "http://127.0.0.1:3845/mcp"
     }
新增如何跟cursor使用
.....

### 2. postman
mcp
"Postman": {
      "url": "https://mcp.postman.com/minimal",
      "headers": {
        "Authorization": "Bearer your_postman_api_key_here"
      }
    },
新增如何跟cursor使用
.....

### 3. gitHub
文档 https://github.com/github/github-mcp-server?tab=readme-ov-file
mcp
"GitHub": {
      "command": "docker run -i --rm -e GITHUB_PERSONAL_ACCESS_TOKEN ghcr.io/github/github-mcp-server",
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "your_github_token_here"
      },
      "args": []
    },
新增如何跟cursor使用
.....

### 4. ida
根据文档  https://github.com/mrexodia/ida-pro-mcp 安装需要的mcp
新增如何跟cursor使用
.....

## 📖 详细文档

查看 [MCP-Cursor-Integration.md](./MCP-Cursor-Integration.md) 获取完整的使用指南。

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📄 许可证

MIT License

---

**创建时间**: 2026年2月11日
