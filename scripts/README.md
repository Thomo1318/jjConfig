# JJ Helper Scripts

This directory contains helper scripts for extending JJ functionality.

## Scripts

### gh-helper.sh

GitHub integration helper for JJ with interactive prompts.

**Features:**
- Create GitHub repositories with interactive prompts
- Initialize jj repos and push to GitHub (all-in-one)
- Clone GitHub repos and initialize with jj
- Auto-generate descriptions from project files
- Dynamic username detection
- Input validation and error handling
- Colored output for better UX

**Dependencies:**
- [GitHub CLI (gh)](https://cli.github.com/)
- [Jujutsu (jj)](https://github.com/martinvonz/jj)
- git

**Usage:**

```bash
# Direct usage
~/.config/jj/scripts/gh-helper.sh create
~/.config/jj/scripts/gh-helper.sh init-github
~/.config/jj/scripts/gh-helper.sh clone owner/repo

# Via JJ aliases (recommended)
jj gh-create
jj init-github
jj gh-clone owner/repo
```

**Commands:**

- `create` - Create a new GitHub repository (interactive)
- `init-github` - Initialize jj repo and create GitHub repo (all-in-one)
- `clone <repo>` - Clone GitHub repo and initialize with jj
- `help` - Show help message

**Installation:**

```bash
# Ensure script is executable
chmod +x ~/.config/jj/scripts/gh-helper.sh

# Authenticate with GitHub CLI
gh auth login

# Test
~/.config/jj/scripts/gh-helper.sh help
```

## Development

### Adding New Scripts

1. Create script in this directory
2. Make it executable: `chmod +x script-name.sh`
3. Add corresponding alias in `~/.config/jj/config.toml`
4. Document in this README

### Best Practices

- Use `set -euo pipefail` for safety
- Provide clear error messages
- Check dependencies before execution
- Use colored output for better UX
- Include usage/help information
- Handle edge cases gracefully

### Testing

```bash
# Test in a temporary directory
mkdir -p /tmp/jj-test
cd /tmp/jj-test

# Run tests
~/.config/jj/scripts/gh-helper.sh create
# ... follow prompts ...

# Cleanup
cd ..
rm -rf /tmp/jj-test
```

## Contributing

When adding new scripts:
1. Follow bash best practices
2. Include comprehensive error handling
3. Add usage documentation
4. Test thoroughly before committing
5. Update this README

## License

Same as parent repository.
