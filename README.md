# Overseer 🛡️

**Manage systemd services the easy way.** Overseer provides a clean, modern GTK4 interface for systemd, designed for users who prefer a streamlined GUI over complex terminal commands.

[![GTK4](https://img.shields.io/badge/GTK-4.0-blue.svg)](https://www.gtk.org/)
[![Python](https://img.shields.io/badge/Python-3.10+-yellow.svg)](https://www.python.org/)

## ✨ Features

- **📊 Comprehensive Service Overview**: List all systemd services with real-time status updates.
- **⚡ Quick Actions**: Start, stop, and restart services with a single click.
- **🔄 Boot Management**: Easily enable or disable services to run at system startup.
- **📜 Live Logs**: View real-time journal logs with a built-in "Live Tail" feature.
- **🔍 Smart Search & Filter**: Find services quickly by name or description; filter for active services only.
- **🔐 Secure Elevation**: Prompts for administrative privileges only when needed via a native password dialog.
- **🎨 Modern Design**: Built with GTK4 and Adwaita for a native, premium feel on Linux desktops.

## 🚀 Installation

### Using Knit (Recommended)

Overseer is part of the Knittight ecosystem. You can install it easily using `knit`:

```bash
knit install overseer
```

### Manual Build

If you'd like to build Overseer manually:

1.  **Ensure dependencies are installed**:
    - Python 3
    - PyGObject (GTK4 libraries)
2.  **Run the build script**:
    ```bash
    ./build.sh
    ```
3.  **Run Overseer**:
    ```bash
    ./build/overseer
    ```

## 🛠 Usage

Simply launch `overseer` from your application menu or terminal. 

- **Left Panel**: Browse or search for services.
- **Right Panel**: View service details, manage boot status, and perform actions like Start/Stop/Restart.
- **Logs Section**: Click "Live Tail" to see service activity as it happens.

> [!TIP]
> Overseer can be run as a regular user. It will only ask for your password when you attempt to modify system services.

## 📦 Tech Stack

- **Language**: Python 3
- **Toolkit**: GTK 4 (PyGObject)
- **Backend**: Systemd (`systemctl` & `journalctl`)

---

Developed by [galaxyg144 @ Knittight](https://github.com/galaxyg144)
