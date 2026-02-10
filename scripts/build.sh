#!/bin/bash

# Build Safari Extension
# Usage: ./scripts/build.sh

set -e

echo "Building Safari Extension..."

# Clean previous builds
rm -rf build/
mkdir -p build/

# Install dependencies
npm ci

# Build TypeScript/JavaScript
npm run build:js

# Copy manifest and assets
cp manifest.json build/
cp -r src/assets build/ 2>/dev/null || true

# Convert to Safari Extension
xcrun safari-web-extension-converter \
    --app-name "OpenCode Safari Extension" \
    --bundle-identifier "com.opencode.safari-extension" \
    --swift \
    --copy-resources \
    build/

# Sign extension (if certificates available)
if [ -n "$APPLE_DEVELOPER_ID" ]; then
    codesign --force --sign "$APPLE_DEVELOPER_ID" build/safari-extension.appex
fi

echo "✓ Build completed successfully"
echo "Extension location: build/safari-extension.appex"