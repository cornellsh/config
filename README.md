# dotfiles // cornell.sh

High-vibrancy, text-based terminal environment. No icons, no noise.
Optimized for **Zsh**, **Tmux**, and **Starship**.

## Aesthetic
- **Palette:** Vibrant OLED (Purple/Pink/Cyan on Black).
- **Style:** Text-only HUD. No patched fonts required.
- **Tmux:** Minimal bottom bar, `cornell.sh` branding.
- **Prompt:** Single-line, explicit git status labels (e.g., `modified`, `ahead:1`).

## Setup

```bash
git clone https://github.com/cornellsh/config.git ~/work/config
cd ~/work/config
./install.sh
```

## Stack
- **Shell:** Zsh + Autosuggestions + Syntax Highlighting
- **Prompt:** Starship (Custom text-based config)
- **Multiplexer:** Tmux (3.0+)
- **Utils:** `eza`, `bat`, `zoxide`, `fzf`, `ripgrep`

## Controls

### Tmux (`Ctrl+a` Prefix)
| Key | Action |
| :--- | :--- |
| `r` | Reload config |
| `b` | Toggle status bar |
| `v` / `s` | Split Vertical / Horizontal |
| `h` `j` `k` `l` | Navigate panes |
| `H` `J` `K` `L` | Resize panes |
| `C-l` | Clear screen & scrollback |

### Shell
| Alias | Command |
| :--- | :--- |
| `l` / `ll` | List files (detailed) |
| `g` / `gs` | Git / Git Status |
| `cp` / `mv` | Copy/Move (Interactive) |
| `G` | Global grep (`| grep`) |
| `L` | Global pager (`| less`) |
