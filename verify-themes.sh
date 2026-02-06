#!/bin/bash

# Theme Verification Script

check_installed() {
    if eval "$1" &> /dev/null; then
        echo "$2: installed"
    else
        echo "$2: not installed"
    fi
}

check_setting() {
    local result=$(eval "$1" 2>/dev/null)
    if echo "$result" | grep -q "$3"; then
        echo "$2: $result"
    else
        echo "$2: $result (expected: $3)"
    fi
}

echo "Package installation:"
check_installed "pacman -Qi mojave-gtk-theme" "Mojave GTK"
check_installed "pacman -Qi papirus-icon-theme" "Papirus icons"
check_installed "pacman -Qi macos-tahoe-cursor" "macOS cursors"
check_installed "pacman -Qi where-is-my-sddm-theme-git" "where-is-my-sddm-theme"

echo ""
echo "GTK settings:"
check_setting "gsettings get org.gnome.desktop.interface gtk-theme" "GTK theme" "Mojave-Dark"
check_setting "gsettings get org.gnome.desktop.interface icon-theme" "Icon theme" "Papirus-Dark"
check_setting "gsettings get org.gnome.desktop.interface cursor-theme" "Cursor theme" "macos-tahoe-cursor"

echo ""
echo "SDDM configuration:"
if systemctl is-active --quiet sddm; then
    echo "SDDM: running"
else
    echo "SDDM: not running"
fi

if [ -f "/etc/sddm.conf.d/theme.conf" ]; then
    current_theme=$(grep "Current=" /etc/sddm.conf.d/theme.conf | cut -d= -f2)
    echo "SDDM theme: $current_theme"
else
    echo "SDDM theme config: not found"
fi

if [ -f "/etc/sddm.conf.d/niri.conf" ]; then
    if grep -q "CompositorCommand=niri" /etc/sddm.conf.d/niri.conf; then
        echo "SDDM niri compositor: present (causes keybinding overlay)"
    else
        echo "SDDM niri compositor: not present"
    fi
fi

echo ""
echo "Optional tools:"
check_installed "command -v nwg-look" "nwg-look"

echo ""
echo "Summary:"
echo "  GTK: Mojave-Dark"
echo "  Icons: Papirus-Dark"
echo "  Cursor: macOS-Tahoe"
echo "  SDDM: where-is-my-sddm-theme"
