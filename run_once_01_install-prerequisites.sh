#!/bin/bash
# run_once_01_install-prerequisites.sh
#
# Installs Homebrew and oh-my-zsh.
# Runs exactly once on a new machine when you run `chezmoi apply`.

set -e

echo ""
echo "╔══════════════════════════════════════════════╗"
echo "║  Bootstrap Step 1: Prerequisites             ║"
echo "╚══════════════════════════════════════════════╝"

# ── Homebrew ──────────────────────────────────────────────────────────────────
if ! command -v brew &>/dev/null; then
  echo "==> Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "==> Homebrew already installed, skipping."
fi

# Add Homebrew to PATH for the rest of this script (Apple Silicon path)
if [[ -f /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# ── oh-my-zsh ─────────────────────────────────────────────────────────────────
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "==> Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "==> oh-my-zsh already installed, skipping."
fi

echo ""
echo "✓ Step 1 complete. Run \`chezmoi apply\` again (or it will continue) to install packages."
