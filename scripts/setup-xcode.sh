#!/bin/bash
# scripts/setup-xcode.sh
#
# Run this after installing Xcode from the App Store.
# Accepts the license agreement and sets the active developer directory.
#
# Usage: bash ~/.local/share/chezmoi/scripts/setup-xcode.sh

set -e

if [ ! -d "/Applications/Xcode.app" ]; then
  echo "✗ Xcode not found at /Applications/Xcode.app"
  echo "  Install it from the App Store first, then re-run this script."
  exit 1
fi

echo "==> Accepting Xcode license..."
sudo xcodebuild -license accept

echo "==> Setting active developer directory..."
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer

echo "✓ Xcode setup complete."
