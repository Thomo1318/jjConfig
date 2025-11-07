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

