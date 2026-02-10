# Safari Extension Development Guide

## Project Structure

```
safari-opencode-extension/
├── src/
│   ├── background.js
│   ├── content.js
│   └── popup/
├── manifest.json
├── .github/workflows/
│   ├── build.yml
│   └── release.yml
├── .gitlab-ci.yml
└── scripts/
    ├── build.sh
    └── test-accounts.sh
```

## Build Requirements

- Xcode Command Line Tools
- Node.js 18+
- Safari 14+
- macOS 11+

## User Account Testing

### Test Accounts
- `root` - System administrator
- `sdw3098` - Scott (Douggy) Weeden
- `jck1278` - Johnathan Casey King

### Account Setup Script

```bash
#!/bin/bash
# Test extension across multiple user accounts
for user in root sdw3098 jck1278; do
    sudo -u $user /Applications/Safari.app/Contents/MacOS/Safari --load-extension ./build/
done
```

## Development Workflow

1. Local development with hot reload
2. GitHub Actions CI/CD pipeline
3. GitLab sync on release
4. Apple Store validation
5. Multi-account testing