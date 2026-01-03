# Security Hooks

This directory contains git hooks for preventing accidental commits of sensitive information.

## Available Hooks

### pre-push

Sanitizes sensitive information before pushing to remote repositories.

**Features:**

- Checks for personal email addresses
- Validates repomix files
- Can be extended for other sensitive data patterns

**Usage:**
Automatically installed with `jj init` or `jj mcp-update`

### pre-commit-confirm (git-confirm)

Interactive confirmation before each commit to prevent accidental commits.

**Features:**

- Shows files being committed
- Prompts for confirmation
- Prevents accidental sensitive data commits
- Lightweight and non-intrusive

**Installation:**
Automatically installed with `jj init` (v1.1.2+)

**Manual Installation:**

```bash
curl -sSfL https://cdn.rawgit.com/pimterry/git-confirm/v0.2.2/hook.sh > .git/hooks/pre-commit-confirm
chmod +x .git/hooks/pre-commit-confirm
```

**Source:** [git-confirm by pimterry](https://github.com/pimterry/git-confirm)

## Hook Installation

All security hooks are automatically installed when you run:

```bash
jj init
```

Or update existing repos with:

```bash
jj security-update
```

## Customization

You can customize the hooks by editing the files in this directory, then re-running:

```bash
jj security-update
```

## Disabling Hooks

To temporarily disable a hook:

```bash
chmod -x .git/hooks/hook-name
```

To re-enable:

```bash
chmod +x .git/hooks/hook-name
```

## Best Practices

1. **Never commit sensitive data** - Even with hooks, be vigilant
2. **Review changes before committing** - Use `jj diff` or `git diff`
3. **Use .gitignore** - Prevent sensitive files from being tracked
4. **Rotate credentials** - If accidentally committed, rotate immediately
5. **Use environment variables** - Never hardcode secrets in code

## Related Tools

- **git-secrets** - AWS secret scanning
- **gitleaks** - Comprehensive secret detection
- **trufflehog** - Find secrets in git history
- **git-crypt** - Transparent file encryption in git

## References

- [git-confirm](https://github.com/pimterry/git-confirm)
- [GitHub: Removing sensitive data](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository)
- [OWASP: Secrets Management](https://owasp.org/www-community/vulnerabilities/Use_of_hard-coded_password)
