# Template Configuration Reference Files

This directory contains template aliases and custom templates for jj output customization.

## Files:

### `tier2-template-aliases.toml`

**Purpose:** Enhanced template aliases for better formatting
**When to use:**

- Want different ID formatting options (uppercase, bracketed, fixed-length)
- Need full signatures instead of shortened
- Prefer ISO timestamps over relative
- Want custom field formatters

**Key aliases:**

- `format_short_id_upper()` - Uppercase IDs
- `format_short_id_bracketed()` - Show prefix + [rest]
- `format_timestamp_iso()` - ISO 8601 timestamps
- `format_field()` - Custom key:value formatter
- `commit_change_ids` - Combined ID display

### `tier3-custom-templates.toml`

**Purpose:** Advanced custom templates for specific workflows
**When to use:**

- Gerrit/GitHub workflows (commit trailers, hyperlinks)
- Custom log node symbols
- Draft commit descriptions with diff stats
- Backout/duplicate commit templates
- Advanced string manipulation

**Key templates:**

- `log_node` - Custom graph symbols
- `draft_commit_description` - Rich commit editor
- `commit_trailers` - Auto-add Signed-off-by, Change-Id
- `github_link()` - Clickable terminal links
- String manipulation helpers

### `community-templates.toml`

**Purpose:** Community-contributed template patterns
**When to use:**

- Want proven patterns from experienced users
- Need custom log formats (log1, logv)
- Redacted output for sharing
- Advanced filtering and formatting

**Key patterns:**

- `log1` - Compact one-line format (simonmichael)
- `logv` - Verbose format with full descriptions
- Hyperlink helpers
- List filtering patterns
- Timestamp comparisons

## Template Language Features:

### String Methods:

- `.upper()`, `.lower()` - Case conversion
- `.trim()`, `.trim_start()`, `.trim_end()` - Whitespace removal
- `.pad_start()`, `.pad_end()`, `.pad_centered()` - Padding
- `.truncate_start()`, `.truncate_end()` - Truncation
- `.replace()` - Pattern replacement (supports regex)
- `.match()` - Pattern matching
- `.escape_json()` - JSON escaping

### List Methods:

- `.join()` - Join with separator
- `.map()` - Transform elements
- `.filter()` - Filter by predicate
- `.any()`, `.all()` - Boolean checks

### Timestamp Methods:

- `.ago()` - Relative time ("2 hours ago")
- `.format()` - Custom strftime format
- `.after()`, `.before()` - Comparisons
- `.utc()`, `.local()` - Timezone conversion

### Special Functions:

- `label()` - Custom color labels
- `json()` - JSON serialization
- `hyperlink()` - OSC8 terminal links
- `if()` - Conditional rendering
- `coalesce()` - First non-empty value
- `concat()` - String concatenation
- `separate()` - Join with separator, skip empty

## Implementation Guide:

### Quick Start:

```bash
# Add specific template alias
echo '[template-aliases]' >> ~/.config/jj/config.toml
echo "'format_short_id(id)' = 'id.shortest()'" >> ~/.config/jj/config.toml
```

### Testing Templates:

```bash
# Test custom template
jj log -T 'change_id.shortest() ++ " " ++ description.first_line()'

# Debug color labels
jj log --color=debug

# Test with config file
jj --config-file=~/.config/jj/template-configs/tier2-template-aliases.toml log
```

### Built-in Templates:

- `builtin_log_compact` - Default compact log
- `builtin_log_comfortable` - More spacing
- `builtin_log_detailed` - Full details
- `builtin_log_oneline` - Minimal
- `builtin_log_compact_full_description` - Compact with full desc
- `builtin_log_redacted` - Anonymized output
- `builtin_op_log_compact` - Operation log
- `builtin_op_log_comfortable` - Spaced op log
- `builtin_op_log_redacted` - Anonymized op log
- `builtin_config_list` - Config list
- `builtin_config_list_detailed` - Config with origins

## References:

- Template language: https://jj-vcs.github.io/jj/latest/templates/
- Template aliases: https://jj-vcs.github.io/jj/latest/config/#template-aliases
- Community configs: https://github.com/jj-vcs/jj/discussions/5812
