---
description: Pipeline to test, sanitize, and publish changes to jjConfig
---

### 1. Quality Assurance

Verify that the code meets quality standards and documentation is up to date.

0. Update Documentation Checklist:
   - [ ] `TASKS.md`: Mark completed items, add next steps
   - [ ] `backups/VERSION_HISTORY.md`: Add version/change notes
   - [ ] `README.md`: Update feature list if user-facing changes

1. Check for linting and formatting errors
   `trunk check`

2. (Optional) Run AI review for final check
   `scripts/ai-review.sh`

### 2. Security & Sanitization

**CRITICAL**: Remove all personal identifiable information (PII) before snapshotting.

// turbo 3. Run the robust sanitization script (includes auto-discovery)
`jj security-sanitize`

### 3. Commit & Publish

Finalize the snapshot and push to the remote.

4. Describe the changes (Write a good commit message)
   `jj describe`

5. Push to GitHub (Triggers GitGuardian pre-push hook)
   `jj git push`

6. Create the Pull Request
   `gh pr create --web`

### 4. Restore Local State

**Important**: Restore your local configuration (email) so you can continue working.

7. Restore PII (Email)
   `python3 .build-artifacts/sanitize_email.py --restore`

### 5. Release (After Merge)

Once the PR is approved and merged into the integration branch:

8. Create a release tag (Automated)

   ```bash
   # Dry run to check version
   jj next-minor

   # Create release
   gh release create $(jj next-minor) --generate-notes
   ```
