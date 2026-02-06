# unix-config

Zsh, Tmux, and Starship config. Clone to get a working shell on any machine, with WSL2 tweaks if detected.

## What you get

**Zsh** (.zshrc)
- Autosuggestions and syntax highlighting
- Aliases for modern tools (eza, bat, ripgrep)
- History shared across sessions

**Starship prompt** (starship.toml)
- Single line, saves vertical space
- Shows: username/host (ssh only), git branch/status, language versions (node, rust, go, python), memory usage, command duration
- Pastel colors on black

**Tmux** (.tmux.conf)
- Ctrl+a prefix
- Status bar with time and session name
- Vim-style pane navigation (h/j/k/l)

**Tools you need installed**
- `eza` - Modern ls
- `bat` - Modern cat
- `zoxide` - Better cd
- `fzf` - Fuzzy finder
- `ripgrep` - Fast grep

## Install

```bash
git clone https://github.com/cornellsh/unix-config ~/work/config
cd ~/work/config
./install.sh
```

Existing files get backed up to `~/.config-backup/` before symlinking.

## WSL2

If WSL2 is detected, the script offers to run `wsl-setup.sh`:
- Disables `systemd-timesyncd` (fixes time drift)
- Writes `/etc/wsl.conf` (filesystem performance)
- Creates `.wslconfig` (limits WSL RAM/CPU)

WSL2 time drift sucks - clock can drift by minutes when Windows is suspended. The workaround is letting Windows handle time sync.

## Tmux

| Key | Action |
|-----|--------|
| `r` | Reload config |
| `b` | Toggle status bar |
| `v` / `s` | Split vertical / horizontal |
| `h` `j` `k` `l` | Move between panes |
| `H` `J` `K` `L` | Resize panes |
| `C-l` | Clear screen and scrollback |

Prefix is Ctrl+a (not Ctrl+b).

## Aliases

| Alias | Command |
|-------|---------|
| `l` / `ll` | `eza -lah` / `eza -lah --git` |
| `g` / `gs` | `git` / `git status` |
| `G` | `| grep` |
| `L` | `| less` |

`cp` and `mv` are interactive (`-i`) by default.

## OpenCode

If you use OpenCode, the config is included:

**Plugins**
- `opencode-gemini-auth` - Google auth for AI features
- `@zenobius/opencode-skillful` - Enhanced skill system

**Permissions**
- All operations allowed (no file access prompts)

**Theme**
- `cornell.sh` - OLED theme matching Starship colors

The install script asks whether to install to `~/.config/opencode/`. Existing `opencode.json` gets backed up.
