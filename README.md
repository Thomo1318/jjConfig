# 🎨 jjConfig

> Comprehensive configuration for Jujutsu (jj) VCS with 20+ aliases, AI-powered GitMCP, and retro themes.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Version](https://img.shields.io/badge/version-1.1.0-blue.svg)](https://github.com/Thomo1318/jjConfig/releases)
[![jj](https://img.shields.io/badge/jj-0.23.0+-purple.svg)](https://github.com/jj-vcs/jj)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

---

## ✨ Features

- ⚡ 20+ command aliases for efficient workflows
- 🔍 Smart revsets for advanced commit selection
- 🔗 Git integration with colocated repo support
- 🤖 GitMCP: AI context generation via local Git hooks
- 📦 Repomix: Full repository consolidation for AI context injection
- 🖥️ TUI support: jj-fzf, lazyjj, and gg integration
- 📚 21 reference files for tiered configurations
- 📦 SemVer tracking and versioned backups
- 🚀 Makefile: one-command symlink deployment
- 🎨 Synthwave84 color scheme (retro-futuristic, 30+ custom terminal colors)

---

## 📋 Table of Contents

- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Installation](#installation)
- [Usage](#usage)
- [Basic Workflow](#basic-workflow)
- [Configuration](#configuration)
- [GitMCP Integration](#gitmcp-integration)
- [Repomix Integration](#repomix-integration)
- [Directory Structure](#directory-structure)
- [Version History](#version-history)
- [Contributing](#contributing)
- [Troubleshooting](#troubleshooting)
- [License](#license)

---

## 🔧 Prerequisites

| Requirement    | Version   | Installation                                                  |
| -------------- | --------- | ------------------------------------------------------------ |
| **Jujutsu (jj)** | 0.23.0+  | `brew install jj` or [build from source](https://github.com/jj-vcs/jj) |
| **Git**         | 2.40+     | `brew install git`                                           |
| **Bash**        | 4.0+      | Pre-installed on macOS/Linux                                 |
| **Make**        | 3.81+     | Pre-installed on macOS/Linux                                 |

**Optional:**  
- [jj-fzf](https://github.com/Cretezy/jj-fzf)  
- [lazyjj](https://github.com/Cretezy/lazyjj)  
- [gg](https://github.com/gulbanana/gg)  
- [micro editor](https://micro-editor.github.io/)  

---

## 🚀 Quick Start

For a fast setup, see [QUICKSTART.md](QUICKSTART.md).

```bash
# Clone and deploy
git clone https://github.com/Thomo1318/jjConfig.git ~/.config/jjConfig
cd ~/.config/jjConfig
make deploy

# Verify
jj config list user

# Initialize new project with GitMCP
mkdir my-project && cd my-project
jj init
```

---

## 📝 Installation

```bash
# Symlink deployment
make deploy
# Backup is automatic; for manual backup:
cp -r ~/.config/jj ~/.config/jj.backup-$(date +%Y%m%d-%H%M%S)
# Verify:
jj config list user
```

---

## 💡 Usage

### Basic Commands

```bash
jj init      # Initialize repo (with GitMCP)
jj st        # Status
jj ll        # Log last 20 commits
jj d         # Diff
jj ci        # Commit interactively
jj push      # Push bookmarks
jj sync      # Sync remotes
# Launch TUIs
jj fzf       # jj-fzf
jj tui       # lazyjj
jj ui        # gg
```
More aliases, advanced workflows, and troubleshooting: see [`aliases/README.md`](aliases/README.md).

---

## 🔁 Basic Workflow

```bash
# 1. Start working
jj new

# 2. Make changes
echo "Some content" >> file.txt

# 3. Check what changed
jj st
jj d

# 4. Describe your change
jj describe -m "feat: add new feature"

# 5. Push to remote
jj push
```

---

## ⚙️ Configuration

Main config: `config.toml` (v1.1.0-mcp-integration)

Sections include:
- `[user]` name and email
- `[ui]` editor, pager, colors
- `[git]` integration settings
- `[templates]` log and show templates
- `[revset-aliases]` custom commit queries

Reference documentation:
- [`aliases/README.md`](aliases/README.md) for command aliases and workflow scripts
- [`revsets/README.md`](revsets/README.md) for revset language and practical queries
- [`ui-configs/README.md`](ui-configs/README.md) for UI, color, and diff/pager settings
- [`git-configs/README.md`](git-configs/README.md) for extra Git integration and multiple remote configuration
- [`template-configs/README.md`](template-configs/README.md) for output formatting and template aliasing
- [`revsets-config/README.md`](revsets-config/README.md) for `[revsets]` log/graph/view behaviors

Above files have verified relevant documentation for usage and implementation.

---

## 🤖 GitMCP Integration

GitMCP provides local AI repository context for tools—no API tokens required.

**How It Works:**  
- Git hooks (`post-commit`, `post-merge`, `post-checkout`) generate `.mcp/context.json`  
- 100% local processing  
- Compatible with IDEs and desktop AIs

**Setup:**  
```bash
cat .mcp/cursor-config.json >> ~/.cursor/mcp.json       # Cursor IDE
cat .mcp/claude-config.json >> ~/Library/Application\ Support/Claude/claude_desktop_config.json   # Claude Desktop
```
MCP server URL:  
`https://gitmcp.io/Thomo1318/jjConfig`

See [MCP docs](https://gitmcp.io/docs) for details.

---

## 📦 Repomix Integration

Repomix consolidates your entire repository into a single AI-friendly file for context injection.

**How It Works:**  
- Git hooks automatically generate `.repomix/repomix-latest.txt` after commits  
- Contains full repository content optimized for AI tools  
- Includes token counts and file statistics  
- Automatic cleanup (keeps last 3 versions)

**Generated Files:**  
```
.repomix/
├── context.json              # Metadata and usage info
├── repomix-latest.txt        # Symlink to latest (use this!)
├── repomix-repo-TIMESTAMP.txt  # Latest generation
└── repomix-repo-TIMESTAMP.txt  # Previous versions
```

**Usage:**  
```bash
# Copy to AI tool
cat .repomix/repomix-latest.txt | pbcopy

# Check token count
repomix --token-count-tree 50 .

# View file stats
wc -l .repomix/repomix-latest.txt
```

**Aliases:**  
```bash
jj repomix-update    # Install/update hooks
jj repomix-status    # Show status
jj repomix-generate  # Manual generation
jj repomix-view      # Open in editor
jj repomix-tokens    # Show token counts
```

**Install repomix:** `npm install -g repomix`  
See [templates/repomix-hooks/README.md](templates/repomix-hooks/README.md) for details.

---

## 📂 Directory Structure

```
jjConfig/
├── README.md                 # Main guide
├── QUICKSTART.md             # 5-min setup
├── CONTRIBUTING.md           # Dev guides
├── TROUBLESHOOTING.md        # Issue help
├── TASKS.md                  # Roadmap
├── LICENSE                   # MIT
├── Makefile                  # Deploy script
├── config.toml               # Main config
├── .mcp/                     # GitMCP context
│   ├── context.json
│   ├── cursor-config.json
│   ├── claude-config.json
│   └── README.md
├── .repomix/                 # Repomix AI context
│   ├── context.json
│   ├── repomix-latest.txt
│   └── repomix-*.txt
├── aliases/                  # Alias configs
│   ├── README.md
│   └── ...
├── revsets/                  # Revset configs
│   ├── README.md
│   └── ...
├── ui-configs/               # UI configs
│   ├── README.md
│   └── ...
├── git-configs/              # Git config
│   ├── README.md
│   └── ...
├── template-configs/         # Output templates
│   ├── README.md
│   └── ...
├── revsets-config/           # Revsets section config
│   ├── README.md
│   └── ...
└── backups/                  # Version history
```

---

## 📜 Version History

| Version   | Date        | Description                        |
| --------- | ---------- | ----------------------------------- |
| v1.1.0    | 2025-11-07 | GitMCP integration, hooks, AI gen   |
| v1.0.0    | 2025-11-01 | Synthwave84, aliases, references    |
| v0.1.0    | 2025-11-01 | Original basic config               |

Full changelog: [`backups/VERSION_HISTORY.md`](backups/VERSION_HISTORY.md)  
Roadmap: [`TASKS.md`](TASKS.md)

---

## 🤝 Contributing

Contributions welcome!  
- See [`CONTRIBUTING.md`](CONTRIBUTING.md) for setup, backups, code style, PR process.

---

## 🐛 Troubleshooting

See [`TROUBLESHOOTING.md`](TROUBLESHOOTING.md) for common issues:
- Installation
- Symlinks
- GitMCP hook failures
- Color scheme
- Aliases

---

## 📄 License

MIT License. See [LICENSE](LICENSE).

---

## 👤 Author

**Thomo1318**  
Email: <steele.thompson13@gmail.com>  
GitHub: [@Thomo1318](https://github.com/Thomo1318)

---

## 🙏 Acknowledgments

- Jujutsu VCS
- jj Community
- GitMCP
- Synthwave84 color scheme

---

## ⭐ Additional Resources

- [jj docs](https://jj-vcs.github.io/jj/latest/)
- [jj tutorial](https://github.com/jj-vcs/jj)
- [Revset language](https://github.com/jj-vcs/jj/discussions)
- [jj Discord](https://discord.gg/dkmfj3aGQN)

<div align="center">

⭐ Star this repo if you find it helpful!
Report bugs · Request features · Join discussions

</div>
