#!/bin/bash
# install.sh — card-dynamic-style-skill installer
# Auto-detects platform and installs to the appropriate skills directory.

set -e

SKILL_NAME="card-dynamic-style-skill"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

info() { echo -e "${GREEN}[✓]${NC} $1"; }
warn() { echo -e "${YELLOW}[!]${NC} $1"; }

install_to() {
  local dest="$1"
  mkdir -p "$dest"
  cp -R "$SCRIPT_DIR"/* "$dest/$SKILL_NAME/"
  info "Installed to: $dest/$SKILL_NAME"
}

# Detect platform
detect_platform() {
  if [ -d "$HOME/.claude" ]; then echo "claude"
  elif [ -d "$HOME/.copilot" ]; then echo "copilot"
  elif [ -d ".cursor" ]; then echo "cursor"
  elif [ -d "$HOME/.codeium/windsurf" ] || [ -d ".windsurf" ]; then echo "windsurf"
  elif [ -d "$HOME/.gemini" ]; then echo "gemini"
  elif [ -d "$HOME/.agents" ]; then echo "codex"
  elif [ -d "$HOME/.cline" ] || [ -d ".clinerules" ]; then echo "cline"
  elif [ -d "$HOME/.roo" ]; then echo "roo"
  elif [ -d "$HOME/.kiro" ]; then echo "kiro"
  else echo "unknown"
  fi
}

PLATFORM="${1:-$(detect_platform)}"

case "$PLATFORM" in
  claude)
    install_to "$HOME/.claude/skills"
    ;;
  copilot)
    install_to "$HOME/.copilot/skills"
    ;;
  cursor)
    install_to ".cursor/skills"
    ;;
  windsurf)
    if [ -d ".windsurf" ]; then
      install_to ".windsurf/rules"
    else
      install_to "$HOME/.codeium/windsurf/skills"
    fi
    ;;
  gemini)
    install_to "$HOME/.gemini/skills"
    ;;
  codex)
    install_to "$HOME/.agents/skills"
    ;;
  cline)
    if [ -d ".clinerules" ]; then
      install_to ".clinerules/skills"
    else
      install_to "$HOME/.cline/skills"
    fi
    ;;
  roo)
    install_to "$HOME/.roo/skills"
    ;;
  kiro)
    install_to ".kiro/skills"
    ;;
  all)
    [ -d "$HOME/.claude" ] && install_to "$HOME/.claude/skills"
    [ -d "$HOME/.copilot" ] && install_to "$HOME/.copilot/skills"
    [ -d "$HOME/.gemini" ] && install_to "$HOME/.gemini/skills"
    [ -d "$HOME/.agents" ] && install_to "$HOME/.agents/skills"
    ;;
  *)
    warn "Could not detect platform. Installing to ~/.agents/skills as fallback."
    install_to "$HOME/.agents/skills"
    ;;
esac

# Also create universal symlink
if [ -d "$HOME/.agents/skills" ]; then
  ln -sf "$HOME/.claude/skills/$SKILL_NAME" "$HOME/.agents/skills/$SKILL_NAME" 2>/dev/null || true
fi

echo ""
info "Installation complete!"
echo ""
echo "To use, open a new session and type:"
echo "  /card-dynamic-style-skill <your request>"
echo ""
