+++
title = "Troubleshooting"
weight = 30
+++

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
```
