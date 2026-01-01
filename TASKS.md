# JJ Configuration - Pending Tasks & Future Enhancements

## Immediate Tasks

### TASK 1: Evaluate Pager Configuration

**Priority:** Medium  
**Version:** v1.1.0-pager  
**Status:** Pending

**Current:** Using `:builtin` pager  
**Action:** Test in daily use, consider alternatives (delta, bat, diff-so-fancy)  
**Reference:** `ui-configs/tier3-advanced-ui.toml`

### TASK 2: Audit Trunk Configuration

**Priority:** High
**Status:** ✅ Complete
**Action:** Investigate `trunk check` autofix behavior (caused brace corruption in shell scripts). Ensure `.trunk/trunk.yaml` is configured for safety (Gold Standard).

### TASK 3: Documentation Overhaul

**Priority:** High
**Status:** ✅ Complete
**Action:** Consolidate fragmented READMEs, fix broken links, standardize formatting, and improve navigation.
**Reference:** `documentation_audit.md`

### TASK 4: Docs Site Generation

**Priority:** Medium
**Status:** Planned
**Action:** Evaluate and implement a static site generator (e.g., MkDocs) for project documentation.

### TASK 5: Update Roadmap

**Priority:** Medium
**Status:** Pending
**Action:** Review and refine the project roadmap (TASKS.md, VERSION_HISTORY.md) to ensure it reflects current priorities and completed work.

---

## Future Version Tasks

### v2.0.0-formatters - Code Formatters & Linters

**Priority:** High  
**Status:** Planned

**Tools to Integrate:**

- [x] Ruff (Configured in Trunk v1)
- [x] Prettier (Configured in Trunk)
- [x] MegaLinter (Skipped - using Trunk)
- [ ] python-lsp (Language server)
- [ ] pylint (Python linter)
- [ ] black (Python formatter)
- [ ] pyright (Python type checker)
- [x] Trunk.io (Implemented v1.2.0)

**Configuration Section:** `[fix.tools]`  
**Reference:** `ui-configs/tier3-advanced-ui.toml`

---

### v3.0.0-conventional - Conventional Commits

**Priority:** Medium  
**Status:** ✅ Complete

**Spec:** https://www.conventionalcommits.org/en/v1.0.0/

**Implementation:**

- [x] Commit message templates
- [x] Validation hooks (Trunk/Commitlint)
- [x] Changelog generation (Enabled via git-semver/workflow)
- [x] Scope definitions

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
- [x] git-semver (https://github.com/mdomke/git-semver)

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

- [x] GitGuardian ggshield (Implemented v1.2.0)
- [ ] Snyk (Deferred to agent rules)
- [ ] Semgrep (via Trunk)
- [x] Trivy (via Trunk)
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

- [x] v2.0.0 - Code formatters (Trunk.io integrated)
- [ ] v3.0.0 - Conventional commits
- [ ] v4.0.0 - Release automation
- [ ] v5.0.0 - CI/CD integration
- [x] v6.0.0 - Security tools (Partially Implemented v1.2.0)

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
**Status:** ✅ Implemented

**Purpose:** Streamline GitHub repo creation from jj

**Implementation:** External script approach (recommended in Task4.md analysis)

**Features Implemented:**

- [x] Interactive repo creation with prompts
- [x] Auto-generate description from repo content (README.md, package.json, pyproject.toml, Cargo.toml)
- [x] Choose public/private visibility
- [x] Dynamic GitHub username detection (no hardcoding)
- [x] Input validation and error handling
- [x] Dependency checking (gh, jj, git)
- [x] All-in-one init-github workflow
- [x] Clone and initialize workflow
- [x] Colored output and better UX
- [ ] Automatic commit signing (deferred to v1.2.0-security)

**Implemented Solution:**

**File Structure:**

```
~/.config/jj/
├── scripts/
│   ├── gh-helper.sh          # Main helper script
│   └── README.md             # Documentation
└── config.toml               # JJ config with aliases
```

**Aliases (in config.toml):**

```toml
[aliases]
# GitHub integration (uses external script for better UX)
gh-create = ["util", "exec", "--", "bash", "-c", "~/.config/jj/scripts/gh-helper.sh create"]
init-github = ["util", "exec", "--", "bash", "-c", "~/.config/jj/scripts/gh-helper.sh init-github"]
gh-clone = ["util", "exec", "--", "bash", "-c", "~/.config/jj/scripts/gh-helper.sh clone \"$@\"", "--"]
```

**Usage Examples:**

```bash
# Create a new GitHub repo (interactive)
jj gh-create

# Initialize jj repo and create GitHub repo (all-in-one)
jj init-github

# Clone and initialize with jj
jj gh-clone owner/repo
jj gh-clone https://github.com/owner/repo
```

**Key Improvements Over Original Plan:**

| Feature         | Original Plan              | Implemented Solution                      |
| --------------- | -------------------------- | ----------------------------------------- |
| Error Handling  | Minimal (`set -e`)         | Comprehensive validation                  |
| Username        | Hardcoded "Thomo1318"      | Dynamic via `gh api user`                 |
| Description     | Basic README check         | Multi-source (README, package.json, etc.) |
| Maintainability | Inline bash (hard to edit) | Separate script file                      |
| UX              | Plain text                 | Colored output, progress indicators       |
| Testing         | Difficult                  | Easy to test independently                |
| Dependencies    | No checking                | Validates gh, jj, git, auth status        |

**Installation Steps:**

```bash
# 1. Create scripts directory
mkdir -p ~/.config/jj/scripts

# 2. Copy gh-helper.sh script
cp ~/.config/jj/scripts/gh-helper.sh ~/.config/jj/scripts/
chmod +x ~/.config/jj/scripts/gh-helper.sh

# 3. Update config.toml with new aliases (already done)

# 4. Test the script
~/.config/jj/scripts/gh-helper.sh help

# 5. Ensure gh is authenticated
gh auth status || gh auth login
```

**Testing Results:**

- ✅ Help command works
- ✅ Script is executable
- ✅ All dependencies available (gh, jj, git)
- ✅ Invalid command handling works
- ✅ Auto-description generation works
- ⚠️ Interactive tests require GitHub authentication

**Commit Signing Integration:**

**Note:** Commit signing moved to v1.2.0-security for proper implementation
with key management and testing.

```toml
[signing]
sign-all = true
backend = "ssh"
key = "~/.ssh/id_ed25519"
```

**Reference:**

- GitHub CLI: https://cli.github.com/
- SSH signing: https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification
- jj signing docs: https://jj-vcs.github.io/jj/latest/config/#signing
- Bash best practices: https://google.github.io/styleguide/shellguide.html
- Task4.md analysis: Comprehensive evaluation of implementation approaches
