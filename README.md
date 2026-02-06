# unix-config: Your Consistent, OLED-Optimized Linux Environment

Tired of a disjointed terminal experience across your machines? This repository provides a cohesive, OLED-friendly configuration for Zsh, Tmux, Starship, Ghostty, and DankMaterialShell. Get a beautiful, functional, and consistent shell experience tailored for everyday Linux use, whether you're on a powerful Arch notebook or a snappy WSL2 setup.

## What's Inside?

We focus on a clean, efficient, and visually appealing setup. Every component here is tuned for:

-   **Performance:** Fast response times and minimal resource usage.
-   **Consistency:** A unified `cornellsh` theme ties everything together visually.
-   **OLED Optimization:** True black backgrounds and vibrant pastels save power and look stunning on OLED displays.
-   **Usability:** Sensible defaults and quality-of-life improvements without unnecessary bloat.

### Components & Highlights:

#### **Zsh** (`.zshrc`)
Your command line, supercharged.
-   **Smart Suggestions:** Autocomplete commands as you type with history and completion strategies.
-   **Syntax Highlighting:** Instant visual feedback for commands, preventing typos.
-   **Modern Aliases:** Shortcuts for powerful tools like `eza` (modern `ls`), `bat` (modern `cat`), `zoxide` (smarter `cd`), `fzf` (fuzzy finder), and `ripgrep` (blazing-fast `grep`).
-   **Shared History:** Seamlessly access your command history across all sessions.

#### **Starship Prompt** (`starship.toml`)
A minimalist, yet informative prompt.
-   **Single Line Efficiency:** Saves vertical screen space for your commands.
-   **Context-Aware:** Displays crucial information only when relevant:
    -   `username@hostname` (SSH sessions only)
    -   Current Git branch and status
    -   Active language versions (Node.js, Rust, Go, Python)
    -   Memory usage (configurable threshold)
    -   Command duration
-   **Vibrant `cornellsh` Colors:** Beautiful pastel colors on a true black background for an OLED-optimized look.

#### **Tmux** (`.tmux.conf`)
Your persistent, multi-pane workspace.
-   **Familiar Prefix:** Uses `Ctrl+a` (instead of `Ctrl+b`) for muscle memory.
-   **Intuitive Navigation:** Vim-style `h/j/k/l` for quick pane switching.
-   **Informative Status Bar:** Always see the time, active session name, and other useful indicators.
-   **Quick Reload:** Hit `Prefix + r` to instantly apply config changes.

#### **Ghostty Terminal** (`~/.config/ghostty/*`)
A fast, modern GPU-accelerated terminal.
-   **OLED-Optimized `cornellsh` Theme:** True black background and carefully selected pastel colors for crisp text and power efficiency.
-   Seamless integration with your shell and prompt.

#### **DankMaterialShell** (`~/.config/DankMaterialShell/*`, `~/Documents/DankMaterialShell/cornellsh.json`)
A dynamic shell experience, now with consistent theming.
-   **Custom `cornellsh.json` Theme:** Ensures UI elements, popups, and widgets align with the overall `cornellsh` aesthetic, featuring OLED-optimized colors.

#### **OpenCode** (`~/.config/opencode/*`)
Your coding companion, visually consistent.
-   **`cornell.sh` Theme:** Matches your terminal and shell for a harmonious coding environment.
-   Pre-configured plugins for Gemini AI features and an enhanced skill system.
-   Permission setup allowing seamless operations without constant prompts.

### Ready to Install?

Getting set up is straightforward. The `install.sh` script automates most of the heavy lifting for you.

```bash
git clone https://github.com/cornellsh/unix-config ~/my_dotfiles # or wherever you prefer
cd ~/my_dotfiles
./install.sh
```

-   **Safe:** Existing configuration files are automatically backed up to `~/.config-backup/` before symlinking.
-   **Smart:** The script detects your OS (Arch/Debian) to install dependencies and handles WSL2-specific optimizations if needed.

### Special Notes for WSL2 Users

If you're running on WSL2, our script offers specific tweaks to enhance your experience:

-   **Time Drift Fix:** Disables `systemd-timesyncd` to prevent annoying clock drift.
-   **Performance & Resource Management:** Configures `/etc/wsl.conf` for optimized filesystem performance and creates `.wslconfig` to limit WSL RAM/CPU usage, ensuring a smoother ride.

Give it a try! If you find this configuration useful, consider giving the repo a star. Your feedback is always welcome!
