#!/bin/bash
# run_once_after_02_xcode-setup.sh
#
# Accepts the Xcode license agreement and sets the active developer directory.
# Runs once automatically after chezmoi apply. If Xcode is not yet installed,
# this script exits cleanly — re-run `chezmoi apply` after installing Xcode,
# or run this script directly:
#
#   bash ~/.local/share/chezmoi/run_once_after_02_xcode-setup.sh

set -e

if [ ! -d "/Applications/Xcode.app" ]; then
  echo "⚠  Xcode not found at /Applications/Xcode.app — skipping setup."
  echo "   Install Xcode from the App Store, then run:"
  echo "     sudo xcodebuild -license accept"
  echo "     sudo xcode-select -s /Applications/Xcode.app/Contents/Developer"
  exit 0
fi

echo "==> Accepting Xcode license..."
sudo xcodebuild -license accept

echo "==> Setting active developer directory..."
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer

echo "✓ Xcode setup complete."
