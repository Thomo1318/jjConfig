# 🎨 jjConfig

> Comprehensive configuration for Jujutsu (jj) VCS with 20+ aliases, AI-powered GitMCP, and retro themes.

| 🟢 **Status**                                                                                                                                                                                                                                                                                                                                                                                                                                                 | 🔍 **Quality**                                                                                                                                                                                                                                                                                                                                                            | ℹ️ **Meta**                                                                                                                                                                                                                                                                                                               |
| :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [![GitGuardian](https://img.shields.io/github/actions/workflow/status/Thomo1318/jjConfig/ggshield.yml?label=Security&logo=gitguardian&style=flat-square)](https://github.com/Thomo1318/jjConfig/actions/workflows/ggshield.yml) <br> [![Docs](https://img.shields.io/github/actions/workflow/status/Thomo1318/jjConfig/ci-docs.yml?label=Docs&logo=materialformkdocs&style=flat-square)](https://github.com/Thomo1318/jjConfig/actions/workflows/ci-docs.yml) | [![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?style=flat-square&logo=conventionalcommits&logoColor=white)](https://conventionalcommits.org) <br> [![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?style=flat-square&logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit) | [![Version](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/Thomo1318/e766526dd2d577b808dc24e114e1cd0b/raw/version.json&style=flat-square)](https://github.com/Thomo1318/jjConfig/releases) <br> [![License](https://img.shields.io/github/license/Thomo1318/jjConfig?style=flat-square)](LICENSE) |

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
