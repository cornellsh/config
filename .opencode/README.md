# OpenCode

This directory contains the actual OpenCode configuration files that should be installed to `~/.config/opencode/`.

## Contents

- `opencode.json` - Main OpenCode configuration
- `themes/cornell.sh.json` - OLED-optimized vibrant pastel theme

## Installation

Run the install script:
```bash
./install.sh
```

The script will prompt to install OpenCode config and theme.

## Theme: cornell.sh

OLED-optimized vibrant pastel theme matching the unix-config aesthetic:

- Background: Pure black (#000000) - OLED optimal
- Text: Dimmed white (#e0e0e0) - Reduces OLED burn-in risk
- Accent colors at 90% brightness for OLED longevity
- Matches the Starship prompt color scheme

## Manual Installation

To install without running the full setup:

```bash
# Install theme
cp .opencode/themes/cornell.sh.json ~/.config/opencode/themes/cornell.sh.json

# Install config (backs up existing)
mv ~/.config/opencode/opencode.json ~/.config/opencode/opencode.json.backup
cp opencode.json ~/.config/opencode/opencode.json
```
