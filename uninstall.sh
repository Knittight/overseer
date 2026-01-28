#!/usr/bin/env bash
set -e

APP_NAME="overseer"
BIN_PATH="/usr/local/bin/$APP_NAME"
SYSTEM_DESKTOP="/usr/share/applications/$APP_NAME.desktop"
# specific user removal
if [ -n "$SUDO_USER" ]; then
    REAL_HOME=$(getent passwd "$SUDO_USER" | cut -d: -f6)
else
    REAL_HOME="$HOME"
fi

SYSTEM_DESKTOP="/usr/share/applications/$APP_NAME.desktop"
USER_DESKTOP="$REAL_HOME/.local/share/applications/$APP_NAME.desktop"
USER_ICON="$REAL_HOME/.local/share/icons/hicolor/scalable/apps/$APP_NAME.svg"


echo "🗑️  Uninstalling Overseer..."

# Remove binary
if [ -f "$BIN_PATH" ]; then
    echo "removing binary: $BIN_PATH"
    # Try removing without sudo first, if it fails, try with sudo
    if ! rm "$BIN_PATH" 2>/dev/null; then
        echo "  ↪ Permission denied. Trying with sudo..."
        sudo rm "$BIN_PATH"
    fi
else
    echo "binary not found at $BIN_PATH (skipping)"
fi

# Remove system desktop file
if [ -f "$SYSTEM_DESKTOP" ]; then
    echo "removing system desktop entry: $SYSTEM_DESKTOP"
    if ! rm "$SYSTEM_DESKTOP" 2>/dev/null; then
         echo "  ↪ Permission denied. Trying with sudo..."
         sudo rm "$SYSTEM_DESKTOP"
    fi
else
    echo "system desktop entry not found (skipping)"
fi

# Remove user desktop file
if [ -f "$USER_DESKTOP" ]; then
    echo "removing user desktop entry: $USER_DESKTOP"
    rm "$USER_DESKTOP"
else
    echo "user desktop entry not found (skipping)"
fi

# Remove user icon
if [ -f "$USER_ICON" ]; then
    echo "removing user icon: $USER_ICON"
    rm "$USER_ICON"
fi

echo "✅ Uninstall complete."
