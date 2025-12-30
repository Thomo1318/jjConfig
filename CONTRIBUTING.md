# 🤝 Contributing to jjConfig

Thank you for your interest in contributing to jjConfig! This guide will help you get started.

---

## 📋 Table of Contents

- [Development Setup](#development-setup)
- [Making Changes](#making-changes)
- [Testing Changes](#testing-changes)
- [Backup Strategy](#backup-strategy)
- [Version Numbering](#version-numbering)
- [Pull Request Process](#pull-request-process)
- [Code Style](#code-style)

---

## 🔧 Development Setup

### 1. Fork and Clone

```bash
# Fork the repository on GitHub, then:
git clone https://github.com/YOUR_USERNAME/jjConfig.git
cd jjConfig
 2. Create Development Branch
 jj new
jj describe -m "feat: your feature description"
 3. Test Your Setup
 # Validate configuration syntax
make test

# Deploy to test
make deploy
 ## ✏️ Making Changes

### The Golden Workflow

Follow this "Inner Loop" to ensure quality and security:

#### 1. The Inner Loop (Iterate)
> **Goal**: Get the code working and documented locally.
1.  **Code**: `micro config.toml` (Edit your files)
2.  **Test**: `make test` or `trunk check` (Verify immediately)
3.  **Docs**: Update `README.md` or `alias/*.md` **in parallel** with code changes.
4.  *Repeat until tests pass and docs match code.*

#### 2. Quality Assurance
> **Goal**: Polish before committing.
1.  **Formating**: `trunk fmt` (Standardize style)
2.  **AI Review**: `scripts/ai-review.sh` (Catch bugs/impovements)

#### 3. Commit & Sanitize
> **Goal**: Secure your work.
1.  **Snapshot**: `jj describe -m "feat: description"`
2.  **Sanitize**: `jj security-sanitize` (Scrub PII/emails)
    *   *Critical*: Must run before pushing!

#### 4. Publish
> **Goal**: Share with the world.
1.  **Push**: `jj git push`
    *   *Note*: This triggers the `pre-push` hook (GitGuardian).
2.  **PR**: `gh pr create` (Triggers CI/CD)

### Adding New Features
1.	Create reference file in appropriate directory
2.	Add to README in that directory
3.	Update main README if user-facing
4.	Add to TASKS.md if part of roadmap
🧪 Testing Changes
Syntax Validation
 # Test configuration syntax
make test

# List all config values
jj config list
 Functional Testing
 # Test aliases
jj YOUR_NEW_ALIAS

# Test revsets
jj log -r 'YOUR_NEW_REVSET()'

# Test colors
jj log --color=always
 Integration Testing
 # Test in a new repository
mkdir test-repo
cd test-repo
jj init
# ... test your changes
 💾 Backup Strategy
Before Major Changes
 # Create timestamped backup
make backup
 This creates: ⁠backups/manual/backup-YYYYMMDD-HHMMSS/
Version Backups
When releasing a new version:
 # Create version backup
mkdir -p backups/v1.X.Y-description
cp config.toml backups/v1.X.Y-description/
 Update ⁠backups/VERSION_HISTORY.md with:
	•	Version number 	•	Date 	•	Description 	•	Breaking changes 	•	New features
🔢 Version Numbering
We follow Semantic Versioning:
Format: ⁠MAJOR.MINOR.PATCH
	•	MAJOR - Breaking changes (e.g., config structure changes) 	•	MINOR - New features (backward compatible) 	•	PATCH - Bug fixes (backward compatible)
Examples
	•	⁠v1.0.0 → ⁠v1.1.0 - Added GitMCP integration (new feature) 	•	⁠v1.1.0 → ⁠v1.1.1 - Fixed alias typo (bug fix) 	•	⁠v1.1.1 → ⁠v2.0.0 - Changed config structure (breaking change)
Version Suffixes
	•	⁠-draft - Work in progress 	•	⁠-rc1 - Release candidate 	•	⁠-beta - Beta release
📤 Pull Request Process
1. Prepare Your Changes
 # Ensure working copy is clean
jj st

# Describe your change
jj describe -m "feat: add new feature"

# Push to your fork
jj push
 2. Create Pull Request
	•	Title: Use conventional commit format
	▪	⁠feat: - New feature 	▪	⁠fix: - Bug fix 	▪	⁠docs: - Documentation only 	▪	⁠style: - Formatting, no code change 	▪	⁠refactor: - Code restructuring 	▪	⁠test: - Adding tests 	▪	⁠chore: - Maintenance tasks 	•	Description: Include:
	▪	What changed 	▪	Why it changed 	▪	How to test 	▪	Related issues
3. Review Process
	•	Maintainer will review within 7 days 	•	Address any feedback 	•	Once approved, changes will be merged
📝 Code Style
TOML Configuration
 # Use double quotes for strings
key = "value"

# Group related settings
[section]
setting1 = "value1"
setting2 = "value2"

# Add comments for complex settings
# This setting controls X behavior
complex_setting = "value"
 Shell Scripts
 #!/usr/bin/env bash
# Script description

set -e  # Exit on error

# Use descriptive variable names
REPO_NAME="example"

# Add comments for complex logic
# This checks if the repository exists
if [ -d "$REPO_NAME" ]; then
    echo "Repository exists"
fi
 Markdown
 # Use ATX-style headers

## Second level

### Third level

- Use hyphens for unordered lists
- Not asterisks or plus signs

1. Use numbers for ordered lists
2. Even if they're all "1."

`Use backticks for inline code`

\`\`\`bash
# Use fenced code blocks with language
echo "Hello"
\`\`\`
 🐛 Reporting Issues
Before Creating an Issue
	1.	Check existing issues 	2.	Review TROUBLESHOOTING.md 	3.	Test with latest version
Issue Template
 **Description**
Clear description of the issue

**Steps to Reproduce**
1. Step one
2. Step two
3. ...

**Expected Behavior**
What should happen

**Actual Behavior**
What actually happens

**Environment**
- jj version: `jj --version`
- OS: macOS/Linux
- jjConfig version: v1.1.0

**Additional Context**
Any other relevant information
 💡 Feature Requests
We welcome feature requests! Please include:
	•	Use case: Why is this feature needed? 	•	Proposed solution: How should it work? 	•	Alternatives considered: Other approaches you've thought about 	•	Additional context: Examples, mockups, etc.
📞 Getting Help
	•	GitHub Issues: https://github.com/Thomo1318/jjConfig/issues 	•	GitHub Discussions: https://github.com/Thomo1318/jjConfig/discussions 	•	jj Discord: https://discord.gg/dkmfj3aGQN
🙏 Thank You!
Your contributions make jjConfig better for everyone. We appreciate your time and effort!
Happy contributing! 🎉
 
---
```
