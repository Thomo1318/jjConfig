# GitMCP Hook Templates

These Git hooks automatically generate AI context files for your repositories.

## Hooks:

### post-commit

**Triggers:** After every commit
**Action:** Updates `.mcp/context.json` with current repo state

### post-merge

**Triggers:** After git pull/merge
**Action:** Calls post-commit to update context

### post-checkout

**Triggers:** After branch switch
**Action:** Calls post-commit to update context

## Installation:

### Automatic (via jj init)

```bash
jj init  # Hooks auto-installed
```

### Manual (existing repos)

```bash
jj mcp-update  # Install hooks in current repo
```

### Batch (all repos)

```bash
find ~/dev -name \".git\" -type d | while read gitdir; do
    repo=$(dirname \"$gitdir\")
    cd \"$repo\" && jj mcp-update
done
```

## What Gets Created:

```
.mcp/
├── context.json          # Repo metadata (auto-updated)
├── cursor-config.json    # Cursor IDE config
├── claude-config.json    # Claude Desktop config
└── README.md             # Integration instructions
```

## Performance:

- **Execution time:** ~50ms per commit
- **Token usage:** 0 (100% local)
- **Network calls:** 0 (reads git remote URL only)
- **Disk usage:** ~5KB per repo

## Safety:

✓ Read-only operations (no repo modifications)
✓ Graceful failure (continues even if hook fails)
✓ Silent operation (no spam on commits)
✓ .gitignore integration (keeps .mcp/ local)
