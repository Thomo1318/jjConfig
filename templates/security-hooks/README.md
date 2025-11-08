# Security Hooks

Prevent sensitive information from being pushed to public repositories.

## Overview

The security hooks protect against accidentally pushing sensitive information like email addresses, API keys, or credentials to public repositories.

## Hooks

### pre-push
**Purpose:** Check for sensitive information before pushing to remote

**Triggers:** Before `git push`

**Checks for:**
- Personal email addresses
- API keys (future)
- Credentials (future)
- Private tokens (future)

**Behavior:**
- Scans staged files for sensitive patterns
- Blocks push if sensitive data found
- Provides instructions to fix
- Excludes backups and build artifacts

## Installation

### Automatic (via jjConfig init)
```bash
jj init  # Installs all hooks including security
```

### Manual Installation
```bash
# Copy pre-push hook
mkdir -p .git/hooks
cp ~/.config/jj/templates/security-hooks/pre-push .git/hooks/pre-push
chmod +x .git/hooks/pre-push
```

### Update Existing Repos
```bash
jj security-update  # Install/update security hooks
```

## Email Sanitization

### Current Protection
The pre-push hook blocks pushes containing:
- `steele.thompson13@gmail.com` (real email)

Expected placeholder:
- `YOUR_EMAIL@example.com`

### Sanitize Existing Files
```bash
# Run sanitization script
python3 .build-artifacts/sanitize_email.py

# Verify changes
git diff

# Commit sanitized files
jj describe -m "security: sanitize email addresses"
```

### Manual Sanitization
```bash
# Find all occurrences
grep -r "steele.thompson13@gmail.com" --exclude-dir=.git --exclude-dir=backups .

# Replace in specific file
sed -i '' 's/steele.thompson13@gmail.com/YOUR_EMAIL@example.com/g' config.toml
```

## Usage

### Normal Workflow
```bash
# Make changes
echo 'email = "YOUR_EMAIL@example.com"' >> config.toml

# Commit
git commit -m "update config"

# Push (hook runs automatically)
git push origin main

# ✓ Push succeeds (no sensitive data)
```

### Blocked Push
```bash
# Accidentally add real email
echo 'email = "steele.thompson13@gmail.com"' >> config.toml

# Try to push
git push origin main

# Output:
# ⚠️  SECURITY WARNING: Sensitive email found in config.toml
# ❌ Push blocked: Sensitive information detected
# 
# Please run: python3 .build-artifacts/sanitize_email.py
```

## Configuration

### Add More Patterns
Edit `templates/security-hooks/pre-push`:

```bash
# Add more sensitive patterns
SENSITIVE_PATTERNS=(
    "steele.thompson13@gmail.com"
    "sk-[a-zA-Z0-9]{48}"  # OpenAI API keys
    "ghp_[a-zA-Z0-9]{36}"  # GitHub tokens
)
```

### Exclude Files
The hook automatically excludes:
- `backups/` - Historical backups
- `.build-artifacts/` - Build files
- `.git/` - Git internals
- `.jj/` - JJ internals
- `.repomix/` - Generated files

## Best Practices

### 1. Use Environment Variables
```toml
# In config.toml
[user]
email = "YOUR_EMAIL@example.com"  # Placeholder in repo

# In your shell (~/.zshrc or ~/.bashrc)
export GIT_USER_EMAIL="steele.thompson13@gmail.com"
```

### 2. Use Git Config
```bash
# Set email globally (not in repo)
git config --global user.email "steele.thompson13@gmail.com"

# JJ will use git config if not specified
```

### 3. Regular Audits
```bash
# Check for sensitive data
grep -r "steele.thompson13@gmail.com" --exclude-dir=.git .

# Run sanitization
python3 .build-artifacts/sanitize_email.py
```

## Troubleshooting

### Hook Not Running
```bash
# Check if hook exists
ls -la .git/hooks/pre-push

# Make executable
chmod +x .git/hooks/pre-push

# Test manually
.git/hooks/pre-push
```

### False Positives
```bash
# Temporarily bypass (use with caution)
git push --no-verify origin main

# Or update hook to exclude specific files
```

### Hook Blocking Valid Push
```bash
# Check what triggered the block
grep -r "steele.thompson13@gmail.com" --exclude-dir=.git .

# Fix the issue
python3 .build-artifacts/sanitize_email.py

# Retry push
git push origin main
```

## Git History Sanitization

**WARNING:** The email already exists in git commit history. To remove it completely, you need to rewrite history (destructive operation).

### Option 1: Keep History (Recommended)
- Sanitize current files only
- Use pre-push hook to prevent future exposure
- Git history remains unchanged

### Option 2: Rewrite History (Destructive)
```bash
# Backup first!
git clone --mirror . ../jjConfig-backup

# Use git filter-repo (install first)
git filter-repo --email-callback '
  return email.replace(b"steele.thompson13@gmail.com", b"YOUR_EMAIL@example.com")
'

# Force push (DANGEROUS - rewrites all history)
git push --force origin main
```

**Note:** Rewriting history affects all collaborators and breaks existing clones.

## References

- **Git Hooks:** https://git-scm.com/docs/githooks
- **Git Filter-Repo:** https://github.com/newren/git-filter-repo
- **BFG Repo-Cleaner:** https://rtyley.github.io/bfg-repo-cleaner/

## See Also

- [CONTRIBUTING.md](../../CONTRIBUTING.md) - Development guidelines
- [TROUBLESHOOTING.md](../../TROUBLESHOOTING.md) - Common issues
