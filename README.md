# unix-config

Personal dotfiles and configuration for reproducing my Linux environment across machines. I use this setup on Arch Linux (Intel 12th Gen notebook) and WSL2.

## What's Included

- **Zsh** (.zshrc): Shell configuration with history sharing, auto-cd, and modern tool aliases (eza, bat, ripgrep)
- **Starship Prompt** (starship.toml): Single-line prompt with git status, language versions, command duration
- **Tmux** (.tmux.conf): Terminal multiplexer with Ctrl+a prefix, Vim-style navigation, and OLED-optimized colors
- **Ghostty Terminal** (~/.config/ghostty): Terminal config with cornellsh theme, 12pt font
- **DankMaterialShell** (~/.config/DankMaterialShell): Wayland shell with cornellsh theme integration
- **OpenCode** (~/.config/opencode): AI coding assistant config with cornell.sh theme and auto-permissions
- **Notebook Setup** (setup_notebook.sh): Power management for Intel 12th Gen (TLP, thermald, ZRAM)
- **WSL2 Setup** (wsl-setup.sh): Windows Subsystem for Linux optimizations

All tools use the cornellsh theme: true black (#000000) backgrounds with pastel accents. This looks good on OLED screens and saves power.

## Installation

```bash
git clone https://github.com/cornellsh/unix-config ~/my_dotfiles
cd ~/my_dotfiles
./install.sh
```

The install script:
- Detects your OS (Arch or Debian/Ubuntu) and installs dependencies via apt/pacman
- Backs up existing configs to `.backup` files before symlinking
- Installs: git, tmux, zsh, curl, ghostty, zsh-autosuggestions, zsh-syntax-highlighting, starship
- Asks about WSL2 optimizations if running in WSL
- Asks about OpenCode theme installation

After installation, restart your shell or run `source ~/.zshrc`.

## Components

### Zsh

- History: 50,000 lines, shared across sessions, ignores duplicates and space-prefixed commands
- Autocomplete: Case-insensitive with caching, fuzzy matching
- Keybindings: Emacs mode with Ctrl+Left/Right for word navigation
- Aliases: g=git, t=tmux, ls=eza, cat=bat, cd=z (via zoxide)
- Plugins: zsh-autosuggestions (history+completion strategy), zsh-syntax-highlighting (currently commented out)

### Starship Prompt

Single-line format that shows:
- Username@hostname (SSH only)
- Current directory (truncated at 3 levels)
- Git branch and status (modified, stashed, deleted, untracked, conflicted)
- Language versions: node, rust, go, python
- Command duration (for commands >2 seconds)
- Memory usage (currently disabled, 85% threshold)
- Background jobs

Colors use the cornellsh palette: pink (#ff66b2), cyan (#00bfff), green (#00cc00), purple (#9932cc), yellow (#ffff00), red (#ff0000).

### Tmux

- Prefix: Ctrl+a (rebinds Ctrl+a to send prefix)
- Navigation: Vim-style h/j/k/l for panes, Ctrl+h/j/k/l for smart pane switching
- Panes: v=horizontal split, s=vertical split, H/J/K/L resize
- Windows: c=new window, z=zoom pane, x=kill pane, X=kill window
- Status bar: Bottom position, 1-second interval, shows session name, time, and window list
- Colors: Black background with pink prefix indicators, purple active window
- Reload: Prefix+r reloads config
- Mouse: Enabled for pane selection and resizing

### Ghostty Terminal

Config location: `~/.config/ghostty/config`

- Font: 12pt, Inter Variable for UI, Cascadia Code NF for monospace
- Window: No decoration, 12px padding, 32px blur radius
- Cursor: Block style, blinking
- Scrollback: 3023 lines
- Theme: cornellsh (OLED black #000000 with pastel palette)
- Keybindings: Ctrl+Shift+N (new window), Ctrl+T (new tab), Ctrl+Plus/Minus (font size)
- Shell integration: Auto-detected

### DankMaterialShell

Config location: `~/.config/DankMaterialShell/settings.json`

Wayland shell (supports Niri, Hyprland) with:
- Custom cornellsh.json theme copied to `~/Documents/DankMaterialShell/cornellsh.json`
- Control center with volume, brightness, WiFi, Bluetooth widgets
- Workspace switcher, system tray, weather, clock
- Material 3 color scheme with 90% transparency
- No dock (disabled by default)

### OpenCode

Config location: `~/.config/opencode/opencode.json`

AI coding assistant configuration:
- Plugins: `opencode-gemini-auth`, `@zenobius/opencode-skillful`
- Theme: `cornell.sh.json` (matches terminal/shell)
- Permissions: All operations allowed without prompts
- Optional install (prompted during main install)

### Notebook Setup (setup_notebook.sh)

Target hardware: Intel 12th Gen (Alder Lake) laptops

Installed packages:
- thermald: CPU thermal management
- tlp: Power management with performance/powersave governors
- powertop: Power consumption monitoring

Configurations:
- **TLP** (/etc/tlp.d/99-optimization.conf): Performance mode on AC, powersave on battery, no turbo on battery, 75-80% battery charge threshold
- **ZRAM** (/etc/systemd/zram-generator.conf): Compressed swap using zstd, up to 8GB or RAM size
- **VA-API** (~/.config/environment.d/hw-accel.conf): Hardware acceleration for Intel iGPU (LIBVA_DRIVER_NAME=iHD, MESA_LOADER_DRIVER_OVERRIDE=iris)

Services enabled: thermald, tlp, systemd-zram-setup

### WSL2 Setup (wsl-setup.sh)

Optimizations for Windows Subsystem for Linux:

**Time sync fix:**
- Disables systemd-timesyncd (WSL2 syncs time with Windows automatically)
- Prevents clock drift issues

**WSL config** (/etc/wsl.conf):
- Auto-mount Windows drives with metadata, umask=22, fmask=11 (allows chmod/chown on Windows files)
- systemd enabled
- Auto-generates /etc/hosts and /etc/resolv.conf

**.wslconfig** (~/.wslconfig, on Windows side):
- Memory: 8GB limit
- CPUs: 4 cores
- Swap: 2GB

The script tries to detect your Windows username and copy .wslconfig automatically. If it fails, copy `wsl/.wslconfig` manually to `%UserProfile%\.wslconfig` on Windows.

After running wsl-setup.sh, restart WSL2 with `wsl --shutdown` in PowerShell to apply changes.

## Notes

- Config files symlinked from repo, so changes in repo take effect after reload
- Both `~/.tmux.conf` and `~/.config/tmux/tmux.conf` point to repo's `.tmux.conf` (tmux 3.0+ prefers XDG path)
- Syntax highlighting in zsh is commented out in current version
- Starship's git metrics and memory usage modules are disabled
- Ghostty theme uses 16-color palette compatible with most terminals

## Requirements

- **Arch Linux or Debian/Ubuntu**: apt or pacman package manager
- **Ghostty**: GPU-accelerated terminal emulator
- **Zsh**: Default shell
- **Starship**: Prompt engine
- Optional: niri or Hyprland (for DankMaterialShell shell integration)
- Notebook setup targets Intel 12th Gen only; other hardware may need different TLP/VA-API configs
