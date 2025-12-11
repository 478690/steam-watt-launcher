# Steam & Watt Toolkit 自动启动器

一个智能的 Windows 批处理脚本，用于自动检测并启动 Steam 和 Watt Toolkit。

## 📋 项目简介

本项目提供了一个完全通用的批处理脚本，能够自动检测系统上的 Steam 和 Watt Toolkit 安装位置，并按正确顺序启动它们。脚本具有智能搜索功能，无需硬编码路径，可在任何 Windows 电脑上正常工作。

## ✨ 主要功能

- 🚀 **智能检测**: 自动检测 Steam 和 Watt Toolkit 的安装位置
- 🔄 **通用兼容**: 使用环境变量，无需硬编码路径
- 📁 **多重搜索**: 支持当前目录、用户目录、程序目录等多个位置搜索
- 🛡️ **安全可靠**: 注册表优先检测，避免权限问题
- 🎯 **自动启动**: 按正确顺序启动程序（Steam → Watt Toolkit）
- 💬 **友好反馈**: 详细的启动状态提示和进度显示
- ⏰ **自动关闭**: 任务完成后自动关闭窗口

## 🚀 快速开始

### 使用方法

1. 下载 `steam-watt-launcher.bat` 文件
2. 双击运行即可自动启动 Steam 和 Watt Toolkit

### 系统要求

- Windows 操作系统
- 已安装 Steam
- 已安装 Watt Toolkit

## 🔧 工作原理

### 搜索策略

1. **Steam 检测**:
   - 首先查询 Windows 注册表
   - 然后检查常见安装位置
   - 支持 Program Files 和其他驱动器

2. **Watt Toolkit 检测**:
   - 当前目录
   - 用户配置目录（Documents、Downloads、AppData）
   - 父级目录
   - 程序安装目录
   - 桌面（作为备选）

### 环境变量使用

脚本使用以下标准 Windows 环境变量确保跨电脑兼容性：

- `%ProgramFiles%` - 32位程序目录
- `%ProgramFiles(x86)%` - 64位程序目录  
- `%USERPROFILE%` - 用户主目录
- `%APPDATA%` - 应用程序数据目录

## 📂 支持的文件格式

### Watt Toolkit
- Watt Toolkit.exe
- Watt Toolkit.lnk
- watt-toolkit.exe
- watt-toolkit.lnk
- 任意包含 "Watt" 或 "watt" 的可执行文件或快捷方式

### Steam
- Steam.exe（通过注册表自动检测）
- 支持各种 Steam 安装位置

## 🛠️ 故障排除

### 常见问题

**Q: 脚本提示找不到程序？**
A: 请确保程序已正确安装，并尝试以管理员身份运行脚本。

**Q: 启动失败但文件存在？**
A: 检查文件权限，或尝试将文件移动到用户目录。

**Q: 在其他电脑上无法工作？**
A: 本脚本专为跨电脑兼容性设计，如仍有问题请检查目标电脑的路径配置。

### 日志信息

脚本会显示详细的搜索和启动过程：

```
Searching for Steam...
Checking registry...
Found Steam via registry: "C:\Program Files (x86)\Steam\Steam.exe"
Steam path is accessible.

Searching for Watt Toolkit...
Searching in current directory...
Found Watt Toolkit in parent userfull directory
```

## 📝 版本历史

### v5.1 (最新)
- 优化搜索策略，优先搜索可靠位置
- 增强跨电脑兼容性
- 改进错误处理和用户反馈

### v5.0
- 移除所有硬编码路径
- 实现完全通用化
- 支持动态环境变量

### v4.x
- 修复中文路径和特殊字符问题
- 解决带空格路径的处理
- 改进注册表解析逻辑

## 🤝 贡献

欢迎提交 Issue 和 Pull Request 来改进这个项目！

### 贡献指南

1. Fork 本仓库
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 打开 Pull Request

## 📄 许可证

本项目采用 MIT 许可证 - 查看 [LICENSE](LICENSE) 文件了解详情

## ⚠️ 免责声明

本脚本仅用于学习和个人使用。使用前请确保您有权限在目标系统上运行此脚本。作者不对使用此脚本造成的任何问题承担责任。

## 🔗 相关链接

- [Watt Toolkit 官网](https://steampp.net/)
- [Steam 官网](https://store.steampowered.com/)

---

**作者**: 自动化脚本开发  
**最后更新**: 2025年12月

如果这个项目对您有帮助，请考虑给个 ⭐️ Star！