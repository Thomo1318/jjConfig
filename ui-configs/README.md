# UI Configuration Reference Files

This directory contains additional UI configuration options for jj.

## Files:

### `synthwave84-colors.toml`

**Purpose:** Complete Synthwave84 color scheme based on brewSearch project
**When to use:**

- You want vibrant retro 80s aesthetics
- Terminal supports true color (24-bit)
- You prefer high-contrast color schemes

**Implementation:**

```bash
# Copy entire [colors] section to main config.toml
# Or include via: jj --config-file=~/.config/jj/ui-configs/synthwave84-colors.toml log
```

### `tier2-ui-settings.toml`

**Purpose:** Enhanced UI settings for better UX
**When to use:**

- You want more control over diff/merge display
- Need custom pagination behavior
- Want to optimize pager settings

**Key settings:**

- `conflict-marker-style` - How conflicts display
- `diff.color-words.context` - Diff context lines
- `snapshot.max-new-file-size` - File size limits
- Pager interface and wrapping options

### `tier3-advanced-ui.toml`

**Purpose:** Expert-level UI customizations
**When to use:**

- Using external diff tools (difftastic, delta)
- Custom merge tool workflows
- Conditional configuration per command/platform
- Word-level merge granularity

**Key settings:**

- External diff formatters
- External pagers
- Conditional scopes
- Advanced merge options

## Color Schemes Available:

### Synthwave84 (Default)

- Dark Purple backgrounds (#261838)
- Purple/Pink highlights
- Cyan for metadata
- Hot Pink for emphasis
- Neon Pink for removals

### Alternative Themes (from brewSearch):

Other themes available in brewSearch that could be adapted:

- Dracula
- Nord
- Tokyo Night
- Catppuccin Mocha
- Gruvbox Dark
- Monokai

## Implementation Guide:

### Quick Start:

```bash
# Add Synthwave84 colors to main config
cat ~/.config/jj/ui-configs/synthwave84-colors.toml >> ~/.config/jj/config.toml
```

### Selective Implementation:

1. Open desired tier file
2. Copy specific `[ui]` sections
3. Paste into main config.toml
4. Customize values as needed
5. Test with `jj log` to verify

### Testing Colors:

```bash
# Test with debug mode to see all labels
jj log --color=debug

# Test specific color scheme
jj --config-file=~/.config/jj/ui-configs/synthwave84-colors.toml log
```

## References:

- Color configuration: https://jj-vcs.github.io/jj/latest/config/#colors-and-styles
- UI settings: https://jj-vcs.github.io/jj/latest/config/#ui-settings
- Diff options: https://jj-vcs.github.io/jj/latest/config/#diff-options
