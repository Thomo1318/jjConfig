# Revsets Section Configuration Reference

This directory contains `[revsets]` section settings (NOT `[revset-aliases]`).

## Distinction:

### `[revset-aliases]` (Already handled in Change 8)
Defines **custom revset functions** like:
- `mine()` - Your commits
- `trunk()` - Main branch
- `work()` - Work in progress
- Located in: `~/.config/jj/revsets/`

### `[revsets]` (This is Change 12)
Defines **revset behavior settings** like:
- `log` - Default log view
- `short-prefixes` - ID prefix prioritization
- `log-graph-prioritize` - Graph layout
- Located in: `~/.config/jj/revsets-config/`

## Files:

### `tier2-revsets-settings.toml`
**Purpose:** Advanced revset behavior customization
**When to use:**
- Want custom default log view
- Need shorter IDs for active work
- Have complex graphs needing prioritization

**Key settings:**
- `revsets.log` - What `jj log` shows by default
- `revsets.short-prefixes` - Prioritize shorter IDs
- `revsets.log-graph-prioritize` - Graph layout control

## Configuration Options:

### `revsets.log`
**Default:** `"@ | ancestors(immutable_heads().., 2) | trunk()"`

**What it does:** Controls which commits are shown when you run `jj log` without arguments.

**Common alternatives:**
```toml
# Show everything since trunk
log = "trunk().."

# Show recent mutable work
log = "ancestors(mutable(), 10) | trunk()"

# Show all visible heads with context
log = "ancestors(visible_heads(), 3) | trunk()"

# Show only current branch
log = "::@"

# Show unpushed work
log = "remote_bookmarks()..@"
```

### `revsets.short-prefixes`
**Default:** None (all IDs get same treatment)

**What it does:** Makes IDs shorter for commits matching the revset.

**Common patterns:**
```toml
# Shorter IDs for current branch work
short-prefixes = "(trunk()..@)::"

# Shorter IDs for all mutable commits
short-prefixes = "mutable()::"

# Shorter IDs for recent work
short-prefixes = "ancestors(@, 20)::"
```

### `revsets.log-graph-prioritize`
**Default:** None (@ shows on left)

**What it does:** Controls which branch appears on the left side of the graph.

**Use cases:**
```toml
# Always show trunk on left
log-graph-prioritize = "trunk()"

# Show current work on left
log-graph-prioritize = "@"

# Show specific merge on left
log-graph-prioritize = "coalesce(description(exact:'megamerge'), trunk())"
```

## Implementation:

### Quick Start:
```bash
# Add to main config
echo '[revsets]' >> ~/.config/jj/config.toml
echo 'log = "trunk().."' >> ~/.config/jj/config.toml
```

### Testing:
```bash
# Test custom log revset
jj log  # Uses revsets.log setting

# Test with override
jj log -r "all()"

# Test short-prefixes
jj log  # IDs should be shorter for prioritized commits
```

## References:
- Revsets config: https://jj-vcs.github.io/jj/latest/config/#revsets
- Revset language: https://jj-vcs.github.io/jj/latest/revsets/
