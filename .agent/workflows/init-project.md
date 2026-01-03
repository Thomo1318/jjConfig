---
description: Initialize a new project with JJ, Git, Mise, GitHub, and ekkOS integration
---

# Initialize Project (JJ + Mise + GitHub + ekkOS)

This workflow sets up a new project using `jjConfig` automation where available, manual steps for the rest, and registers it with ekkOS memory.

## Prerequisites

- **jjConfig**: Installed and configured (provides `jj init` and `jj gh-create`)
- **Mise**: Installed (`mise --version`)
- **ekkOS**: Connected and available

---

## Phase 1: Project Scaffolding & Tooling

1. Initialize `mise.toml` (Not automated by jjConfig yet)

   ```bash
   # Create a default mise.toml if it doesn't exist
   if [ ! -f mise.toml ]; then
     echo '[tools]
   node = "lts"
   python = "latest"
   go = "latest"
   ' > mise.toml
     echo "✅ Created mise.toml"
   else
     echo "ℹ️  mise.toml already exists"
   fi

   # Trust config (required for automation)
   mise trust

   # Install tools
   mise install
   ```

2. Integrate `jjConfig` (Not automated by jjConfig yet)

   ```bash
   # Creates a local config that includes the central one
   JJ_CONFIG_PATH="$HOME/dev/activeProjects/jjConfig"

   if [ -d "$JJ_CONFIG_PATH" ]; then
     echo 'user.email = "'$(git config user.email)'"
   user.name = "'$(git config user.name)'"

   [include]
   path = "'$JJ_CONFIG_PATH'/config.toml"
   ' > .jjconfig.toml
     echo "✅ Created project-local .jjconfig.toml"
   else
     echo "wm  Warning: Central jjConfig not found at $JJ_CONFIG_PATH"
   fi
   ```

---

## Phase 2: Repository Initialization (Automated)

3. Initialize Repository with Hooks

   ```bash
   # Uses jjConfig alias to:
   # 1. Run 'jj git init --colocate'
   # 2. Install all Git hooks (MCP, security, repomix)
   jj init
   ```

4. First Commit
   ```bash
   jj commit -m "chore: initial commit (project setup)"
   jj bookmark create main -r @-
   ```

---

## Phase 3: Remote Setup (Automated)

5. Create GitHub Repository

   ```bash
   # Non-interactive creation (public by default)
   gh repo create "$(basename "$PWD")" --public --source=. --remote=origin --description "New project initialized via Antigravity"
   ```

6. Push Initial Architecture

   ```bash
   # Configure auto-tracking
   jj config set --user 'remotes.origin.auto-track-bookmarks' 'glob:*'

   # Push main
   jj git push --bookmark main --allow-new
   ```

---

## Phase 4: ekkOS Integration

7. Register Project with ekkOS Memory

   This step registers the project with the cross-platform memory system and ingests initial context.

   ```javascript
   // Register the project
   ekkOS_ProjectInit({
     project_path: process.cwd(),
     project_name: require("path").basename(process.cwd()),
     connect_cloud: true,
   });

   // Ingest initial context (README, config)
   ekkOS_Ingest({
     source_type: "codebase",
     data: [
       {
         path: "README.md",
         name: "README.md",
         content: fs.readFileSync("README.md", "utf8"),
       },
       {
         path: "mise.toml",
         name: "mise.toml",
         content: fs.readFileSync("mise.toml", "utf8"),
       },
     ],
   });
   ```

---

## Phase 5: Initial Release

8. Release v0.1.0
   ```bash
   jj git export
   gh release create v0.1.0 --title "v0.1.0 - Initial Release" --generate-notes
   jj git fetch --remote origin
   ```
