# JJ Configuration - Pending Tasks & Future Enhancements

## Immediate Tasks

### TASK 1: Evaluate Pager Configuration
**Priority:** Medium  
**Version:** v1.1.0-pager  
**Status:** Pending

**Current:** Using `:builtin` pager  
**Action:** Test in daily use, consider alternatives (delta, bat, diff-so-fancy)  
**Reference:** `ui-configs/tier3-advanced-ui.toml`

---

## Future Version Tasks

### v2.0.0-formatters - Code Formatters & Linters
**Priority:** High  
**Status:** Planned

**Tools to Integrate:**
- [ ] Ruff (Python linter/formatter)
- [ ] Prettier (JS/TS/JSON/MD formatter)
- [ ] MegaLinter (https://github.com/oxsecurity/megalinter)
- [ ] python-lsp (Language server)
- [ ] pylint (Python linter)
- [ ] black (Python formatter)
- [ ] pyright (Python type checker)
- [ ] Trunk.io (https://trunk.io/)

**Configuration Section:** `[fix.tools]`  
**Reference:** `ui-configs/tier3-advanced-ui.toml`

---

### v3.0.0-conventional - Conventional Commits
**Priority:** Medium  
**Status:** Planned

**Spec:** https://www.conventionalcommits.org/en/v1.0.0/

**Implementation:**
- [ ] Commit message templates
- [ ] Validation hooks
- [ ] Changelog generation
- [ ] Scope definitions

**Configuration:** `templates.draft_commit_description`

---

### v4.0.0-release-automation - Release Management
**Priority:** Medium  
**Status:** Planned

**Tool Options (Choose ONE):**
- [ ] release-please (https://github.com/googleapis/release-please)
- [ ] semantic-release (https://github.com/semantic-release/semantic-release)
- [ ] GitVersion (https://github.com/GitTools/GitVersion)
- [ ] release-it (https://github.com/release-it/release-it)

**Features:**
- Automated version bumping
- Changelog generation
- GitHub release creation
- Tag management

---

### v5.0.0-cicd - CI/CD Integration
**Priority:** High  
**Status:** Planned

**Platforms:**
- [ ] GitHub Actions
- [ ] CircleCI (https://circleci.com/)
- [ ] Jenkins (https://www.jenkins.io/)

**Workflows:**
- Automated testing
- Code quality checks
- Security scanning
- Deployment automation

---

### v6.0.0-security - Security & Code Quality
**Priority:** High  
**Status:** Planned

**Tools to Integrate:**
- [ ] GitGuardian ggshield (https://www.gitguardian.com/ggshield)
- [ ] Snyk (https://snyk.io/)
- [ ] Semgrep (https://semgrep.dev/)
- [ ] Trivy (https://trivy.dev/latest/)
- [ ] SonarQube (https://www.sonarsource.com/products/sonarqube/)
- [ ] Checkmarx (https://checkmarx.com/)
- [ ] CodeScene-CE (https://codescene.com/product/codescene-for-open-source)
- [ ] Task (https://github.com/go-task/task)

**Integration Points:**
- Pre-commit hooks
- CI/CD pipelines
- IDE integration
- Automated scanning

---

## Task Tracking

### Completed
- [x] v0.1.0 - Original config backup
- [x] v1.0.0 - Optimized configuration with Synthwave84

### In Progress
- [ ] v1.1.0 - Pager evaluation

### Planned
- [ ] v2.0.0 - Code formatters
- [ ] v3.0.0 - Conventional commits
- [ ] v4.0.0 - Release automation
- [ ] v5.0.0 - CI/CD integration
- [ ] v6.0.0 - Security tools

---

## Notes

- All tier2/tier3 reference files created and ready for implementation
- 21 reference files across 6 directories
- SemVer backup structure in place
- Configuration tested and working

---

## TODO Items

### TODO 1: Assess Raycast AI MCP Integration
**Priority:** Medium  
**Version:** TBD  
**Status:** Research needed

**Question:** Can Raycast AI automatically use `.mcp/context.json` files for repo context?

**Action Items:**
- [ ] Check Raycast AI documentation for MCP support
- [ ] Test if Raycast AI can read local `.mcp/` files
- [ ] Determine if manual configuration needed
- [ ] If not supported: Create workaround (e.g., prompt templates)
- [ ] If supported: Document configuration steps

**Current State:**
- GitMCP integration creates `.mcp/context.json` locally
- Works with Cursor IDE, Claude Desktop (confirmed)
- Raycast AI compatibility: **UNKNOWN**

**Fallback:**
- Use context files as reference in prompts
- Copy `.mcp/README.md` content when needed
- Use MCP-compatible tools (Cursor, Claude) for AI-assisted development

**Reference:** 
- GitMCP article: https://medium.com/the-context-layer/stop-letting-ai-guess-your-code-instantly-make-every-github-repo-ai-savvy-with-this-one-liner-cc23e00c9ea2
- Raycast AI docs: https://developers.raycast.com/


---

## GitHub Integration TODO

### TODO 4: GitHub CLI Integration with Interactive Prompts
**Priority:** High  
**Version:** v1.1.1-gh-integration  
**Status:** Planned

**Purpose:** Streamline GitHub repo creation from jj

**Features to Implement:**
- [ ] Interactive repo creation with prompts
- [ ] Auto-generate description from repo content
- [ ] Choose public/private visibility
- [ ] Automatic commit signing
- [ ] All-in-one init-github workflow

**Proposed Aliases:**

```toml
[aliases]
# Interactive GitHub repo creation
gh-create = ["util", "exec", "--", "bash", "-c", '''
set -e

# Interactive prompts
read -p "Repository name: " REPO_NAME
read -p "Description (press Enter to auto-generate): " DESCRIPTION

# Auto-generate description if empty
if [ -z "$DESCRIPTION" ]; then
    # Try to extract from README.md first line
    if [ -f README.md ]; then
        DESCRIPTION=$(head -1 README.md | sed "s/^# //")
    else
        DESCRIPTION="Personal repository"
    fi
    echo "Auto-generated description: $DESCRIPTION"
fi

# Choose visibility
echo "Visibility:"
echo "  1) Public"
echo "  2) Private"
read -p "Choose (1 or 2): " VISIBILITY

if [ "$VISIBILITY" = "2" ]; then
    VISIBILITY_FLAG="--private"
else
    VISIBILITY_FLAG="--public"
fi

# Create repo
echo "Creating GitHub repository: Thomo1318/$REPO_NAME"
gh repo create "Thomo1318/$REPO_NAME" $VISIBILITY_FLAG --description "$DESCRIPTION"

echo "✓ Repository created: https://github.com/Thomo1318/$REPO_NAME"
''']

# All-in-one: init + create GitHub + push
init-github = ["util", "exec", "--", "bash", "-c", '''
set -e

# Interactive prompts
read -p "Repository name: " REPO_NAME
read -p "Description (press Enter to auto-generate): " DESCRIPTION

if [ -z "$DESCRIPTION" ]; then
    if [ -f README.md ]; then
        DESCRIPTION=$(head -1 README.md | sed "s/^# //")
    else
        DESCRIPTION="Personal repository"
    fi
fi

echo "Visibility:"
echo "  1) Public"
echo "  2) Private"
read -p "Choose (1 or 2): " VISIBILITY

VISIBILITY_FLAG="--public"
[ "$VISIBILITY" = "2" ] && VISIBILITY_FLAG="--private"

# Create GitHub repo
gh repo create "Thomo1318/$REPO_NAME" $VISIBILITY_FLAG --description "$DESCRIPTION"

# Initialize jj with MCP
jj init

# Add remote
git remote add origin "https://github.com/Thomo1318/$REPO_NAME.git"

# Create main bookmark
jj bookmark create main -r @-

# Push
jj git push --bookmark main --allow-new

echo "✓ Complete! https://github.com/Thomo1318/$REPO_NAME"
''']

# Clone GitHub repo and init with jj
gh-clone = ["util", "exec", "--", "bash", "-c", '''
REPO_URL="$1"
gh repo clone "$REPO_URL"
REPO_NAME=$(basename "$REPO_URL")
cd "$REPO_NAME"
jj init
''']
```

**Commit Signing Integration:**

```toml
[signing]
# TODO: Configure commit signing (v1.2.0-security)
# behavior = "own"              # Sign your own commits
# backend = "ssh"               # Use SSH keys (or "gpg")
# key = "~/.ssh/id_ed25519.pub" # Path to your public key

[git]
# TODO: Enable sign-on-push (v1.2.0-security)
# sign-on-push = true           # Auto-sign when pushing
```

**Setup Steps (when implementing v1.1.1):**

1. Generate SSH signing key (if not exists):
```bash
ssh-keygen -t ed25519 -C "YOUR_EMAIL@example.com" -f ~/.ssh/id_ed25519_signing
```

2. Add public key to GitHub:
- Go to GitHub Settings → SSH and GPG keys
- Add new SSH key (Signing Key)
- Paste contents of `~/.ssh/id_ed25519_signing.pub`

3. Configure Git to use SSH signing:
```bash
git config --global gpg.format ssh
git config --global user.signingkey ~/.ssh/id_ed25519_signing.pub
git config --global commit.gpgsign true
```

4. Add to jj config:
```toml
[signing]
behavior = "own"
backend = "ssh"
key = "~/.ssh/id_ed25519_signing.pub"

[git]
sign-on-push = true
```

**Reference:**
- GitHub CLI: https://cli.github.com/
- SSH signing: https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification
- jj signing docs: https://jj-vcs.github.io/jj/latest/config/#signing

