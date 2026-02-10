# Apple Store Deployment

## Prerequisites

- Apple Developer Account
- Xcode 14+
- Valid certificates and provisioning profiles

## Deployment Steps

### 1. Code Signing

```bash
# Sign the extension
codesign --force --sign "Developer ID Application: Your Name" build/safari-extension.appex

# Verify signature
codesign --verify --verbose build/safari-extension.appex
```

### 2. App Store Validation

```bash
# Validate extension
xcrun altool --validate-app --file build/safari-extension.pkg \
  --username "your-apple-id@example.com" \
  --password "@keychain:AC_PASSWORD"
```

### 3. Upload to App Store

```bash
# Upload to App Store Connect
xcrun altool --upload-app --file build/safari-extension.pkg \
  --username "your-apple-id@example.com" \
  --password "@keychain:AC_PASSWORD"
```

## Multi-Account Testing

### Test Users
- **root**: System administrator testing
- **sdw3098**: Scott (Douggy) Weeden - Primary user testing
- **jck1278**: Johnathan Casey King - Secondary user testing

### Testing Process

1. Install extension on each account
2. Verify permissions and functionality
3. Test credential impersonation features
4. Validate form interaction capabilities
5. Test video download and transcription

## Automated Testing

```bash
# Run full test suite
npm run test:accounts

# Individual account testing
sudo -u sdw3098 /Applications/Safari.app/Contents/MacOS/Safari --load-extension ./build/
sudo -u jck1278 /Applications/Safari.app/Contents/MacOS/Safari --load-extension ./build/
```