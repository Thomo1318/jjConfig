# Git Configuration Reference Files

This directory contains additional Git configuration options for jj that can be implemented later.

## Files:

### `tier2-git-settings.toml`

**Purpose:** Useful Git settings for common scenarios
**When to use:**

- You start working with multiple remotes (fork workflows)
- You want to explicitly document default behaviors
- You need to customize default remote behavior

**Key settings:**

- `colocate` - Explicit colocated repo setting
- `push` - Default push remote
- `track-default-bookmark-on-clone` - Auto-track main on clone

### `tier3-git-advanced.toml`

**Purpose:** Advanced Git settings for expert users and edge cases
**When to use:**

- SSH authentication issues with libgit2
- Need commit signing
- Custom git binary location
- Complex multi-remote workflows

**Key settings:**

- `subprocess` - Use external git binary
- `sign-on-push` - Automatic commit signing
- `executable-path` - Custom git location
- Advanced signing configuration

## Implementation:

To use any of these settings:

1. Open the relevant tier file
2. Copy the desired `[git]` section settings
3. Paste into your main `~/.config/jj/config.toml`
4. Uncomment and customize as needed
5. Test with `jj config list` to verify

## References:

- Official docs: https://jj-vcs.github.io/jj/latest/config/
- Git integration: https://jj-vcs.github.io/jj/latest/github/
- Multiple remotes: https://jj-vcs.github.io/jj/latest/guides/multiple-remotes/
