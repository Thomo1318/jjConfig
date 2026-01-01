# 🚀 Quick Start Guide

Get up and running with jjConfig in 5 minutes.

---

## Prerequisites

- **Jujutsu (jj)** installed: `brew install jj`
- **Git** installed: `brew install git`
- **Bash** shell (pre-installed on macOS/Linux)

---

## Installation (2 minutes)

```bash
# 1. Clone the repository
git clone https://github.com/Thomo1318/jjConfig.git ~/.config/jjConfig

# 2. Deploy configuration
cd ~/.config/jjConfig
make deploy

# 3. Verify installation
jj config list user
 You should see:
 user.name = "Thomo1318"
user.email = "steele.thompson13@gmail.com"
 First Repository (2 minutes)
Create a New Project
 # 1. Create project directory
mkdir my-first-jj-project
cd my-first-jj-project

# 2. Initialize with GitMCP
jj init

# 3. Create a file
echo "# My First JJ Project" > README.md

# 4. Check status
jj st

# 5. Create a new change
jj new

# 6. Describe the change
jj describe -m "feat: add README"

# 7. View log
jj l
 Clone an Existing Repository
 # 1. Clone with git
git clone https://github.com/username/repo.git
cd repo

# 2. Initialize jj
jj init

# 3. View log
jj l
 Essential Commands (1 minute)
Command
Description
Alias
⁠jj st
Show status
⁠jj status
⁠jj l
View log
⁠jj log
⁠jj d
Show diff
⁠jj diff
⁠jj n
Create new change
⁠jj new
⁠jj ci
Commit interactively
⁠jj commit --interactive
⁠jj push
Push with new bookmarks
⁠jj git push --allow-new
⁠jj sync
Fetch all remotes
⁠jj git fetch --all-remotes
Basic Workflow
 # 1. Start working
jj new

# 2. Make changes
echo "Some content" >> file.txt

# 3. Check what changed
jj st
jj d

# 4. Describe your change
jj describe -m "feat: add new feature"

# 5. Push to remote
jj push
 TUI Tools
 # Interactive TUI with fzf
jj fzf

# Terminal UI (lazyjj)
jj tui

# Alternative UI (gg)
jj ui
 Next Steps
	•	Read the full README: README.md 	•	Explore aliases: aliases/README.md 	•	Learn revsets: revsets/README.md 	•	Customize colors: ui-configs/README.md 	•	Official tutorial: https://jj-vcs.github.io/jj/latest/tutorial/
Need Help?
	•	Troubleshooting: TROUBLESHOOTING.md 	•	Contributing: CONTRIBUTING.md 	•	Issues: https://github.com/Thomo1318/jjConfig/issues 	•	jj Discord: https://discord.gg/dkmfj3aGQN
Happy hacking! 🎉
 
---
```
