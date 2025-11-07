---

## 🤖 AI Context Integration (GitMCP)

This repository is AI-ready via [GitMCP.io](https://gitmcp.io).

**MCP Server URL:** `https://gitmcp.io/YOUR_GITHUB_USER/REPO_NAME`

### Quick Setup for AI Tools

**Cursor IDE:**
```json
{
  "mcpServers": {
    "this-repo": {
      "url": "https://gitmcp.io/YOUR_GITHUB_USER/REPO_NAME"
    }
  }
}
```

**Claude Desktop:**
Add to `~/Library/Application Support/Claude/claude_desktop_config.json`

**Context Files:**
- `.mcp/context.json` - Auto-generated repo metadata
- `.mcp/cursor-config.json` - Ready-to-use Cursor config
- `.mcp/claude-config.json` - Ready-to-use Claude config

**Auto-Update:** Context files update automatically on every commit via Git hooks (100% local, zero tokens).

---
