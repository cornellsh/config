# unix-config

Dotfiles for Zsh, Tmux, and Starship. Clone this to get a working shell environment on any machine, with optional WSL2 tweaks.

## What's in here

**Zsh configuration** (.zshrc)
- Zsh with autosuggestions and syntax highlighting
- Aliases for modern tools (eza, bat, ripgrep)
- History sharing across sessions

**Starship prompt** (starship.toml)
- Single-line format to save vertical space
- Shows: username (ssh only), hostname (ssh only), git branch/status, language versions (node, rust, go, python), memory usage, command duration
- Vibrant pastel colors on black background

**Tmux** (.tmux.conf)
- Ctrl+a prefix
- Clean status bar with time and session name
- Standard vim-style pane navigation (h/j/k/l)

**Utilities assumed:**
- `eza` - Modern ls replacement
- `bat` - Modern cat replacement
- `zoxide` - Better cd
- `fzf` - Fuzzy finder
- `ripgrep` - Fast grep

## Install

```bash
git clone https://github.com/cornellsh/unix-config ~/work/config
cd ~/work/config
./install.sh
```

The install script backs up existing files to `~/.config-backup/` before symlinking.

## WSL2

If the install script detects WSL2, it offers to run `wsl-setup.sh` which:
- Disables `systemd-timesyncd` to fix time drift
- Writes `/etc/wsl.conf` for better filesystem performance
- Creates `.wslconfig` in your Windows home directory to limit WSL RAM/CPU

Time drift on WSL2 is annoying - the system clock can drift by minutes if Windows is suspended. Disabling the systemd time sync and letting Windows handle it is the workaround.

## Tmux keybindings

| Key | Action |
|-----|--------|
| `r` | Reload config |
| `b` | Toggle status bar |
| `v` / `s` | Split vertical / horizontal |
| `h` `j` `k` `l` | Move between panes |
| `H` `J` `K` `L` | Resize panes |
| `C-l` | Clear screen and scrollback |

Prefix is Ctrl+a (rebind from Ctrl+b).

## Shell aliases

| Alias | Command |
|-------|---------|
| `l` / `ll` | `eza -lah` / `eza -lah --git` |
| `g` / `gs` | `git` / `git status` |
| `G` | `| grep` |
| `L` | `| less` |

Copy and move are interactive (`cp -i`, `mv -i`) by default.

## OpenCode

OpenCode configuration is included if you use that tool. The config enables:

**Plugins**
- `opencode-gemini-auth` - Google authentication for AI features
- `@zenobius/opencode-skillful` - Enhanced skill system

**Permissions**
- All operations allowed by default (no prompts for file access)

**Theme**
- `cornell.sh` - OLED-optimized theme matching the Starship prompt colors

Install script asks whether to install OpenCode config and theme to `~/.config/opencode/`. Backs up existing `opencode.json` before replacing it.
