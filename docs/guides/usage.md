# User Guide

This guide covers basic usage, workflows, and advanced integrations for `jjConfig`.

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

## 💡 Common Commands

```bash
jj init      # Initialize repo (with GitMCP)
jj st        # Status
jj ll        # Log last 20 commits
jj d         # Diff
jj ci        # Commit interactively
jj push      # Push bookmarks
jj sync      # Sync remotes
```

### TUI Tools

- `jj fzf`: Launch jj-fzf
- `jj tui`: Launch lazyjj
- `jj ui`: Launch gg

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

**MCP server URL:** `https://gitmcp.io/Thomo1318/jjConfig`
See [MCP docs](https://gitmcp.io/docs) for details.

---

## 📦 Repomix Integration

Repomix consolidates your entire repository into a single AI-friendly file for context injection.

**How It Works:**

- Git hooks automatically generate `.repomix/repomix-latest.txt` after commits
- Contains full repository content optimized for AI tools
- Includes token counts and file statistics

**Generated Files in `.repomix/`:**

- `context.json`: Metadata
- `repomix-latest.txt`: Symlink to latest (use this!)

**Usage:**

```bash
# Copy to AI tool
cat .repomix/repomix-latest.txt | pbcopy

# Check token count
repomix --token-count-tree 50 .

# Show status
jj repomix-status
```

---

## 🏷️ Versioning (Automated)

We use `git-semver` to automatically calculate the next version based on Conventional Commits and tags.

### Aliases

| Command         | Description             | Example Output |
| :-------------- | :---------------------- | :------------- |
| `jj semver`     | Show current version    | `v1.2.0`       |
| `jj next-patch` | Show next patch version | `v1.2.1`       |
| `jj next-minor` | Show next minor version | `v1.3.0`       |
| `jj next-major` | Show next major version | `v2.0.0`       |

### Release Workflow

```bash
# create a release with the correct version
gh release create $(jj next-minor) --generate-notes
```

---

## 🏷️ Versioning (Automated)

We use `git-semver` to automatically calculate the next version based on Conventional Commits and tags.

### Composing Commits

When you run `jj describe`, `jjConfig` provides a strict template to help you follow [Conventional Commits](https://www.conventionalcommits.org/):

```
# <type>(<scope>): <description>
# Types: feat, fix, docs, style, refactor, perf, test, chore
```

### Aliases

| Command         | Description             | Example Output |
| :-------------- | :---------------------- | :------------- |
| `jj semver`     | Show current version    | `v1.2.0`       |
| `jj next-patch` | Show next patch version | `v1.2.1`       |
| `jj next-minor` | Show next minor version | `v1.3.0`       |
| `jj next-major` | Show next major version | `v2.0.0`       |

### Release Workflow

```bash
# create a release with the correct version
gh release create $(jj next-minor) --generate-notes
```

---

## 🔧 Troubleshooting

See [TROUBLESHOOTING.md](../../TROUBLESHOOTING.md) for solutions to common install issues.
