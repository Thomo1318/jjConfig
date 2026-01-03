# JJ Configuration - Roadmap & Tasks

## 🚀 Immediate Roadmap

### v3.2.0 - CI/CD Foundation

**Priority:** Medium
**Status:** Planned

Establish a robust Continuous Integration pipeline to enforce quality gates automatically.

- [ ] **Linting Workflow**: Run `trunk check` on PRs
- [ ] **Security Workflow**: Run `ggshield` and `trivy` on PRs
- [ ] **Commit Workflow**: Enforce Conventional Commits (via `commitlint` or `jj` check)
- [ ] **Build Workflow**: Verify `mkdocs build` passes

---

## 🔮 Future Vision

### v4.0.0 - Advanced Security & Insights

**Priority:** Low
**Status:** backlog

- [ ] Snyk Integration (Vulnerability scanning)
- [ ] SonarQube / CodeScene (Code health metrics)
- [ ] SBOM Generation

### v5.0.0 - Automation & ChatOps

**Priority:** Low
**Status:** backlog

- [ ] Raycast AI / MCP deep integration
- [ ] Slack/Discord notification webhooks

---

## ✅ Completed Tasks (Archive)

### v3.1.0 - Documentation Site

**Released:** 2026-01-02

- [x] **MkDocs Setup:** Configured `mkdocs-material` with "Vapor" aesthetic (Synthwave/Cyberpunk).
- [x] **Deployment:** GitHub Actions workflow for `gh-pages` deployment.
- [x] **Content:** Migrated docs to static site structure.

### v3.1.0 - Documentation Site

**Priority:** High
**Status:** Planned

Transition static markdown files to a searchable, beautiful static site.

- [ ] Evaluate Static Site Generators (MkDocs-Material recommended)
- [ ] Set up `mkdocs.yml` configuration
- [ ] Configure GitHub Pages deployment
- [ ] Migrate existing `docs/` content
- [ ] Implement versioning selector (if needed)

### v3.2.0 - CI/CD Foundation

**Priority:** Medium
**Status:** Planned

Establish a robust Continuous Integration pipeline to enforce quality gates automatically.

- [ ] **Linting Workflow**: Run `trunk check` on PRs
- [ ] **Security Workflow**: Run `ggshield` and `trivy` on PRs
- [ ] **Commit Workflow**: Enforce Conventional Commits (via `commitlint` or `jj` check)
- [ ] **Build Workflow**: Verify `mkdocs build` passes

---

## 🔮 Future Vision

### v4.0.0 - Advanced Security & Insights

**Priority:** Low
**Status:** backlog

- [ ] Snyk Integration (Vulnerability scanning)
- [ ] SonarQube / CodeScene (Code health metrics)
- [ ] SBOM Generation

### v5.0.0 - Automation & ChatOps

**Priority:** Low
**Status:** backlog

- [ ] Raycast AI / MCP deep integration
- [ ] Slack/Discord notification webhooks

---

## ✅ Completed Tasks (Archive)

### v3.0.0 - Conventional Commits & Quality

**Released:** 2026-01-02

- [x] **Conventional Commits**: Implemented `jj` template & validation.
- [x] **Trunk Optimization**: Enabled `ruff`, `codespell`, `trivy`.
- [x] **Release Automation**: Integrated `git-semver` for auto-versioning.

### v1.2.0 - Security Hardening

**Released:** 2026-01-01

- [x] **GitGuardian**: `pre-push` hooks for secret scanning.
- [x] **Sanitization**: `sanitize_email.py` for PII protection.

### v1.1.0 - UI Enhancements

**Released:** 2026-01-02

- [x] **Pager**: Configured `delta` for rich diffs.
- [x] **Documentation**: Overhauled structure into `docs/` directory.

### v1.0.0 - Initial Optimization

**Released:** 2025-11-01

- [x] **Synthwave84**: Custom color scheme.
- [x] **Aliases**: Core `jj` workflow aliases.
