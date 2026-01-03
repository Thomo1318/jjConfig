#!/usr/bin/env bash
# GitHub Helper for JJ - Interactive repository management
# Version: 1.0.0

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() { echo -e "${BLUE}ℹ${NC} $*"; }
log_success() { echo -e "${GREEN}✓${NC} $*"; }
log_warning() { echo -e "${YELLOW}⚠${NC} $*"; }
log_error() { echo -e "${RED}✗${NC} $*" >&2; }

# Check dependencies
check_dependencies() {
	local missing=()

	command -v gh >/dev/null 2>&1 || missing+=("gh (GitHub CLI)")
	command -v jj >/dev/null 2>&1 || missing+=("jj (Jujutsu)")
	command -v git >/dev/null 2>&1 || missing+=("git")

	if [[ ${#missing[@]} -gt 0 ]]; then
		log_error "Missing required dependencies:"
		printf '%s\n' "${missing[@]}" | sed 's/^/  - /'
		exit 1
	fi

	# Check gh auth status
	if ! gh auth status >/dev/null 2>&1; then
		log_error "GitHub CLI not authenticated. Run: gh auth login"
		exit 1
	fi
}

# Get GitHub username
get_github_username() {
	gh api user --jq '.login' 2>/dev/null || echo ""
}

# Auto-generate description from repo content
auto_generate_description() {
	local desc=""

	# Try README.md first line
	if [[ -f "README.md" ]]; then
		desc=$(head -1 README.md | sed 's/^# *//' | sed 's/^## *//')
	elif [[ -f "README" ]]; then
		desc=$(head -1 README)
	elif [[ -f "package.json" ]]; then
		desc=$(jq -r '.description // empty' package.json 2>/dev/null)
	elif [[ -f "pyproject.toml" ]]; then
		desc=$(grep '^description = ' pyproject.toml | cut -d'"' -f2 2>/dev/null)
	elif [[ -f "Cargo.toml" ]]; then
		desc=$(grep '^description = ' Cargo.toml | cut -d'"' -f2 2>/dev/null)
	fi

	# Fallback
	[[ -z ${desc} ]] && desc="Personal repository"

	echo "${desc}"
}

# Generate mise.toml
generate_mise_toml() {
	if [[ ! -f "mise.toml" ]]; then
		log_info "Generating mise.toml..."
		cat >mise.toml <<EOF
[tools]
node = "lts"
python = "latest"
# go = "latest"
# rust = "latest"

[tasks]
build = "echo 'No build command defined'"
test = "echo 'No test command defined'"
EOF
		log_success "mise.toml created"
	else
		log_info "mise.toml already exists"
	fi
}

# Prompt for input with default
prompt_with_default() {
	local prompt="$1"
	local default="$2"
	local value

	if [[ -n ${default} ]]; then
		read -rp "$(echo -e "${prompt} ${YELLOW}[${default}]${NC}: ")" value
		echo "${value:-${default}}"
	else
		read -rp "${prompt}: " value
		echo "${value}"
	fi
}

# Prompt for yes/no
prompt_yes_no() {
	local prompt="$1"
	local default="${2:-n}"
	local value

	if [[ ${default} == "y" ]]; then
		read -rp "$(echo -e "${prompt} ${YELLOW}[Y/n]${NC}: ")" value
		value="${value:-y}"
	else
		read -rp "$(echo -e "${prompt} ${YELLOW}[y/N]${NC}: ")" value
		value="${value:-n}"
	fi

	[[ ${value} =~ ^[Yy] ]]
}

# Create GitHub repository
cmd_create() {
	log_info "Creating GitHub repository..."
	check_dependencies

	local username
	username=$(get_github_username)
	[[ -z ${username} ]] && {
		log_error "Could not determine GitHub username"
		exit 1
	}

	# Get repository name
	local repo_name
	local default_name
	default_name=$(basename "${PWD}")
	repo_name=$(prompt_with_default "Repository name" "${default_name}")

	# Validate repo name
	if [[ ! ${repo_name} =~ ^[a-zA-Z0-9._-]+$ ]]; then
		log_error "Invalid repository name. Use only letters, numbers, dots, hyphens, and underscores."
		exit 1
	fi

	# Get description
	local description
	local auto_desc
	auto_desc=$(auto_generate_description)
	description=$(prompt_with_default "Description" "${auto_desc}")

	# Choose visibility
	echo ""
	log_info "Repository visibility:"
	echo "  1) Public"
	echo "  2) Private"
	local visibility
	read -rp "Choose (1 or 2) [1]: " visibility
	visibility="${visibility:-1}"

	local visibility_flag="--public"
	[[ ${visibility} == "2" ]] && visibility_flag="--private"

	# Confirm
	echo ""
	log_info "Summary:"
	echo "  Repository: ${username}/${repo_name}"
	echo "  Description: ${description}"
	echo "  Visibility: $([[ ${visibility} == "2" ]] && echo "Private" || echo "Public")"
	echo ""

	if ! prompt_yes_no "Create repository?" "y"; then
		log_warning "Cancelled"
		exit 0
	fi

	# Create repository
	if gh repo create "${username}/${repo_name}" "${visibility_flag}" \
		--description "${description}" 2>/dev/null; then
		log_success "Repository created: https://github.com/${username}/${repo_name}"
	else
		log_error "Failed to create repository"
		exit 1
	fi
}

# Initialize jj repo and push to GitHub
cmd_init_github() {
	log_info "Initializing jj repository and creating GitHub repo..."
	check_dependencies

	# Check if already in a jj repo
	if [[ -d ".jj" ]]; then
		log_error "Already in a jj repository"
		exit 1
	fi

	local username
	username=$(get_github_username)
	[[ -z ${username} ]] && {
		log_error "Could not determine GitHub username"
		exit 1
	}

	# Get repository name
	local repo_name
	local default_name
	default_name=$(basename "${PWD}")
	repo_name=$(prompt_with_default "Repository name" "${default_name}")

	# Validate repo name
	if [[ ! ${repo_name} =~ ^[a-zA-Z0-9._-]+$ ]]; then
		log_error "Invalid repository name"
		exit 1
	fi

	# Get description
	local description
	local auto_desc
	auto_desc=$(auto_generate_description)
	description=$(prompt_with_default "Description" "${auto_desc}")

	# Choose visibility
	echo ""
	log_info "Repository visibility:"
	echo "  1) Public"
	echo "  2) Private"
	local visibility
	read -rp "Choose (1 or 2) [1]: " visibility
	visibility="${visibility:-1}"

	local visibility_flag="--public"
	[[ ${visibility} == "2" ]] && visibility_flag="--private"

	# Confirm
	echo ""
	log_info "Summary:"
	echo "  Repository: ${username}/${repo_name}"
	echo "  Description: ${description}"
	echo "  Visibility: $([[ ${visibility} == "2" ]] && echo "Private" || echo "Public")"
	echo ""

	if ! prompt_yes_no "Create repository and initialize?" "y"; then
		log_warning "Cancelled"
		exit 0
	fi

	# Create GitHub repository
	log_info "Creating GitHub repository..."
	if ! gh repo create "${username}/${repo_name}" "${visibility_flag}" \
		--description "${description}" 2>/dev/null; then
		log_error "Failed to create repository"
		exit 1
	fi
	log_success "Repository created"

	# Initialize jj
	log_info "Initializing jj repository..."
	if ! jj git init --colocate 2>/dev/null; then
		log_error "Failed to initialize jj repository"
		exit 1
	fi
	log_success "jj initialized"

	# Generate mise.toml
	generate_mise_toml

	# Add remote (SSH for 1Password agent compatibility)
	log_info "Adding remote..."
	if ! git remote add origin "git@github.com:${username}/${repo_name}.git" 2>/dev/null; then
		log_warning "Remote might already exist"
	fi

	# Create main bookmark
	log_info "Creating main bookmark..."
	if ! jj bookmark create main -r @- 2>/dev/null; then
		log_warning "Bookmark might already exist"
	fi

	# Push
	log_info "Pushing to GitHub..."
	if jj git push --bookmark main --allow-new 2>/dev/null; then
		log_success "Pushed to GitHub"
		echo ""
		log_success "Complete! https://github.com/${username}/${repo_name}"
	else
		log_error "Failed to push to GitHub"
		exit 1
	fi
}

# Clone GitHub repo and init with jj
cmd_clone() {
	log_info "Cloning GitHub repository..."
	check_dependencies

	local repo_url="$1"

	if [[ -z ${repo_url} ]]; then
		read -rp "Repository URL or owner/repo: " repo_url
	fi

	# Validate input
	if [[ -z ${repo_url} ]]; then
		log_error "Repository URL required"
		exit 1
	fi

	# Clone with gh
	log_info "Cloning repository..."
	if ! gh repo clone "${repo_url}" 2>/dev/null; then
		log_error "Failed to clone repository"
		exit 1
	fi

	# Extract repo name
	local repo_name
	repo_name=$(basename "${repo_url}" .git)

	# Initialize jj
	log_info "Initializing jj in ${repo_name}..."
	cd "${repo_name}" || exit 1

	if jj init --git-repo=. 2>/dev/null; then
		log_success "jj initialized"
		generate_mise_toml
		log_success "Complete! Repository ready at: ${PWD}"
	else
		log_error "Failed to initialize jj"
		exit 1
	fi
}

# Show usage
usage() {
	cat <<EOF
GitHub Helper for JJ - Interactive repository management

Usage:
  $(basename "$0") <command> [arguments]

Commands:
  create              Create a new GitHub repository (interactive)
  init-github         Initialize jj repo and create GitHub repo (interactive)
  clone <repo>        Clone GitHub repo and initialize with jj
  help                Show this help message

Examples:
  $(basename "$0") create
  $(basename "$0") init-github
  $(basename "$0") clone owner/repo
  $(basename "$0") clone https://github.com/owner/repo

Dependencies:
  - gh (GitHub CLI): https://cli.github.com/
  - jj (Jujutsu): https://github.com/martinvonz/jj
  - git: https://git-scm.com/

EOF
}

# Main
main() {
	local cmd="${1-}"

	case "${cmd}" in
	create)
		cmd_create
		;;
	init-github)
		cmd_init_github
		;;
	clone)
		shift
		cmd_clone "$@"
		;;
	help | --help | -h)
		usage
		;;
	"")
		log_error "No command specified"
		echo ""
		usage
		exit 1
		;;
	*)
		log_error "Unknown command: ${cmd}"
		echo ""
		usage
		exit 1
		;;
	esac
}

main "$@"
