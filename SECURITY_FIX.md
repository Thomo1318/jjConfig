# Security Fix Required: .op/ Directory Committed

## Issue
The `.op/plugins/gh.json` file was accidentally committed to git history in PR #5.

## What Was Exposed
- 1Password account ID
- Vault ID references
- Item ID references
- **NOT the actual PAT** (stored securely in 1Password)

## Severity
**Medium** - Metadata exposed, but not actual credentials

## Remediation Options

### Option 1: Remove from History (Recommended if repo is private)
```bash
# Remove .op/ from all commits
git filter-branch --force --index-filter \
  "git rm -r --cached --ignore-unmatch .op/" \
  --prune-empty --tag-name-filter cat -- --all

# Force push (WARNING: rewrites history)
git push origin --force --all
```

### Option 2: Accept and Move Forward (If repo is private)
- The metadata alone is not exploitable
- Actual PAT is in 1Password, not exposed
- Add .op/ to .gitignore (already done)
- Ensure .op/ is never committed again

### Option 3: Rotate 1Password References (Most Secure)
- Regenerate the GitHub PAT in 1Password
- This invalidates the old vault references
- Re-authenticate gh CLI

## Prevention
- Always check `git status` before committing
- Use `jj describe` carefully (stages all changes)
- Verify .gitignore is working before commits
