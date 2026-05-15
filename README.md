# dotfiles

Personal dotfiles managed with [chezmoi](https://chezmoi.io).

## Bootstrap a new Mac

Run this single command on a fresh machine. It installs chezmoi, pulls this repo, and applies everything:

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply johnfernkas
```

You'll be prompted for a few values (name, email, computer name, machine profile, Ruby version). After that, the bootstrap scripts will run automatically in order:

1. **Prerequisites** — installs Homebrew and oh-my-zsh
2. **Packages** — runs `brew bundle` to install all apps and tools
3. **macOS defaults** — sets Dock, Finder, screenshot, and keyboard preferences

> **Before running:** Sign into the Mac App Store. Xcode (~12 GB) is installed via `mas` and requires an active App Store session.

**If Xcode was skipped** (not signed in), install it from the App Store then run `chezmoi apply` — the setup script will detect Xcode and finish automatically.

## Keeping in sync

A LaunchAgent runs `chezmoi update` daily at 09:00, keeping all your machines in sync automatically. Logs go to `~/Library/Logs/chezmoi-update.log`.

To sync manually:

```sh
chezmoi update
```

## Adding a new app

Edit the `dot_Brewfile` and run `chezmoi apply`. The package script re-runs automatically whenever the Brewfile changes.

## Useful commands

```sh
chezmoi edit ~/.zshrc       # edit a managed file in your $EDITOR
chezmoi diff                # preview what would change before applying
chezmoi apply               # apply changes to the home directory
chezmoi update              # pull latest from GitHub and apply
chezmoi cd                  # jump to the chezmoi source directory
```

## What's managed

| File | Destination |
|---|---|
| `dot_gitconfig.tmpl` | `~/.gitconfig` |
| `dot_zshrc.tmpl` | `~/.zshrc` |
| `dot_Brewfile` | `~/.Brewfile` |
| `dot_ruby-version.tmpl` | `~/.ruby-version` |
| `Library/LaunchAgents/com.*.chezmoi-update.plist.tmpl` | `~/Library/LaunchAgents/` |
