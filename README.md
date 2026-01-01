# 🎨 jjConfig

> Comprehensive configuration for Jujutsu (jj) VCS with 20+ aliases, AI-powered GitMCP, and retro themes.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Version](https://img.shields.io/badge/version-1.1.0-blue.svg)](https://github.com/Thomo1318/jjConfig/releases)
[![jj](https://img.shields.io/badge/jj-0.23.0+-purple.svg)](https://github.com/jj-vcs/jj)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](docs/guides/contributing.md)

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

## 📚 Documentation

| Guide                                           | Description                                   |
| :---------------------------------------------- | :-------------------------------------------- |
| **[Setup Guide](docs/guides/setup.md)**         | Installation, prerequisites, and quick start. |
| **[User Guide](docs/guides/usage.md)**          | Basic workflows, Repomix, and TUI usage.      |
| **[Contributing](docs/guides/contributing.md)** | How to backup, test, and submit PRs.          |
| **[Troubleshooting](TROUBLESHOOTING.md)**       | Solutions for common installation issues.     |

### ⚙️ Reference

- **[Aliases](docs/reference/aliases.md)**: Full list of custom commands.
- **[Configuration](config.toml)**: Main configuration file (v1.1.0).
- **[Tasks & Roadmap](TASKS.md)**: Project status and future plans.
- **[Version History](backups/VERSION_HISTORY.md)**: Changelog and release notes.

---

## 🚀 Quick Start

For a fast setup, see the **[Setup Guide](docs/guides/setup.md)**.

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

Contributions are welcome! Please read the **[Contributing Guide](docs/guides/contributing.md)** for details on our "Golden Workflow" and code standards.

All PRs must pass:

1.  **Security Checks** (GitGuardian)
2.  **Linting** (Trunk.io)
3.  **Validation** (Workflow tests)

---

## 📄 License

MIT License. See [LICENSE](LICENSE).

---

## 👤 Author

**Thomo1318**
Email: <YOUR_EMAIL@example.com>
GitHub: [@Thomo1318](https://github.com/Thomo1318)
