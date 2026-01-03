# 🎨 jjConfig

> Comprehensive configuration for Jujutsu (jj) VCS with 20+ aliases, AI-powered GitMCP, and retro themes.

[![Version](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/Thomo1318/e766526dd2d577b808dc24e114e1cd0b/raw/version.json)](https://github.com/Thomo1318/jjConfig/releases)
[![GitGuardian](https://img.shields.io/github/actions/workflow/status/Thomo1318/jjConfig/ggshield.yml?label=Security&logo=gitguardian)](https://github.com/Thomo1318/jjConfig/actions/workflows/ggshield.yml)
![CodeRabbit Badge](https://img.shields.io/badge/CodeRabbit-FF570A?logo=coderabbit&logoColor=fff&style=flat)

[![Docs](https://img.shields.io/github/actions/workflow/status/Thomo1318/jjConfig/ci-docs.yml?label=Docs&logo=materialformkdocs)](https://github.com/Thomo1318/jjConfig/actions/workflows/ci-docs.yml)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![Jujutsu](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/Thomo1318/e766526dd2d577b808dc24e114e1cd0b/raw/jj.json)](https://github.com/jj-vcs/jj)
[![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?logo=gnu-bash&logoColor=white)]()
![TOML Badge](https://img.shields.io/badge/TOML-9C4121?logo=toml&logoColor=fff&style=flat)
![JSON Badge](https://img.shields.io/badge/JSON-000?logo=json&logoColor=fff&style=flat)
[![Repo Size](https://img.shields.io/github/repo-size/Thomo1318/jjConfig)]()
[![Last Commit](https://img.shields.io/github/last-commit/Thomo1318/jjConfig?color=red)]()
[![Repomix](https://img.shields.io/badge/Repomix-packaged-blue)](https://repomix.com)
[![DeepWiki](https://img.shields.io/badge/DeepWiki-Thomo1318%2FjjConfig-blue.svg?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAyCAYAAAAnWDnqAAAAAXNSR0IArs4c6QAAA05JREFUaEPtmUtyEzEQhtWTQyQLHNak2AB7ZnyXZMEjXMGeK/AIi+QuHrMnbChYY7MIh8g01fJoopFb0uhhEqqcbWTp06/uv1saEDv4O3n3dV60RfP947Mm9/SQc0ICFQgzfc4CYZoTPAswgSJCCUJUnAAoRHOAUOcATwbmVLWdGoH//PB8mnKqScAhsD0kYP3j/Yt5LPQe2KvcXmGvRHcDnpxfL2zOYJ1mFwrryWTz0advv1Ut4CJgf5uhDuDj5eUcAUoahrdY/56ebRWeraTjMt/00Sh3UDtjgHtQNHwcRGOC98BJEAEymycmYcWwOprTgcB6VZ5JK5TAJ+fXGLBm3FDAmn6oPPjR4rKCAoJCal2eAiQp2x0vxTPB3ALO2CRkwmDy5WohzBDwSEFKRwPbknEggCPB/imwrycgxX2NzoMCHhPkDwqYMr9tRcP5qNrMZHkVnOjRMWwLCcr8ohBVb1OMjxLwGCvjTikrsBOiA6fNyCrm8V1rP93iVPpwaE+gO0SsWmPiXB+jikdf6SizrT5qKasx5j8ABbHpFTx+vFXp9EnYQmLx02h1QTTrl6eDqxLnGjporxl3NL3agEvXdT0WmEost648sQOYAeJS9Q7bfUVoMGnjo4AZdUMQku50McDcMWcBPvr0SzbTAFDfvJqwLzgxwATnCgnp4wDl6Aa+Ax283gghmj+vj7feE2KBBRMW3FzOpLOADl0Isb5587h/U4gGvkt5v60Z1VLG8BhYjbzRwyQZemwAd6cCR5/XFWLYZRIMpX39AR0tjaGGiGzLVyhse5C9RKC6ai42ppWPKiBagOvaYk8lO7DajerabOZP46Lby5wKjw1HCRx7p9sVMOWGzb/vA1hwiWc6jm3MvQDTogQkiqIhJV0nBQBTU+3okKCFDy9WwferkHjtxib7t3xIUQtHxnIwtx4mpg26/HfwVNVDb4oI9RHmx5WGelRVlrtiw43zboCLaxv46AZeB3IlTkwouebTr1y2NjSpHz68WNFjHvupy3q8TFn3Hos2IAk4Ju5dCo8B3wP7VPr/FGaKiG+T+v+TQqIrOqMTL1VdWV1DdmcbO8KXBz6esmYWYKPwDL5b5FA1a0hwapHiom0r/cKaoqr+27/XcrS5UwSMbQAAAABJRU5ErkJggg==)](https://deepwiki.com/Thomo1318/jjConfig)
[![GitMCP](https://img.shields.io/badge/Git-MCP-blue?logo=git)](https://gitmcp.io/Thomo1318/jjConfig)

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
