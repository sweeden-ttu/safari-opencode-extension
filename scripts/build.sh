#!/bin/bash

# Safari Extension Production Build Script
# Builds optimized extension for distribution
# Usage: ./scripts/build.sh [--debug] [--skip-signing]

set -e

# Configuration
BUILD_DIR="build"
DIST_DIR="dist"
APP_NAME="OpenCode Safari Extension"
BUNDLE_ID="com.opencode.safari-extension"
MIN_MACOS_VERSION="11.0"
MIN_SAFARI_VERSION="14.0"

# Parse command line arguments
DEBUG_MODE=false
SKIP_SIGNING=false

while [[ $# -gt 0 ]]; do
  case $1 in
    --debug)
      DEBUG_MODE=true
      shift
      ;;
    --skip-signing)
      SKIP_SIGNING=true
      shift
      ;;
    *)
      echo "Unknown option $1"
      exit 1
      ;;
  esac
done

echo "🚀 Building Safari Extension for production..."
echo "Debug mode: $DEBUG_MODE"
echo "Skip signing: $SKIP_SIGNING"

# Verify system requirements
echo "📋 Verifying system requirements..."
if ! command -v xcrun &> /dev/null; then
    echo "❌ Xcode Command Line Tools not found"
    echo "Install with: xcode-select --install"
    exit 1
fi

if ! command -v node &> /dev/null; then
    echo "❌ Node.js not found"
    exit 1
fi

NODE_VERSION=$(node --version | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 18 ]; then
    echo "❌ Node.js 18+ required, found version $(node --version)"
    exit 1
fi

echo "✅ System requirements verified"

# Clean previous builds
echo "🧹 Cleaning previous builds..."
rm -rf $BUILD_DIR/ $DIST_DIR/
mkdir -p $BUILD_DIR $DIST_DIR

# Install dependencies with clean slate
echo "📦 Installing dependencies..."
npm ci --production=false

# Run linting and tests
if [ "$DEBUG_MODE" = false ]; then
    echo "🔍 Running code quality checks..."
    npm run lint:check
    npm run test
fi

# Build JavaScript/TypeScript with webpack
echo "⚙️ Building JavaScript bundle..."
if [ "$DEBUG_MODE" = true ]; then
    npm run build:dev
else
    npm run build:js
fi

# Copy manifest with version validation
echo "📄 Processing manifest..."
cp manifest.json $BUILD_DIR/

# Validate manifest version compatibility
MANIFEST_VERSION=$(grep '"manifest_version"' manifest.json | grep -o '[0-9]')
if [ "$MANIFEST_VERSION" != "2" ]; then
    echo "⚠️ Warning: Manifest version $MANIFEST_VERSION may not be compatible with Safari"
fi

# Copy assets and resources
echo "🎨 Copying assets..."
if [ -d "src/assets" ]; then
    cp -r src/assets $BUILD_DIR/
fi

if [ -d "src/popup" ]; then
    mkdir -p $BUILD_DIR/popup
    cp src/popup/*.html $BUILD_DIR/popup/ 2>/dev/null || true
    cp src/popup/*.css $BUILD_DIR/popup/ 2>/dev/null || true
fi

# Convert to Safari Extension format
echo "🔄 Converting to Safari Extension format..."
xcrun safari-web-extension-converter \
    --app-name "$APP_NAME" \
    --bundle-identifier "$BUNDLE_ID" \
    --swift \
    --copy-resources \
    --macos-only \
    --force \
    $BUILD_DIR/

# Code signing (if certificates available and not skipped)
if [ "$SKIP_SIGNING" = false ] && [ -n "$APPLE_DEVELOPER_ID" ]; then
    echo "✍️ Signing extension with Developer ID..."
    codesign --force \
             --sign "$APPLE_DEVELOPER_ID" \
             --timestamp \
             --options runtime \
             $BUILD_DIR/*.appex
    
    echo "🔐 Verifying code signature..."
    codesign --verify --verbose $BUILD_DIR/*.appex
else
    echo "⚠️ Skipping code signing (no Developer ID or --skip-signing specified)"
fi

# Create distribution package
echo "📦 Creating distribution package..."
cp -r $BUILD_DIR/*.appex $DIST_DIR/
cp README.md LICENSE $DIST_DIR/ 2>/dev/null || true

# Generate build info
BUILD_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
BUILD_COMMIT=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown")
cat > $DIST_DIR/build-info.json << EOF
{
  "buildDate": "$BUILD_DATE",
  "commit": "$BUILD_COMMIT",
  "version": "$(grep '"version"' package.json | cut -d'"' -f4)",
  "debugMode": $DEBUG_MODE,
  "signed": $([ "$SKIP_SIGNING" = false ] && [ -n "$APPLE_DEVELOPER_ID" ] && echo true || echo false)
}
EOF

echo "✅ Build completed successfully!"
echo "📍 Extension location: $BUILD_DIR/"
echo "📦 Distribution package: $DIST_DIR/"
echo "🔧 Build info: $DIST_DIR/build-info.json"

if [ "$DEBUG_MODE" = false ]; then
    echo ""
    echo "🚀 Ready for deployment!"
    echo "Load in Safari: Develop → Load Extension → Select $BUILD_DIR/"
fi