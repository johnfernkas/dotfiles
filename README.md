# dotfiles

Personal dotfiles managed with [chezmoi](https://chezmoi.io).

## Bootstrap a new Mac

Run this single command on a fresh machine. It installs chezmoi, pulls this repo, and applies everything:

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply johnfernkas
```

You'll be prompted for your name and email (used in `~/.gitconfig`). After that, the bootstrap scripts will run automatically in order:

1. **Prerequisites** — installs Homebrew and oh-my-zsh
2. **Packages** — runs `brew bundle` to install all apps and tools
3. **macOS defaults** — sets Dock, Finder, screenshot, and keyboard preferences

> **Before running:** Sign into the Mac App Store. Xcode (~12 GB) is installed via `mas` and requires an active App Store session.

## Keeping in sync

On an existing machine, pull and apply the latest changes with:

```sh
chezmoi update
```

## Adding a new app

Edit the `Brewfile` and run `chezmoi apply`. The package script re-runs automatically whenever the Brewfile changes.

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
| `Brewfile` | `~/Brewfile` |
