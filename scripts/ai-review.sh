#!/bin/bash
# scripts/ai-review.sh
# 🐰 Wrapper for CodeRabbit CLI (Gemini Integration)
# Usage: ./scripts/ai-review.sh [uncommitted|committed|all]

TYPE="${1:-uncommitted}"

# 1. Check if CodeRabbit is installed
if ! command -v coderabbit &> /dev/null; then
    echo "❌ Error: 'coderabbit' CLI not found."
    echo "Please install it: curl -fsSL https://cli.coderabbit.ai/install.sh | sh"
    exit 1
fi

echo "🐰 Rabbit Check: Analyzing $TYPE changes..."
echo "----------------------------------------"

# 2. Run CodeRabbit in Machine-Readable mode (--prompt-only)
# We capture stderr to check for "No files found" which is not a real error for us.
OUTPUT=$(coderabbit review --prompt-only -t "$TYPE" 2>&1)
EXIT_CODE=$?

# 3. Handle Output
if [[ $EXIT_CODE -ne 0 ]]; then
    if echo "$OUTPUT" | grep -q "No files found"; then
        echo "✅ Clean State: No changes found to review."
        exit 0
    else
        echo "❌ Review Failed:"
        echo "$OUTPUT"
        exit $EXIT_CODE
    fi
fi

# 4. Success - Print the AI Analysis
echo "$OUTPUT"
echo "----------------------------------------"
echo "✅ Analysis Complete."
