# MCP 与 Cursor 联动完整指南

## 📖 目录

1. [什么是 MCP](#什么是-mcp)
2. [什么是 Cursor](#什么是-cursor)
3. [MCP 与 Cursor 的集成](#mcp-与-cursor-的集成)
4. [配置步骤](#配置步骤)
5. [可用的 MCP 服务器](#可用的-mcp-服务器)
6. [使用示例](#使用示例)
7. [常见问题](#常见问题)
8. [最佳实践](#最佳实践)

---

## 什么是 MCP

**MCP (Model Context Protocol)** 是一个开放协议，允许 AI 助手（如 Cursor）与外部工具和服务进行安全、标准化的交互。MCP 提供了一种统一的方式来：

- 访问外部资源（文件、数据库、API等）
- 执行工具和操作
- 获取实时数据
- 扩展 AI 助手的能力

### MCP 的核心概念

- **服务器 (Servers)**: 提供特定功能的 MCP 服务
- **资源 (Resources)**: 可访问的数据或内容
- **工具 (Tools)**: 可执行的操作
- **提示 (Prompts)**: 预定义的提示模板

---

## 什么是 Cursor

**Cursor** 是一款基于 AI 的代码编辑器，专为开发者设计。它集成了强大的 AI 助手，可以帮助：

- 代码生成和补全
- 代码重构和优化
- 错误诊断和修复
- 代码解释和文档生成
- 与外部工具集成（通过 MCP）

---

## MCP 与 Cursor 的集成

通过 MCP 协议，Cursor 可以连接到各种 MCP 服务器，扩展其功能。这使得 Cursor 能够：

1. **访问外部数据源**: 如数据库、文件系统、API
2. **执行外部工具**: 如 Git 操作、构建工具、测试框架
3. **集成第三方服务**: 如 GitHub、Postman、IDA Pro 等
4. **自定义工作流**: 创建符合个人需求的自动化流程

---

## 配置步骤

### 1. 安装 Cursor

确保你已经安装了最新版本的 Cursor 编辑器。

### 2. 配置 MCP 服务器

在 Cursor 中配置 MCP 服务器需要编辑配置文件。配置文件通常位于：

**macOS/Linux**: `~/.cursor/mcp.json` 或 `~/.config/cursor/mcp.json`  
**Windows**: `%APPDATA%\Cursor\mcp.json`

### 3. 配置文件示例

```json
{
  "mcpServers": {
    "figma-desktop": {
      "url": "http://127.0.0.1:3845/mcp"
    },
    "GitHub": {
      "command": "docker run -i --rm -e GITHUB_PERSONAL_ACCESS_TOKEN ghcr.io/github/github-mcp-server",
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "your_github_token_here"
      },
      "args": []
    },
    "Postman": {
      "url": "https://mcp.postman.com/minimal",
      "headers": {
        "Authorization": "Bearer your_postman_api_key_here"
      }
    },
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

### 4. 重启 Cursor

配置完成后，重启 Cursor 以使配置生效。

---

## 可用的 MCP 服务器

### 1. Figma Desktop MCP Server

**功能**:
- 访问 Figma 设计文件
- 获取设计资源和组件信息
- 读取设计规范和样式
- 与 Figma 桌面应用交互

**配置**:
```json
{
  "mcpServers": {
    "figma-desktop": {
      "url": "http://127.0.0.1:3845/mcp"
    }
  }
}
```

**使用示例**:
- "获取当前打开的 Figma 文件信息"
- "列出设计文件中的所有组件"
- "读取某个设计元素的样式属性"
- "导出设计资源"

### 2. GitHub MCP Server

**功能**:
- 搜索和管理 GitHub 仓库
- 创建和管理 Issues 和 Pull Requests
- 访问仓库内容和元数据
- 管理分支和标签

**配置**:
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

**使用示例**:
- "搜索包含 'react' 的仓库"
- "在仓库中创建一个新的 issue"
- "列出所有打开的 pull requests"
- "获取仓库的 README 内容"
- "创建新的分支并推送代码"

### 3. Postman MCP Server

**功能**:
- 管理 Postman 集合
- 创建和运行 API 请求
- 管理环境和变量
- 生成 API 文档

**配置**:
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

**使用示例**:
- "创建一个新的 Postman 集合"
- "运行集合中的所有请求"
- "更新环境变量"
- "获取 API 请求的响应结果"
- "导出集合为 OpenAPI 规范"

### 4. IDA Pro MCP Server

**功能**:
- 反汇编和分析二进制文件
- 查找函数和交叉引用
- 读取和修改内存
- 类型推断和结构分析

**配置**:
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

**使用示例**:
- "列出所有函数"
- "反汇编指定地址的代码"
- "查找字符串引用"
- "分析函数的调用关系"
- "读取指定地址的内存内容"

---

## 使用示例

### 示例 1: 使用 Figma Desktop MCP 获取设计信息

**场景**: 开发者需要从 Figma 设计中获取颜色和字体信息

```
用户: "获取当前 Figma 文件中使用的所有颜色值"

Cursor (通过 MCP): 
1. 连接到 Figma Desktop MCP 服务器 (http://127.0.0.1:3845/mcp)
2. 获取当前打开的 Figma 文件
3. 遍历所有设计元素，提取颜色信息
4. 返回颜色列表，包含 HEX 和 RGB 值
5. 生成可直接在代码中使用的颜色常量
```

**实际应用**:
- 从设计稿中提取设计令牌（Design Tokens）
- 自动生成 CSS 变量或主题配置
- 同步设计系统中的颜色和字体

---

### 示例 2: 使用 GitHub MCP 创建 Issue

**场景**: 在开发过程中发现 bug，需要创建 GitHub Issue

```
用户: "在 mcp-cursor-integration 仓库中创建一个新的 issue，标题是 '修复文档中的日期错误'，描述是 '文档中的创建日期需要更新为当前日期'"

Cursor (通过 MCP): 
1. 连接到 GitHub MCP 服务器（通过 Docker 容器）
2. 使用 Personal Access Token 进行认证
3. 搜索仓库 "zy364601065/mcp-cursor-integration"
4. 创建新的 issue，包含标题和描述
5. 返回 issue 链接: https://github.com/zy364601065/mcp-cursor-integration/issues/1
```

**实际应用**:
- 自动创建 bug 报告
- 从代码注释生成 issue
- 批量管理项目任务

---

### 示例 3: 使用 Postman MCP 测试 API

**场景**: 需要测试新开发的 API 端点

```
用户: "在 Postman 中运行 '用户认证 API' 集合，并显示所有失败的请求"

Cursor (通过 MCP):
1. 连接到 Postman MCP 服务器 (https://mcp.postman.com/minimal)
2. 使用 Bearer Token 进行认证
3. 查找名为 '用户认证 API' 的集合
4. 执行集合中的所有请求
5. 分析响应结果，识别失败的请求
6. 返回详细的测试报告，包含：
   - 成功/失败的请求数量
   - 每个请求的响应状态码
   - 错误信息和堆栈跟踪
```

**实际应用**:
- 自动化 API 测试流程
- CI/CD 集成测试
- API 健康检查
- 性能监控

---

### 示例 4: 使用 IDA Pro MCP 分析二进制文件

**场景**: 逆向工程师需要分析恶意软件的行为

```
用户: "分析二进制文件中的 main 函数，找出它调用的所有网络相关函数"

Cursor (通过 MCP):
1. 连接到 IDA Pro MCP 服务器（通过 Python 脚本）
2. 连接到 IDA Pro RPC 服务 (http://127.0.0.1:13337)
3. 查找 main 函数地址
4. 反汇编 main 函数代码
5. 分析函数调用图，找出所有网络相关的函数调用（如 socket, connect, send, recv）
6. 返回分析结果，包含：
   - main 函数的完整反汇编代码
   - 调用关系图
   - 网络相关函数的地址和参数
   - 潜在的安全风险提示
```

**实际应用**:
- 恶意软件分析
- 漏洞研究
- 代码审计
- 二进制文件逆向工程

---

## 常见问题

### Q1: 如何查看已安装的 MCP 服务器？

**A**: 在 Cursor 中，你可以通过以下方式查看：
- 打开 Cursor 设置
- 导航到 MCP 配置部分
- 查看已配置的服务器列表

### Q2: MCP 服务器连接失败怎么办？

**A**: 检查以下几点：
1. 确保服务器命令路径正确
2. 检查环境变量配置
3. 查看 Cursor 的日志文件
4. 验证网络连接（如果需要）

### Q3: 如何创建自定义 MCP 服务器？

**A**: 
1. 使用 MCP SDK 创建服务器
2. 实现必要的接口（资源、工具、提示）
3. 在 Cursor 配置文件中注册服务器
4. 重启 Cursor

### Q4: MCP 服务器会影响 Cursor 的性能吗？

**A**: 
- MCP 服务器在后台运行，通常不会显著影响性能
- 如果服务器执行耗时操作，可能会短暂延迟响应
- 建议只启用需要的服务器

### Q5: 如何调试 MCP 服务器？

**A**:
1. 查看 Cursor 的开发者工具
2. 检查服务器日志
3. 使用 MCP 客户端工具测试服务器
4. 验证服务器配置和权限

---

## 最佳实践

### 1. 安全配置

- **保护敏感信息**: 使用环境变量存储 API 密钥和令牌
- **限制权限**: 只授予 MCP 服务器必要的权限
- **定期更新**: 保持 MCP 服务器和 Cursor 的最新版本

### 2. 性能优化

- **按需启用**: 只启用你实际使用的 MCP 服务器
- **缓存结果**: 对于频繁访问的数据，考虑使用缓存
- **异步操作**: 对于耗时操作，使用异步处理

### 3. 组织配置

- **使用配置文件**: 将配置保存在版本控制中
- **文档化**: 记录每个 MCP 服务器的用途和配置
- **团队共享**: 与团队共享最佳实践和配置

### 4. 错误处理

- **优雅降级**: 当 MCP 服务器不可用时，提供备用方案
- **错误日志**: 记录错误信息以便调试
- **用户反馈**: 向用户提供清晰的错误消息

### 5. 扩展性

- **模块化设计**: 将功能拆分为独立的 MCP 服务器
- **标准化接口**: 遵循 MCP 协议标准
- **可重用组件**: 创建可重用的工具和资源

---

## 资源链接

### 官方文档
- [MCP 官方文档](https://modelcontextprotocol.io/)
- [Cursor 官方文档](https://cursor.sh/docs)
- [MCP 规范](https://spec.modelcontextprotocol.io/)

### MCP 服务器
- [GitHub MCP Server](https://github.com/modelcontextprotocol/servers/tree/main/src/github)
- [Postman MCP Server](https://github.com/modelcontextprotocol/servers/tree/main/src/postman)
- [文件系统 MCP Server](https://github.com/modelcontextprotocol/servers/tree/main/src/filesystem)

### 社区资源
- [MCP 社区论坛](https://github.com/modelcontextprotocol)
- [Cursor 社区](https://cursor.sh/community)
- [示例项目](https://github.com/modelcontextprotocol/examples)

---

## 更新日志

### 2026-02-11
- 初始版本
- 添加基本配置说明
- 添加常见 MCP 服务器介绍

---

## 贡献

欢迎提交 Issue 和 Pull Request 来改进本文档！

---

## 许可证

本文档采用 MIT 许可证。

---

**最后更新**: 2026年2月11日
