# Revset Configuration Reference Files

This directory contains revset aliases for customizing jj's revision selection.

## Files:

### `tier2-workflow.toml`
**Purpose:** Common workflow revset functions
**When to use:**
- Need to query open/unfinished commits
- Want to see unpushed/unpulled changes
- Looking for stale local branches
- Need closest bookmark queries

**Key revsets:**
- `open()` - Empty or WIP commits
- `pushable()` - Ready to push
- `unpushed()`, `unpulled()` - Sync status
- `closest_bookmark()` - Find nearest bookmark
- `localstale` - Old local branches

### `tier3-advanced.toml`
**Purpose:** Complex graph operations
**When to use:**
- Bulk rebase operations
- Excluding specific branches (gh-pages)
- Preventing rewriting others' commits
- Advanced filtering (divergent, empties, merges)

**Key revsets:**
- `retrunk_all()` - All mutable roots
- `stack()` - Trunk to revision
- `no_gh_pages()` - Exclude gh-pages
- `immutable_others()` - Protect others' work
- `divergent()`, `empties()`, `merges_all()`

### `community-patterns.toml`
**Purpose:** Proven patterns from jj community
**When to use:**
- Want patterns from experienced users
- Need active work queries (ancestors + descendants)
- Time-based queries
- File-based queries
- Author-based filtering

**Key patterns:**
- `active(rev)` - Full context (ancestors + descendants)
- `HEAD` - Git-style notation
- `recent_time(days)` - Time-based filtering
- `touches(pattern)` - File-based queries
- `by_author(email)` - Author filtering

## Revset Language Basics:

### Operators:
- `|` - Union (OR)
- `&` - Intersection (AND)
- `~` - Difference (NOT)
- `::` - Ancestors (prefix) or descendants (suffix)
- `..` - Range between commits
- `-` - Parent (e.g., `@-` = parent of current)
- `+` - Child

### Common Functions:
- `@` - Current commit
- `root()` - Repository root
- `trunk()` - Main/master branch
- `mine()` - Your commits
- `mutable()` - Non-immutable commits
- `empty()` - Commits with no changes
- `conflicts()` - Conflicting commits
- `bookmarks()` - All bookmarks
- `remote_bookmarks()` - Remote bookmarks
- `description()` - Filter by description
- `author()`, `committer()` - Filter by person
- `file()` - Filter by file changes

### Pattern Matching:
- `exact:"text"` - Exact match
- `glob:"pattern"` - Glob pattern
- `regex:"pattern"` - Regex pattern

## Implementation:

### Add to Main Config:
```bash
# Copy specific revset to main config
cat ~/.config/jj/revsets/tier2-workflow.toml >> ~/.config/jj/config.toml
```

### Test Revsets:
```bash
# Test a revset query
jj log -r 'open()'
jj log -r 'pushable()'
jj log -r 'active(@)'
```

### Debug Revsets:
```bash
# See what a revset resolves to
jj log -r 'YOUR_REVSET' --no-graph -T 'change_id.short() ++ "\n"'
```

## References:
- Revset language: https://jj-vcs.github.io/jj/latest/revsets/
- Revset functions: https://jj-vcs.github.io/jj/latest/revsets/#functions
- Community patterns: https://github.com/jj-vcs/jj/discussions/5812
