# Theme Configuration Documentation
# This file documents the theme setup configured by themes-setup.sh

## GTK/GNOME Settings
Applied via gsettings commands:

- **GTK Theme**: Mojave-Dark
  - Set via: `gsettings set org.gnome.desktop.interface gtk-theme "Mojave-Dark"`
  - Source: AUR package `mojave-gtk-theme`
  - Location: `/usr/share/themes/Mojave-Dark/`

- **Icon Theme**: Papirus-Dark
  - Set via: `gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"`
  - Source: Official package `papirus-icon-theme`
  - Location: `/usr/share/icons/Papirus-Dark/`
  - Notes: OLED-optimized dark variant with true black backgrounds

- **Cursor Theme**: macOS_Tahoe
  - Set via: `gsettings set org.gnome.desktop.interface cursor-theme "macos-tahoe-cursor"`
  - Source: AUR package `macos-tahoe-cursor`
  - Location: `/usr/share/icons/macos-tahoe-cursor/`
  - Notes: Exact macOS cursor clone for visual consistency

## SDDM Configuration

- **Login Screen Theme**: where-is-my-sddm-theme
  - Config file: `/etc/sddm.conf.d/theme.conf`
  - Source: AUR package `where-is-my-sddm-theme-git`
  - Location: `/usr/share/sddm/themes/where_is_my_sddm_theme/`
  - Configuration:
    ```ini
    [Theme]
    Current=where_is_my_sddm_theme
    ```

- **Niri Fix**:
  - Issue: SDDM with `CompositorCommand=niri` causes niri keybinding overlay on login screen
  - Fix: Remove line from `/etc/sddm.conf.d/niri.conf`
  - Applied by: themes-setup.sh (automatic detection and removal)

## Optional Tools

- **nwg-look**: GTK theme switcher for Wayland compositors
  - Command: `nwg-look`
  - Purpose: GUI tool to change GTK themes, icons, and cursors in Wayland
  - Source: AUR package `nwg-look`

## Visual Design Philosophy

The theme configuration follows these principles:

1. **OLED Optimization**: All dark themes use true black (#000000) backgrounds
2. **Elegant Aesthetics**: macOS-inspired design with refined details
3. **Consistency**: GTK, icons, and cursors follow similar design language
4. **Minimalist Login**: Clean, distraction-free SDDM theme
5. **High Contrast**: Good readability while maintaining visual sophistication

## Applying Theme Changes

**For GTK applications:**
- Restart your desktop session (logout/login)
- OR run: `nwg-look` (if installed)

**For SDDM login screen:**
- Restart SDDM service: `sudo systemctl restart sddm`
- OR reboot system

## Package Installation Commands

For manual installation or troubleshooting:

```bash
# GTK Theme (AUR)
yay -S mojave-gtk-theme

# Icon Theme (official repos)
sudo pacman -S papirus-icon-theme

# Cursor Theme (AUR)
yay -S macos-tahoe-cursor

# SDDM Theme (AUR)
yay -S where-is-my-sddm-theme-git

# GTK Theme Switcher (AUR)
yay -S nwg-look
```

## Troubleshooting

**GTK theme not applying:**
- Check if gsettings is installed: `pacman -Qi gsettings-desktop-schemas`
- Verify theme is installed: `ls /usr/share/themes/Mojave-Dark`
- Try nwg-look for graphical theme switching: `nwg-look`

**SDDM theme not showing:**
- Verify SDDM is running: `systemctl status sddm`
- Check theme config: `cat /etc/sddm.conf.d/theme.conf`
- Verify theme exists: `ls /usr/share/sddm/themes/where_is_my_sddm_theme`
- Check for errors: `journalctl -u sddm -b`

**Niri keybindings on login screen:**
- Verify CompositorCommand was removed: `cat /etc/sddm.conf.d/niri.conf`
- Should not contain: `CompositorCommand=niri`
- Remove if present: `sudo sed -i '/CompositorCommand=niri/d' /etc/sddm.conf.d/niri.conf`
- Restart SDDM: `sudo systemctl restart sddm`
