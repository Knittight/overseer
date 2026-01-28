#!/usr/bin/env bash
set -e

APP_NAME="overseer"
SRC_FILE="src/overseer"
BUILD_DIR="build"

echo "🔧 Building Overseer (knit mode)"

# -------- checks --------
[ -f "$SRC_FILE" ] || {
  echo "❌ Source file not found: $SRC_FILE"
  exit 1
}

command -v python3 >/dev/null || {
  echo "❌ python3 not found"
  exit 1
}

# Check PyGObject / GTK4
python3 - <<EOF 2>/dev/null
import gi
gi.require_version("Gtk", "4.0")
EOF

if [ $? -ne 0 ]; then
  echo "❌ PyGObject / GTK4 not installed"
  exit 1
fi

# -------- stage files --------
echo "📦 Staging build output..."
rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR"

install -m 755 "$SRC_FILE" "$BUILD_DIR/$APP_NAME"

# Install to user directories
# Icon
ICON_DIR="$HOME/.local/share/icons/hicolor/scalable/apps"
mkdir -p "$ICON_DIR"
install -m 644 "overseer.svg" "$ICON_DIR/overseer.svg"

# Desktop file
DESKTOP_DIR="$HOME/.local/share/applications"
mkdir -p "$DESKTOP_DIR"
install -m 644 "overseer.desktop" "$DESKTOP_DIR/overseer.desktop"

# Update caches
if command -v gtk-update-icon-cache >/dev/null; then
    gtk-update-icon-cache -f -t "$HOME/.local/share/icons/hicolor" || true
fi
if command -v update-desktop-database >/dev/null; then
    update-desktop-database "$DESKTOP_DIR" || true
fi

echo "✅ Build and install complete"
echo "📂 Output binary: $BUILD_DIR/$APP_NAME"
echo "➡ knit will install binary to /usr/local/bin"
echo "➡ Desktop entry and icon installed to ~/.local/share"
