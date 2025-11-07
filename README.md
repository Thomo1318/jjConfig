# 🎨 jjConfig

> Comprehensive Jujutsu (jj) VCS configuration with Synthwave84 theme, 20+ aliases, and AI-powered GitMCP integration

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Version](https://img.shields.io/badge/version-1.1.0-blue.svg)](https://github.com/Thomo1318/jjConfig/releases)
[![jj](https://img.shields.io/badge/jj-0.23.0+-purple.svg)](https://github.com/jj-vcs/jj)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

---

## ✨ Features

- 🎨 **Synthwave84 Color Scheme** - 30+ custom terminal colors for a retro-futuristic aesthetic
- ⚡ **20+ Command Aliases** - Streamlined workflows for common operations
- 🔍 **Smart Revsets** - Advanced commit selection and filtering
- 🔗 **Git Integration** - Seamless colocated repository support
- 🤖 **GitMCP Integration** - Zero-token AI context generation via local Git hooks
- 🖥️ **TUI Support** - jj-fzf, lazyjj, and gg integration
- 📚 **21 Reference Files** - Tiered configurations (tier2, tier3, community)
- 📦 **SemVer Tracking** - Structured version history with backups
- 🚀 **Makefile Deployment** - One-command symlink installation

---

## 📋 Table of Contents

- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)
- [GitMCP Integration](#gitmcp-integration)
- [Directory Structure](#directory-structure)
- [Version History](#version-history)
- [Contributing](#contributing)
- [Troubleshooting](#troubleshooting)
- [License](#license)

---

## 🔧 Prerequisites

Before installing jjConfig, ensure you have:

| Requirement | Version | Installation |
|-------------|---------|--------------|
| **Jujutsu (jj)** | 0.23.0+ | `brew install jj` or [build from source](https://github.com/jj-vcs/jj) |
| **Git** | 2.40+ | `brew install git` |
| **Bash** | 4.0+ | Pre-installed on macOS/Linux |
| **Make** | 3.81+ | Pre-installed on macOS/Linux |

### Optional Dependencies

- **jj-fzf** - Interactive TUI for jj ([install](https://github.com/Cretezy/jj-fzf))
- **lazyjj** - Terminal UI for jj ([install](https://github.com/Cretezy/lazyjj))
- **gg** - Alternative jj UI ([install](https://github.com/gulbanana/gg))
- **micro** - Terminal text editor ([install](https://micro-editor.github.io/))

---

## 🚀 Quick Start

New to jjConfig? See [QUICKSTART.md](QUICKSTART.md) for a 5-minute setup guide.

```bash
# Clone the repository
git clone https://github.com/Thomo1318/jjConfig.git ~/.config/jjConfig

# Deploy via symlink
cd ~/.config/jjConfig
make deploy

# Verify installation
jj config list user

# Initialize a new repository with GitMCP
mkdir my-project && cd my-project
jj init
 📦 Installation
Step 1: Clone the Repository
 git clone https://github.com/Thomo1318/jjConfig.git ~/.config/jjConfig
cd ~/.config/jjConfig
 Step 2: Backup Existing Configuration (Optional)
If you have an existing jj configuration:
 # Backup will be created automatically during deployment
# Manual backup:
cp -r ~/.config/jj ~/.config/jj.backup-$(date +%Y%m%d-%H%M%S)
 Step 3: Deploy Configuration
 make deploy
 This will:
	•	Create a symlink: ⁠~/.config/jj → ⁠~/.config/jjConfig 	•	Backup any existing configuration 	•	Validate the configuration syntax
Step 4: Verify Installation
 jj config list user
jj config list ui
jj config list git
 You should see your user information and the Synthwave84 color scheme applied.
🎯 Usage
Basic Commands
 # Status
jj st

# Log (last 20 commits)
jj ll

# Diff
jj d

# Commit interactively
jj ci

# Push with new bookmarks
jj push

# Sync all remotes
jj sync
 TUI Launchers
 # Launch jj-fzf
jj fzf

# Launch lazyjj
jj tui

# Launch gg
jj ui
 GitMCP Commands
 # Initialize new repo with GitMCP
jj init

# Install GitMCP hooks in existing repo
jj mcp-update

# Show GitMCP URL
jj mcp-url

# Open GitMCP URL in browser
jj mcp-open
 Advanced Workflows
See aliases/README.md for tier2, tier3, and community aliases.
⚙️ Configuration
Main Configuration
The main configuration file is ⁠config.toml (v1.1.0-mcp-integration).
Key sections:
	•	⁠[user] - Name and email 	•	⁠[ui] - Editor, pager, colors 	•	⁠[git] - Git integration settings 	•	⁠[templates] - Log and show templates 	•	⁠[revset-aliases] - Custom revset functions 	•	⁠[aliases] - Command shortcuts 	•	⁠[colors] - Synthwave84 color scheme
Reference Configurations
Additional configurations are organized in subdirectories:
Directory
Purpose
Files
⁠aliases/
Command aliases
4 files (tier2, tier3, advanced, community)
⁠revsets/
Revset aliases
3 files (tier2, tier3, community)
⁠ui-configs/
UI settings
3 files (synthwave84, tier2, tier3)
⁠git-configs/
Git settings
2 files (tier2, tier3)
⁠template-configs/
Template aliases
2 files (tier2, tier3)
⁠revsets-config/
Revsets section
5 files (tier2, tier3, community, willhbr)
Customization
To add reference configurations:
 # Example: Add tier2 aliases
cat ~/.config/jj/aliases/tier2-intermediate.toml >> ~/.config/jj/config.toml

# Test the changes
jj config list aliases
 🤖 GitMCP Integration
What is GitMCP?
GitMCP (Git Model Context Protocol) provides AI tools with structured repository context without using any API tokens. All processing happens locally via Git hooks.
How It Works
	1.	Automatic Context Generation - Git hooks (⁠post-commit, ⁠post-merge, ⁠post-checkout) generate ⁠.mcp/context.json 	2.	Zero Tokens - 100% local processing, no API calls 	3.	AI Tool Integration - Works with Cursor IDE, Claude Desktop, and other MCP-compatible tools
Setup for AI Tools
Cursor IDE
 cat .mcp/cursor-config.json >> ~/.cursor/mcp.json
 Claude Desktop
 cat .mcp/claude-config.json >> ~/Library/Application\ Support/Claude/claude_desktop_config.json
 MCP Server URL
For GitHub repositories, your MCP server URL is:
 https://gitmcp.io/YOUR_USERNAME/REPO_NAME
 Example: ⁠https://gitmcp.io/Thomo1318/jjConfig
Learn More
	•	GitMCP Article 	•	MCP Documentation
📂 Directory Structure
 jjConfig/
├── README.md                      # This file
├── QUICKSTART.md                  # 5-minute setup guide
├── CONTRIBUTING.md                # Developer guidelines
├── TROUBLESHOOTING.md             # Common issues
├── TASKS.md                       # Roadmap and TODOs
├── LICENSE                        # MIT License
├── Makefile                       # Deployment automation
├── config.toml                    # Main configuration (v1.1.0)
├── .mcp/                          # GitMCP context files
│   ├── context.json               # Repository metadata
│   ├── cursor-config.json         # Cursor IDE config
│   ├── claude-config.json         # Claude Desktop config
│   └── README.md                  # MCP integration guide
├── aliases/                       # Command alias references
│   ├── README.md
│   ├── tier2-intermediate.toml
│   ├── tier3-expert.toml
│   ├── advanced-workflows.toml
│   └── community-collection.toml
├── revsets/                       # Revset alias references
│   ├── README.md
│   ├── tier2-workflow.toml
│   ├── tier3-advanced.toml
│   └── community-patterns.toml
├── ui-configs/                    # UI & color configurations
│   ├── README.md
│   ├── synthwave84-colors.toml
│   ├── tier2-ui-settings.toml
│   └── tier3-advanced-ui.toml
├── git-configs/                   # Git integration settings
│   ├── README.md
│   ├── tier2-git-settings.toml
│   └── tier3-git-advanced.toml
├── template-configs/              # Template alias references
│   ├── README.md
│   ├── tier2-template-aliases.toml
│   └── tier3-custom-templates.toml
├── revsets-config/                # Revsets section settings
│   ├── README.md
│   ├── tier2-revsets-settings.toml
│   ├── tier3-advanced-revsets.toml
│   ├── community-revsets-patterns.toml
│   └── willhbr-pattern.toml
├── templates/                     # Hook and workflow templates
│   ├── README-mcp-section.md
│   └── mcp-hooks/
│       ├── README.md
│       ├── post-commit
│       ├── post-merge
│       └── post-checkout
└── backups/                       # Version history
    ├── VERSION_HISTORY.md
    ├── v0.1.0-original/
    ├── v1.0.0-optimized/
    └── v1.1.0-mcp-integration/
 📜 Version History
Version
Date
Description
v1.1.0
2025-11-07
GitMCP integration, MCP hooks, AI context generation
v1.0.0
2025-11-01
Synthwave84 theme, 20+ aliases, reference files
v0.1.0
2025-11-01
Original basic configuration
See backups/VERSION_HISTORY.md for complete changelog.
Roadmap
	•	v1.1.0-pager - Evaluate pager alternatives (delta, bat) 	•	v2.0.0-formatters - Code formatters (Ruff, Prettier, Black) 	•	v3.0.0-conventional - Conventional Commits integration 	•	v4.0.0-release-automation - Release tooling (release-please) 	•	v5.0.0-cicd - CI/CD pipelines (GitHub Actions) 	•	v6.0.0-security - Security scanning (GitGuardian, Snyk)
See TASKS.md for detailed roadmap.
🤝 Contributing
Contributions are welcome! Please see CONTRIBUTING.md for:
	•	Development setup 	•	Testing changes 	•	Backup strategy 	•	Version numbering 	•	Pull request process
🐛 Troubleshooting
Having issues? See TROUBLESHOOTING.md for common problems and solutions:
	•	Installation problems 	•	Symlink issues 	•	GitMCP hook failures 	•	Color scheme not applying 	•	Alias conflicts
📄 License
This project is licensed under the MIT License - see the LICENSE file for details.
👤 Author
Thomo1318
	•	Email: steele.thompson13@gmail.com 	•	GitHub: @Thomo1318
🙏 Acknowledgments
	•	Jujutsu VCS - The version control system 	•	jj Community - Configuration patterns 	•	GitMCP - AI context integration 	•	Synthwave84 color scheme inspiration
📚 Additional Resources
	•	Official jj Documentation 	•	jj Tutorial 	•	Revset Language 	•	jj GitHub Discussions 	•	jj Discord Server
<div align="center">

⭐ Star this repo if you find it helpful!
Report Bug · Request Feature · Discussions
</div>
```

2. QUICKSTART.md (New)
 # 🚀 Quick Start Guide

Get up and running with jjConfig in 5 minutes.

---

## Prerequisites

- **Jujutsu (jj)** installed: `brew install jj`
- **Git** installed: `brew install git`
- **Bash** shell (pre-installed on macOS/Linux)

---

## Installation (2 minutes)

```bash
# 1. Clone the repository
git clone https://github.com/Thomo1318/jjConfig.git ~/.config/jjConfig

# 2. Deploy configuration
cd ~/.config/jjConfig
make deploy

# 3. Verify installation
jj config list user
 You should see:
 user.name = "Thomo1318"
user.email = "steele.thompson13@gmail.com"
 First Repository (2 minutes)
Create a New Project
 # 1. Create project directory
mkdir my-first-jj-project
cd my-first-jj-project

# 2. Initialize with GitMCP
jj init

# 3. Create a file
echo "# My First JJ Project" > README.md

# 4. Check status
jj st

# 5. Create a new change
jj new

# 6. Describe the change
jj describe -m "feat: add README"

# 7. View log
jj l
 Clone an Existing Repository
 # 1. Clone with git
git clone https://github.com/username/repo.git
cd repo

# 2. Initialize jj
jj init

# 3. View log
jj l
 Essential Commands (1 minute)
Command
Description
Alias
⁠jj st
Show status
⁠jj status
⁠jj l
View log
⁠jj log
⁠jj d
Show diff
⁠jj diff
⁠jj n
Create new change
⁠jj new
⁠jj ci
Commit interactively
⁠jj commit --interactive
⁠jj push
Push with new bookmarks
⁠jj git push --allow-new
⁠jj sync
Fetch all remotes
⁠jj git fetch --all-remotes
Basic Workflow
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
 TUI Tools
 # Interactive TUI with fzf
jj fzf

# Terminal UI (lazyjj)
jj tui

# Alternative UI (gg)
jj ui
 Next Steps
	•	Read the full README: README.md 	•	Explore aliases: aliases/README.md 	•	Learn revsets: revsets/README.md 	•	Customize colors: ui-configs/README.md 	•	Official tutorial: https://jj-vcs.github.io/jj/latest/tutorial/
Need Help?
	•	Troubleshooting: TROUBLESHOOTING.md 	•	Contributing: CONTRIBUTING.md 	•	Issues: https://github.com/Thomo1318/jjConfig/issues 	•	jj Discord: https://discord.gg/dkmfj3aGQN
Happy hacking! 🎉
 
---

### 3. **CONTRIBUTING.md** (New)

```markdown
# 🤝 Contributing to jjConfig

Thank you for your interest in contributing to jjConfig! This guide will help you get started.

---

## 📋 Table of Contents

- [Development Setup](#development-setup)
- [Making Changes](#making-changes)
- [Testing Changes](#testing-changes)
- [Backup Strategy](#backup-strategy)
- [Version Numbering](#version-numbering)
- [Pull Request Process](#pull-request-process)
- [Code Style](#code-style)

---

## 🔧 Development Setup

### 1. Fork and Clone

```bash
# Fork the repository on GitHub, then:
git clone https://github.com/YOUR_USERNAME/jjConfig.git
cd jjConfig
 2. Create Development Branch
 jj new
jj describe -m "feat: your feature description"
 3. Test Your Setup
 # Validate configuration syntax
make test

# Deploy to test
make deploy
 ✏️ Making Changes
Configuration Changes
	1.	Edit the main config: ⁠config.toml 	2.	Add reference files: Place in appropriate subdirectory (⁠aliases/, ⁠revsets/, etc.) 	3.	Update documentation: Reflect changes in relevant README files
Documentation Changes
	1.	Follow markdown best practices 	2.	Use proper headings (H1-H6) 	3.	Include code examples with syntax highlighting 	4.	Add emojis for visual appeal (sparingly) 	5.	Test all links
Adding New Features
	1.	Create reference file in appropriate directory 	2.	Add to README in that directory 	3.	Update main README if user-facing 	4.	Add to TASKS.md if part of roadmap
🧪 Testing Changes
Syntax Validation
 # Test configuration syntax
make test

# List all config values
jj config list
 Functional Testing
 # Test aliases
jj YOUR_NEW_ALIAS

# Test revsets
jj log -r 'YOUR_NEW_REVSET()'

# Test colors
jj log --color=always
 Integration Testing
 # Test in a new repository
mkdir test-repo
cd test-repo
jj init
# ... test your changes
 💾 Backup Strategy
Before Major Changes
 # Create timestamped backup
make backup
 This creates: ⁠backups/manual/backup-YYYYMMDD-HHMMSS/
Version Backups
When releasing a new version:
 # Create version backup
mkdir -p backups/v1.X.Y-description
cp config.toml backups/v1.X.Y-description/
 Update ⁠backups/VERSION_HISTORY.md with:
	•	Version number 	•	Date 	•	Description 	•	Breaking changes 	•	New features
🔢 Version Numbering
We follow Semantic Versioning:
Format: ⁠MAJOR.MINOR.PATCH
	•	MAJOR - Breaking changes (e.g., config structure changes) 	•	MINOR - New features (backward compatible) 	•	PATCH - Bug fixes (backward compatible)
Examples
	•	⁠v1.0.0 → ⁠v1.1.0 - Added GitMCP integration (new feature) 	•	⁠v1.1.0 → ⁠v1.1.1 - Fixed alias typo (bug fix) 	•	⁠v1.1.1 → ⁠v2.0.0 - Changed config structure (breaking change)
Version Suffixes
	•	⁠-draft - Work in progress 	•	⁠-rc1 - Release candidate 	•	⁠-beta - Beta release
📤 Pull Request Process
1. Prepare Your Changes
 # Ensure working copy is clean
jj st

# Describe your change
jj describe -m "feat: add new feature"

# Push to your fork
jj push
 2. Create Pull Request
	•	Title: Use conventional commit format
	▪	⁠feat: - New feature 	▪	⁠fix: - Bug fix 	▪	⁠docs: - Documentation only 	▪	⁠style: - Formatting, no code change 	▪	⁠refactor: - Code restructuring 	▪	⁠test: - Adding tests 	▪	⁠chore: - Maintenance tasks 	•	Description: Include:
	▪	What changed 	▪	Why it changed 	▪	How to test 	▪	Related issues
3. Review Process
	•	Maintainer will review within 7 days 	•	Address any feedback 	•	Once approved, changes will be merged
📝 Code Style
TOML Configuration
 # Use double quotes for strings
key = "value"

# Group related settings
[section]
setting1 = "value1"
setting2 = "value2"

# Add comments for complex settings
# This setting controls X behavior
complex_setting = "value"
 Shell Scripts
 #!/usr/bin/env bash
# Script description

set -e  # Exit on error

# Use descriptive variable names
REPO_NAME="example"

# Add comments for complex logic
# This checks if the repository exists
if [ -d "$REPO_NAME" ]; then
    echo "Repository exists"
fi
 Markdown
 # Use ATX-style headers

## Second level

### Third level

- Use hyphens for unordered lists
- Not asterisks or plus signs

1. Use numbers for ordered lists
2. Even if they're all "1."

`Use backticks for inline code`

\`\`\`bash
# Use fenced code blocks with language
echo "Hello"
\`\`\`
 🐛 Reporting Issues
Before Creating an Issue
	1.	Check existing issues 	2.	Review TROUBLESHOOTING.md 	3.	Test with latest version
Issue Template
 **Description**
Clear description of the issue

**Steps to Reproduce**
1. Step one
2. Step two
3. ...

**Expected Behavior**
What should happen

**Actual Behavior**
What actually happens

**Environment**
- jj version: `jj --version`
- OS: macOS/Linux
- jjConfig version: v1.1.0

**Additional Context**
Any other relevant information
 💡 Feature Requests
We welcome feature requests! Please include:
	•	Use case: Why is this feature needed? 	•	Proposed solution: How should it work? 	•	Alternatives considered: Other approaches you've thought about 	•	Additional context: Examples, mockups, etc.
📞 Getting Help
	•	GitHub Issues: https://github.com/Thomo1318/jjConfig/issues 	•	GitHub Discussions: https://github.com/Thomo1318/jjConfig/discussions 	•	jj Discord: https://discord.gg/dkmfj3aGQN
🙏 Thank You!
Your contributions make jjConfig better for everyone. We appreciate your time and effort!
Happy contributing! 🎉
 
---

### 4. **TROUBLESHOOTING.md** (New)

```markdown
# 🐛 Troubleshooting Guide

Common issues and solutions for jjConfig.

---

## 📋 Table of Contents

- [Installation Issues](#installation-issues)
- [Configuration Issues](#configuration-issues)
- [GitMCP Issues](#gitmcp-issues)
- [Color Scheme Issues](#color-scheme-issues)
- [Alias Issues](#alias-issues)
- [Git Integration Issues](#git-integration-issues)
- [Performance Issues](#performance-issues)

---

## 🔧 Installation Issues

### Symlink Already Exists

**Problem**: `~/.config/jj` already exists and is not a symlink

**Solution**:
```bash
# Backup existing config
mv ~/.config/jj ~/.config/jj.backup-$(date +%Y%m%d-%H%M%S)

# Deploy jjConfig
cd ~/.config/jjConfig
make deploy
 Permission Denied
Problem: Cannot create symlink due to permissions
Solution:
 # Check ownership
ls -la ~/.config/

# Fix ownership (if needed)
sudo chown -R $USER:$USER ~/.config/

# Retry deployment
make deploy
 Makefile Not Found
Problem: ⁠make: command not found
Solution:
 # macOS
xcode-select --install

# Linux (Debian/Ubuntu)
sudo apt-get install build-essential

# Linux (Fedora/RHEL)
sudo dnf install make
 ⚙️ Configuration Issues
Config Not Loading
Problem: Changes to ⁠config.toml not taking effect
Solution:
 # Verify symlink
ls -la ~/.config/jj

# Should show: jj -> /path/to/jjConfig

# Reload configuration
jj config list

# Check for syntax errors
make test
 Syntax Errors
Problem: ⁠jj config list shows errors
Solution:
 # Validate TOML syntax
make test

# Check specific section
jj config list user
jj config list ui
jj config list git

# Common issues:
# - Missing quotes around strings
# - Incorrect array syntax
# - Duplicate keys
 Config Override Not Working
Problem: Local config not overriding global config
Solution:
 # Check config precedence
jj config list --show-origin

# Local config takes precedence:
# 1. Repo config: .jj/repo/config.toml
# 2. User config: ~/.config/jj/config.toml
# 3. System config: /etc/jj/config.toml
 🤖 GitMCP Issues
Hooks Not Executing
Problem: ⁠.mcp/context.json not being generated
Solution:
 # Check if hooks are installed
ls -la .git/hooks/

# Should see:
# - post-commit
# - post-merge
# - post-checkout

# Verify hooks are executable
chmod +x .git/hooks/post-*

# Manually trigger hook
.git/hooks/post-commit

# Check for errors
cat .git/hooks/post-commit
 Context File Empty
Problem: ⁠.mcp/context.json exists but is empty or malformed
Solution:
 # Check Git remote
git remote -v

# Should show GitHub URL

# Regenerate context
.git/hooks/post-commit

# Verify content
cat .mcp/context.json | jq .
 MCP URL Not Working
Problem: GitMCP URL returns 404
Solution:
 # Verify repository is public on GitHub
# Private repos require authentication

# Check URL format
jj mcp-url

# Should be: https://gitmcp.io/USERNAME/REPO

# Verify GitHub remote
git remote get-url origin
 Hooks Failing Silently
Problem: Hooks installed but not running
Solution:
 # Test hook manually
bash -x .git/hooks/post-commit

# Check for bash errors
# Common issues:
# - Missing bash (#!/usr/bin/env bash)
# - Permission denied
# - Missing dependencies (git, jq)

# Reinstall hooks
jj mcp-update
 🎨 Color Scheme Issues
Colors Not Showing
Problem: Terminal shows no colors or wrong colors
Solution:
 # Check color setting
jj config list ui.color

# Should be: "always"

# Test colors
jj log --color=always

# Verify terminal support
echo $TERM
# Should be: xterm-256color or similar

# Enable 256 colors
export TERM=xterm-256color
 Colors Look Wrong
Problem: Colors don't match Synthwave84 theme
Solution:
 # Verify color config loaded
jj config list colors

# Check for conflicting configs
jj config list --show-origin | grep colors

# Reload config
make deploy

# Test specific color
jj log -r @ --color=always
 Terminal Not Supporting True Color
Problem: Colors appear washed out or incorrect
Solution:
 # Check terminal true color support
# Run this test:
awk 'BEGIN{
    s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
    for (colnum = 0; colnum<77; colnum++) {
        r = 255-(colnum*255/76);
        g = (colnum*510/76);
        b = (colnum*255/76);
        if (g>255) g = 510-g;
        printf "\033[48;2;%d;%d;%dm", r,g,b;
        printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
        printf "%s\033[0m", substr(s,colnum+1,1);
    }
    printf "\n";
}'

# If colors look wrong, use 256-color mode
# Edit config.toml and use ANSI color codes instead of RGB
 ⚡ Alias Issues
Alias Not Found
Problem: ⁠jj: error: unknown command 'YOUR_ALIAS'
Solution:
 # Check if alias exists
jj config list aliases

# Verify alias syntax
cat ~/.config/jj/config.toml | grep -A 2 "YOUR_ALIAS"

# Common issues:
# - Typo in alias name
# - Missing quotes
# - Incorrect array syntax

# Reload config
make deploy
 Alias Not Working as Expected
Problem: Alias runs but doesn't do what you expect
Solution:
 # Check alias definition
jj config list aliases.YOUR_ALIAS

# Test with verbose output
jj --verbose YOUR_ALIAS

# Check for conflicting aliases
jj config list --show-origin | grep YOUR_ALIAS
 TUI Aliases Not Working
Problem: ⁠jj fzf, ⁠jj tui, or ⁠jj ui not working
Solution:
 # Check if tools are installed
which jj-fzf
which lazyjj
which gg

# Install missing tools
# jj-fzf: https://github.com/Cretezy/jj-fzf
# lazyjj: https://github.com/Cretezy/lazyjj
# gg: https://github.com/gulbanana/gg

# Verify alias
jj config list aliases.fzf
 🔗 Git Integration Issues
Push Fails with "bookmark not found"
Problem: ⁠jj push fails with bookmark error
Solution:
 # Create bookmark first
jj bookmark create main -r @

# Or use --allow-new
jj git push --allow-new

# Or use the alias
jj push
 Fetch Not Working
Problem: ⁠jj sync doesn't fetch changes
Solution:
 # Check Git remotes
git remote -v

# Verify fetch setting
jj config list git.fetch

# Should be: "glob:*"

# Manually fetch
jj git fetch --all-remotes
 Colocated Repo Issues
Problem: Git and jj out of sync
Solution:
 # Check if colocated
ls -la .git .jj

# Both should exist

# Sync Git → jj
jj git import

# Sync jj → Git
jj git export
 🚀 Performance Issues
Slow Log Display
Problem: ⁠jj log is slow for large repositories
Solution:
 # Limit log output
jj log --limit 20

# Use alias
jj ll  # Shows last 20

# Optimize revset
jj log -r 'ancestors(@, 10)'
 Slow Diff
Problem: ⁠jj diff is slow
Solution:
 # Use stat view
jj diff --stat

# Or use alias
jj ds

# Limit context
jj diff --context 3
 High Memory Usage
Problem: jj using too much memory
Solution:
 # Check repository size
du -sh .jj

# Garbage collect
jj util gc

# Check for large files
git lfs ls-files
 🆘 Getting More Help
Check jj Version
 jj --version
 Enable Debug Logging
 # Run with debug output
jj --debug YOUR_COMMAND

# Or set environment variable
export RUST_LOG=debug
jj YOUR_COMMAND
 Check System Info
 # macOS
sw_vers
system_profiler SPSoftwareDataType

# Linux
uname -a
lsb_release -a
 Report an Issue
If you can't resolve the issue:
	1.	Search existing issues: https://github.com/Thomo1318/jjConfig/issues 	2.	Create new issue with:
	▪	Description of the problem 	▪	Steps to reproduce 	▪	Expected vs actual behavior 	▪	Environment info (jj version, OS, etc.) 	▪	Relevant config sections 	▪	Error messages (if any)
📚 Additional Resources
	•	jj Documentation: https://jj-v