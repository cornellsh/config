#!/bin/bash
# Notebook Setup Script for Arch Linux (Intel 12th Gen)

set -e

echo "Notebook configuration setup"

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Install TLP Bluetooth configuration
echo "Installing TLP Bluetooth configuration..."
sudo mkdir -p /etc/tlp.d/
sudo cp "$SCRIPT_DIR/optimizations/tlp-bluetooth.conf" /etc/tlp.d/99-bluetooth.conf

# Install systemd service to unblock Bluetooth
echo "Installing systemd Bluetooth unblock service..."
sudo cp "$SCRIPT_DIR/optimizations/system-bluetooth-unblock.service" /etc/systemd/system-bluetooth-unblock.service
sudo systemctl enable system-bluetooth-unblock.service
echo "Bluetooth will stay unblocked across reboots"

# Check for ASUS Zenbook optimizations
if [ -f "$SCRIPT_DIR/optimizations/setup.sh" ]; then
    read -p "Install ASUS Zenbook optimizations? (y/n) " -n 1 -r
    echo

    if [[ $REPLY =~ ^[Yy]$ ]]; then
        sudo bash "$SCRIPT_DIR/optimizations/setup.sh"
        echo "ASUS Zenbook optimizations installed"
    else
        echo "Skipping ASUS Zenbook optimizations"
    fi
fi

echo "Notebook setup complete"
echo "Reboot to apply all changes"
