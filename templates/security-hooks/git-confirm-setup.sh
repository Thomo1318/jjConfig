#!/usr/bin/env bash
# git-confirm hook installer
# Adds interactive confirmation before commits to prevent accidental sensitive data commits

set -euo pipefail

HOOK_URL="https://cdn.rawgit.com/pimterry/git-confirm/v0.2.2/hook.sh"
HOOK_PATH=".git/hooks/pre-commit"

echo "Installing git-confirm pre-commit hook..."

# Download and install the hook
if curl -sSfL "$HOOK_URL" > "$HOOK_PATH"; then
    chmod +x "$HOOK_PATH"
    echo "✓ git-confirm hook installed successfully"
    echo ""
    echo "This hook will:"
    echo "  - Prompt for confirmation before each commit"
    echo "  - Show files being committed"
    echo "  - Prevent accidental commits of sensitive data"
else
    echo "✗ Failed to download git-confirm hook"
    exit 1
fi
