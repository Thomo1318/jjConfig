# Documentation Audit & Improvement Plan

## 1. Executive Summary

The current documentation is **functional but fragmented**. While the root `README.md` and newly updated `CONTRIBUTING.md` are high-quality, relevant technical details are scattered across 10+ sub-directory READMEs. This "folder-per-topic" structure hurts discoverability. Additionally, `aliases/README.md` contains outdated status information ("NOT YET CREATED" for files that exist).

## 2. Issues Identified

### A. Fragmentation (Too Many READMEs)

The project attempts to document each config section in its own folder. This leads to deep nesting:

- `git-configs/README.md`
- `ui-configs/README.md`
- `revsets/README.md`
- `revsets-config/README.md`
- `template-configs/README.md`
- ...and 5 more.

**Impact**: Users can't generic "search" the docs easily. "How do I configure colors?" requires navigating to `ui-configs/README.md`.

### B. Outdated Content

- **`aliases/README.md`**: Lists "Starter aliases" as "Missing/Not Yet Created", but `config.toml` clearly implements them. It references "Status: CREATED" for files that are likely part of the main config now.
- **`QUICKSTART.md`**: Need to verify if this aligns with the new "Golden Workflow".

### C. Styling Inconsistencies

- Some files use `## Header` while others (likely the older sub-readmes) might use inconsistent specific formatting.
- `README.md` uses "Synthwave" emoji style (good), but deep docs are dry.

### D. Table of Contents

- `README.md` has a decent ToC.
- `CONTRIBUTING.md` has a ToC.
- Sub-READMEs lack navigation back to root.

## 3. Proposed Improvement Plan (Zero Code Changes)

### Phase 1: Consolidation (The "Big Merge")

Instead of hidden READMEs, we should consolidate them into a centralized `docs/` folder or merge them into few, high-impact guides.

**Recommendation**:

1.  **Create `docs/` directory**.
2.  **Move & Rename**:
    - `ui-configs/README.md` -> `docs/configuration-ui.md`
    - `git-configs/README.md` -> `docs/configuration-git.md`
    - `revsets/README.md` -> `docs/configuration-revsets.md`
    - `aliases/README.md` -> `docs/configuration-aliases.md`
3.  **Update `README.md`**: replace deep links with links to `docs/*.md`.

### Phase 2: Updating Content

1.  **Refactor `docs/configuration-aliases.md`**: Remove "Status" columns. Just list the aliases available in `config.toml`.
2.  **Verify `QUICKSTART.md`**: Ensure it mentions `trunk setup` or `jj security-sanitize` if applicable (or keep it simple for new users).

### Phase 3: Navigation & Style

1.  Add specific **"Back to Main README"** link at the top of every doc.
2.  Add a **"Quick Links"** header to every doc: `[Usage] | [Config] | [Contributing]`.

## 4. Immediate Action Items (Next Phase)

1.  Verify content of `QUICKSTART.md`.
2.  Verify `ui-configs/README.md` content to see if it's worth keeping or merging.
3.  **Present this plan to user**.
