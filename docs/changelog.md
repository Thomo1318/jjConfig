# JJ Configuration Version History

## v0.1.0-original (2025-11-01)

**Location:** `backups/v0.1.0-original/`
**Status:** Superseded
**Description:** Original basic configuration before optimization

**Contents:**

- name, email, color at root level (incorrect structure)
- No aliases, templates, or customizations
- name, email, color at root level (incorrect structure)

---

## v1.2.1-docs (2026-01-01)

**Location:** `backups/v1.2.1-docs/` (TBD)
**Status:** Released
**Description:** Documentation Overhaul and centralisation.

**Key Features:**

- **Centralized Docs**: New `docs/` directory with `guides/`, `reference/`, `architecture/`.
- **Navigation Hub**: Root `README.md` simplified to point to sub-docs.
- **Workflow Guides**: Explicit "Gold Standard" contribution workflow documentation.

## v1.2.0-security (2026-01-01)

**Location:** `backups/v1.2.0-security/` (TBD)
**Status:** In Development
**Description:** Major security and quality hardening release.

**Key Features:**

- **Safety Net**: `pre-push` hook with PII grep + GitGuardian scanning
- **Code Quality**: Trunk.io integration (Prettier, Shellcheck, etc.)
- **AI Review**: `scripts/ai-review.sh` for on-demand CodeRabbit analysis
- **Workflow**: Automated `/publish-change` agent workflow
- **Automation**: `sanitize_email.py` auto-discovery

## v3.0.0-conventional (2026-01-02)

**Location:** `backups/v3.0.0-conventional/`
**Status:** Released
**Description:** Implemented Conventional Commits and optimized Trunk configuration.

**Key Features:**

- **Conventional Commits**: `jj describe` template (Gold Standard).
- **Trunk Optimization**: Added `ruff` (Python), `codespell` (Typos), and `trivy` (Security).
- **UI**: Upgrade pager to `delta` for rich diffs.
- **Documentation**: Updated `usage.md` and `CONTRIBUTING.md`.

---

## v1.0.0-optimized (2025-11-01) ← CURRENT

**Location:** `backups/v1.0.0-optimized/`
**Status:** Active
**Description:** Comprehensive optimization with all 13 approved changes

**Breaking Changes:**

- Fixed TOML structure (moved settings to proper sections)

**New Features:**

- jj-fzf TUI integration
- Synthwave84 color scheme (30+ colors)
- 15 starter aliases
- 7 revset aliases
- Git integration settings
- Template aliases
- Revsets section configuration

**Reference Files:** 21 files across 6 directories

---

## Future Versions (Planned)

### v2.0.0-formatters

**Status:** Planned
**Description:** Code formatters and linters

- [fix.tools] for Ruff, Prettier, Black, Pyright
- MegaLinter integration
- Trunk.io integration
- python-lsp, pylint

### v3.0.0-conventional

**Status:** Planned
**Description:** Conventional Commits integration

- Commit message templates
- Conventional Commits spec compliance
- Auto-generated changelogs

### v4.0.0-release-automation

**Status:** Planned
**Description:** Release automation tooling

- release-please OR semantic-release OR GitVersion OR release-it
- Automated version bumping
- Changelog generation

### v5.0.0-cicd

**Status:** Planned
**Description:** CI/CD pipeline integration

- GitHub Actions workflows
- CircleCI configuration
- Jenkins integration

### v6.0.0-security

**Status:** Planned
**Description:** Security and code quality tools

- GitGuardian ggshield
- Snyk, Semgrep, Trivy
- SonarQube, Checkmarx, CodeScene

---

## Future Tasks & Enhancements

### v1.1.0-pager (Next Minor Release)

**Status:** Planned
**Priority:** Medium
**Description:** Evaluate and potentially change pager configuration

**Current Setting:**

```toml
[ui]
pager = \":builtin\"
```

**Alternatives to Consider:**

- **delta** - Syntax-highlighted diffs with side-by-side view
  ```toml
  pager = [\"delta\", \"--line-numbers\", \"--navigate\", \"--side-by-side\"]
  ```
- **bat** - Syntax highlighting with Git integration
  ```toml
  pager = [\"bat\", \"--style=plain\", \"--paging=always\"]
  ```
- **diff-so-fancy** - Human-friendly diffs
  ```toml
  pager = [\"sh\", \"-c\", \"diff-so-fancy | less -RFX\"]
  ```
- **less** - Traditional Unix pager
  ```toml
  pager = [\"less\", \"-FRX\"]
  ```

**Decision Points:**

- Test builtin pager first in daily use
- Evaluate if external pager provides better UX
- Consider installation requirements
- Check performance with large diffs

**Reference:** `~/.config/jj/ui-configs/tier3-advanced-ui.toml`
