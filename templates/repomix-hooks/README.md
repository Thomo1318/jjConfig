# Repomix Integration Hooks

Automatic repository consolidation for AI context generation via Git hooks.

## Overview

The repomix hooks automatically generate a consolidated repository file after commits, merges, and checkouts. This file contains the entire repository content in a format optimized for AI tools.

## What is Repomix?

**Repomix** is a tool that packs your entire repository into a single AI-friendly file. It:

- Consolidates all repository content (code, docs, configs)
- Generates token counts for each file
- Provides optimal formatting for AI context
- Works offline with zero API calls
- Supports filtering and customization

**Install:** `npm install -g repomix`

## How It Works

### Automatic Generation

The `post-commit` hook automatically runs after:

- `git commit` - After committing changes
- `git merge` - After merging branches
- `git checkout` - After switching branches

### File Organization

```
.repomix/
├── context.json              # Metadata and usage info
├── repomix-latest.txt        # Symlink to latest file
├── repomix-repo-20251108-001234.txt  # Latest generation
├── repomix-repo-20251108-000000.txt  # Previous generation
└── repomix-repo-20251107-235959.txt  # Older generation
```

### Automatic Cleanup

- Keeps only the last 3 generated files
- Creates symlink to latest for easy access
- Removes old files automatically

## Usage

### Automatic (Default)

```bash
# Just commit - repomix runs automatically
git commit -m "feat: add new feature"

# .repomix/repomix-latest.txt is updated automatically
```

### Manual Generation

```bash
# Manually trigger hook
.git/hooks/post-commit

# Or use repomix directly
repomix --output .repomix/repomix-manual.txt .
```

### Using with AI Tools

#### Copy to AI Tool

```bash
# Copy latest file to clipboard
cat .repomix/repomix-latest.txt | pbcopy

# Or view in editor
open .repomix/repomix-latest.txt
```

#### Check Token Count

```bash
# Show token counts
repomix --token-count-tree .repomix/repomix-latest.txt

# Show only large files (>100 tokens)
repomix --token-count-tree 100 .repomix/repomix-latest.txt
```

#### Get File Statistics

```bash
# Line count
wc -l .repomix/repomix-latest.txt

# File size
du -h .repomix/repomix-latest.txt

# Top files by size
repomix --top-files-len 20 .
```

## Configuration

### Repomix Config File

Create `.repomixignore` to exclude files:

```
# Exclude node_modules
node_modules/

# Exclude build artifacts
dist/
build/

# Exclude large files
*.mp4
*.zip
```

### Hook Behavior

The hook:

- ✅ Runs silently (no console output unless errors)
- ✅ Checks if repomix is installed
- ✅ Creates .repomix/ directory automatically
- ✅ Generates timestamped files
- ✅ Maintains latest symlink
- ✅ Cleans up old files
- ✅ Adds .repomix/ to .gitignore
- ✅ Generates context.json metadata
- ✅ Handles errors gracefully

## Installation

### Automatic (via jjConfig)

```bash
jj init              # Installs all hooks including repomix
# or
jj repomix-update   # Install/update repomix hooks only
```

### Manual Installation

```bash
# Copy hook
mkdir -p .git/hooks
cp ~/.config/jj/templates/repomix-hooks/post-commit .git/hooks/post-commit
chmod +x .git/hooks/post-commit

# Trigger initial generation
.git/hooks/post-commit
```

## Aliases

### Available Commands

```bash
# Install/update repomix hooks
jj repomix-update

# Show repomix status
jj repomix-status

# Generate repomix file manually
jj repomix-generate

# View latest repomix file
jj repomix-view

# Show token counts
jj repomix-tokens
```

## Integration with .mcp

Both .mcp and .repomix hooks work together:

| Feature       | .mcp                                   | .repomix                   |
| ------------- | -------------------------------------- | -------------------------- |
| **Purpose**   | Repository metadata                    | Full content consolidation |
| **Output**    | JSON metadata                          | Text file                  |
| **Size**      | ~1 KB                                  | Varies (full repo)         |
| **Use Case**  | AI tool configuration                  | AI context injection       |
| **Trigger**   | post-commit, post-merge, post-checkout | Same                       |
| **Frequency** | Always                                 | Always                     |

### Combined Workflow

```bash
# Commit changes
git commit -m "feat: add feature"

# Automatically runs:
# 1. .mcp hook → generates .mcp/context.json
# 2. .repomix hook → generates .repomix/repomix-latest.txt

# Use with AI tools:
# - .mcp/context.json for tool configuration
# - .repomix/repomix-latest.txt for context injection
```

## Troubleshooting

### Hook Not Running

```bash
# Check if hook exists and is executable
ls -la .git/hooks/post-commit

# Make executable if needed
chmod +x .git/hooks/post-commit

# Test manually
.git/hooks/post-commit
```

### Repomix Not Found

```bash
# Install repomix
npm install -g repomix

# Verify installation
which repomix
repomix --version
```

### .repomix Directory Not Created

```bash
# Manually create and trigger
mkdir -p .repomix
.git/hooks/post-commit
```

### Old Files Not Cleaning Up

```bash
# Manually clean old files (keep last 3)
ls -t .repomix/repomix-*.txt | tail -n +4 | xargs rm -f

# Recreate latest symlink
ln -sf "$(ls -t .repomix/repomix-*.txt | head -1)" .repomix/repomix-latest.txt
```

## Performance

### Hook Execution Time

- Typical: 0.5-2 seconds (depends on repo size)
- Runs silently in background
- Doesn't block commit process

### File Size Impact

- .repomix/ directory: Varies by repo size
- Typical: 1-10 MB per file
- Keep 3 files: ~3-30 MB total
- Added to .gitignore (not in version control)

## Advanced Usage

### Custom Output Location

```bash
# Generate to custom location
repomix --output ~/ai-context/repo.txt .

# Or use in scripts
REPO_CONTENT=$(repomix --stdout .)
echo "$REPO_CONTENT" | your-ai-tool
```

### Filtering Content

```bash
# Create .repomixignore to exclude files
cat > .repomixignore << 'IGNORE'
node_modules/
.git/
dist/
build/
*.log
IGNORE

# Regenerate
repomix --output .repomix/repomix-filtered.txt .
```

### Token Analysis

```bash
# Show detailed token breakdown
repomix --token-count-tree 50 .

# Export to file
repomix --token-count-tree 50 . > .repomix/token-analysis.txt
```

## References

- **Repomix GitHub:** https://github.com/yamadashy/repomix
- **Repomix NPM:** https://www.npmjs.com/package/repomix
- **jjConfig GitMCP:** See .mcp/README.md

## See Also

- [.mcp Integration](../.mcp/README.md) - Repository metadata
- [README.md](../../README.md) - Main documentation
- [CONTRIBUTING.md](../../CONTRIBUTING.md) - Development guidelines
