.PHONY: help deploy test backup restore clean sync

help:
	@echo "JJ Config Management"
	@echo ""
	@echo "Commands:"
	@echo "  make deploy   - Deploy config (via symlink)"
	@echo "  make test     - Validate config syntax"
	@echo "  make backup   - Create timestamped backup"
	@echo "  make restore  - List available backups"
	@echo "  make clean    - Remove symlinks"
	@echo "  make sync     - Sync redundant backups"

deploy:
	@echo "Deploying jjConfig..."
	@if [ -d ~/.config/jj ] && [ ! -L ~/.config/jj ]; then \
		echo "Backing up existing ~/.config/jj..."; \
		mv ~/.config/jj ~/.config/jj.backup-$$(date +%Y%m%d-%H%M%S); \
	fi
	@rm -f ~/.config/jj
	@ln -s $(PWD) ~/.config/jj
	@echo "✓ Symlink created: ~/.config/jj -> $(PWD)"
	@jj config list user
	@echo "✓ Deployment successful"

test:
	@echo "Testing configuration..."
	@jj config list > /dev/null && echo "✓ Config syntax valid" || echo "✗ Config has errors"
	@jj config list user
	@echo "✓ Tests complete"

backup:
	@TIMESTAMP=$$(date +%Y%m%d-%H%M%S); \
	mkdir -p backups/manual/backup-$$TIMESTAMP; \
	cp config.toml backups/manual/backup-$$TIMESTAMP/; \
	echo "✓ Backup created: backups/manual/backup-$$TIMESTAMP"

restore:
	@echo "Available backups:"
	@ls -1d backups/v*/ 2>/dev/null || echo "No backups found"

clean:
	@if [ -L ~/.config/jj ]; then \
		rm ~/.config/jj; \
		echo "✓ Symlink removed"; \
	else \
		echo "No symlink found"; \
	fi

sync:
	@rsync -a --delete backups/ .backups-redundant/
	@date +%Y%m%d-%H%M%S > .backups-redundant/last-sync.timestamp
	@echo "✓ Backups synced to .backups-redundant/"
