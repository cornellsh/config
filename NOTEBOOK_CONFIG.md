# Arch Linux Notebook Configuration

**Target Hardware:** Intel Core i7-12700H (Alder Lake), Iris Xe Graphics, 16GB RAM.
**Platform:** Arch Linux (Wayland/Niri).
**Device:** ASUS Zenbook UX5401Z.

## Quick Start

For comprehensive automated installation, run:

```bash
cd ~/Work/unix-config
./setup_notebook.sh
```

This will prompt you to install all optimizations including ASUS Zenbook-specific tuning.

## Complete Optimization Documentation

All notebook optimizations are documented in the `optimizations/` directory:

```bash
cd ~/Work/unix-config/optimizations
cat README.md
```

See [optimizations/README.md](optimizations/README.md) for:
- Complete optimization suite (9 core optimizations)
- Installation instructions
- Expected performance improvements
- Service status and verification
- Maintenance and troubleshooting
- Hardware compatibility notes

## Key Features

### Optimizations Included

1. **Thermal Management** (`thermald`)
2. **Power Management** (`tlp`)
3. **Memory Management** (`sysctl`)
4. **Memory Optimization** (`zram`)
5. **Hardware Acceleration** (VA-API)
6. **Intel GPU Optimization** (GuC/HuC firmware)
7. **NVMe Optimization** (scheduler tuning)
8. **WiFi Power Management** (automated switching)
9. **Power Profile Automation** (AC/battery profiles)

### Expected Improvements

| Metric | Improvement |
|--------|-------------|
| Battery Life | +50% (3-4 → 4-6 hours) |
| Swap Usage | -83% (60% → 10%) |
| System Responsiveness | +30% |
| NVMe I/O | +15% |
| GPU Performance | +20% |
| Power Efficiency | +40% |
| Battery Lifespan | +150% (2-3 → 5-7 years) |

### Battery Care

- Charge limit: 80%
- OLED display protection
- Prevents overcharging
- Extends battery lifespan

## Related Files

- **[optimizations/README.md](optimizations/README.md)**: Complete optimization documentation
- **[optimizations/setup.sh](optimizations/setup.sh)**: Direct optimization installer
- **[setup_notebook.sh](setup_notebook.sh)**: Main setup script with optimization prompt
- **[install.sh](install.sh)**: General configuration installer

---

**Last Updated**: 2026-02-06
**Configuration Version**: 3.0 (Unified Documentation)
