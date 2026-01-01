# Alias Configuration Reference Files

This directory contains command aliases for jj to speed up common operations.

## Files Created:

### ✓ `tier2-intermediate.toml`
**Purpose:** Bookmark management and specialized logs
**Status:** CREATED
**Key aliases:**
- `nb` - New bookmark on parent
- `tug` - Move bookmark up to parent
- `logconflicts`, `logpush`, `logpull` - Specialized log views
- `retrunk`, `nt` - Rebase shortcuts
- `abandonempties` - Cleanup

### ✓ `tier3-expert.toml`
**Purpose:** Complex operations requiring deep jj knowledge
**Status:** CREATED
**Key aliases:**
- `rebase-all`, `reheat`, `rebasestale` - Advanced rebase
- `consume`, `eject` - Content movement
- `hideempty` - Cleanup operations
- `ps` - Smart push workflow
- `archive`, `unarchive` - Description prefixing

### ✓ `advanced-workflows.toml`
**Purpose:** Scripted workflows using util exec
**Status:** CREATED
**Key aliases:**
- `ps` - Auto-commit and push workflow
- `archive`/`unarchive` - Commit archiving
- `resolve` - Custom conflict resolution

### ✓ `community-collection.toml`
**Purpose:** Proven aliases from community
**Status:** CREATED
**Key aliases:**
- `ab`, `am`, `hide`, `reword` - Common shortcuts
- `bg`, `bgc` - Background operations
- `pl`, `xl` - Log variants
- `delta` - Delta diff integration
- `mine`, `o`, `oo` - Utility shortcuts

## Missing Files (Need to Create):

### ✗ Starter aliases (for main config)
**Status:** NOT YET CREATED
**Should contain:** Basic aliases approved in Change 7
- `st`, `d`, `ds`, `s`, `c`, `ci`
- `l`, `ll`, `lll`
- `e`, `amend`, `r`
- `pull`, `push`, `sync`
- `n`, `co`
- `fzf`, `tui`, `ui`

## Implementation:

### Add to Main Config:
```bash
# Copy desired aliases
cat ~/.config/jj/aliases/tier2-intermediate.toml >> ~/.config/jj/config.toml
```

### Test Aliases:
```bash
# Test an alias
jj tug
jj logpush
```

## References:
- Aliases: https://jj-vcs.github.io/jj/latest/config/#command-aliases
- Community configs: https://github.com/jj-vcs/jj/discussions/5812
