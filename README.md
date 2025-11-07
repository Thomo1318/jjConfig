# JJ Configuration Repository

Personal Jujutsu configuration with Synthwave84 theme, comprehensive aliases, and GitMCP integration.

## Features

- Synthwave84 Color Scheme
- 20+ Aliases
- Smart Revsets
- Git Integration
- GitMCP Integration with local hooks
- jj-fzf TUI
- 21 Reference Files
- SemVer Tracking

## Installation

Clone this repo:
```bash
git clone https://github.com/Thomo1318/jjConfig.git ~/dev/activeProjects/jjConfig
```

Deploy via symlink:
```bash
cd ~/dev/activeProjects/jjConfig
make deploy
```

## Usage

Initialize new repo with GitMCP:
```bash
jj init
```

Common aliases:
```bash
jj st    # Status
jj l     # Log
jj push  # Push with --allow-new
jj sync  # Fetch all remotes
```

## Version History

Current: v1.1.0-mcp-integration

See VERSION_HISTORY.md for complete changelog.

## Author

Thomo1318 (steele.thompson13@gmail.com)

## License

MIT License - See LICENSE file

## AI Context Integration

This configuration automatically sets up GitMCP integration for all new repositories.

When you run jj init:
- Repository initialized with jj
- GitMCP hooks installed automatically
- .mcp/context.json generated
- 100% local processing (zero tokens)

For GitHub repos MCP Server URL: https://gitmcp.io/YOUR_USERNAME/REPO_NAME
