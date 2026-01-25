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

echo "✅ Build complete"
echo "📂 Output: $BUILD_DIR/$APP_NAME"
echo "➡ knit will install this to /usr/local/bin"
