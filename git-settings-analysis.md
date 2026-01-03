# Git Configuration Settings - Comprehensive Analysis

# Extracted from all 11 sources

## Found Git Settings:

### Core Git Settings (High Priority)

1. push-new-bookmarks = true
2. auto-local-bookmark = true
3. fetch = "glob:\*"
4. push-bookmark-prefix = "Thomo1318/push-"
5. private-commits = "description(glob:'wip:_') | description(glob:'private:_')"

### Additional Git Settings (Medium Priority)

6. colocate = true (default behavior, explicit setting)
7. push = "origin" (default push remote)
8. sign-on-push = true (requires signing config)
9. subprocess = true (use external git for SSH issues)
10. executable-path = "/path/to/git" (custom git binary)
11. track-default-bookmark-on-clone = true (default)

### Advanced/Situational

12. Multiple fetch remotes: fetch = ["upstream", "origin"]
13. Multiple push remotes: Not supported yet
14. Remote-specific fetch tags: Configured per remote via jj git remote add --fetch-tags
