+++
title = "jjConfig"
description = "Comprehensive configuration for Jujutsu (jj) VCS with 20+ aliases, AI-powered GitMCP, and retro themes."
archetype = "home"
weight = 1
+++

# 🎨 jjConfig

> Comprehensive configuration for Jujutsu (jj) VCS with 20+ aliases, AI-powered GitMCP, and retro themes.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Version](https://img.shields.io/badge/version-1.1.0-blue.svg)](https://github.com/Thomo1318/jjConfig/releases)
[![jj](https://img.shields.io/badge/jj-0.23.0+-purple.svg)](https://github.com/jj-vcs/jj)

---

## ✨ Features

- ⚡ **20+ command aliases** for efficient workflows
- 🔗 **Git & GitHub Integration** with colocated repo support
- 🤖 **GitMCP**: AI context generation via local Git hooks
- 📦 **Repomix**: Full repository consolidation for AI context injection
- 🖥️ **TUI support**: jj-fzf, lazyjj, and gg integration
- 🎨 **Synthwave84** color scheme (retro-futuristic)
- 🔒 **Security**: Pre-push hooks, PII sanitization, and secret scanning

---

## 🚀 Quick Start

```bash
# Clone and deploy
git clone https://github.com/Thomo1318/jjConfig.git ~/.config/jjConfig
cd ~/.config/jjConfig
make deploy

# Verify
jj config list user
```

---

## 📂 Directory Structure

```
jjConfig/
├── docs/                     # 📚 Centralized Documentation
│   ├── guides/               # Setup, Contributing, Usage
│   ├── reference/            # Aliases, Architecture
│   └── architecture/         # Deep dive notes
├── config.toml               # Main config
├── .mcp/                     # GitMCP context
├── .repomix/                 # Repomix AI context
└── aliases/, revsets/, ...   # Config modules
```

---

## 🤝 Contributing

Contributions are welcome! Please read the **[Contributing Guide](guides/contributing/)** for details.

---

## 📄 License

MIT License. See [LICENSE](https://github.com/Thomo1318/jjConfig/blob/main/LICENSE).
