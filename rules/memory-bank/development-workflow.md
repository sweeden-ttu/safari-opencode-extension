# Development Workflow - Memory Bank

## Build Commands
```bash
npm run build          # Production build via build.sh
npm run build:js       # Webpack production build
npm run dev           # Development with hot reload
npm run test          # Jest unit tests
npm run test:accounts # Multi-account integration tests
npm run lint          # ESLint code linting
npm run lint:md       # Markdown linting
```

## Multi-Account Testing
### Test Users
- `root` - System administrator account
- `sdw3098` - Scott (Douggy) Weeden
- `jck1278` - Johnathan Casey King

### Testing Script (`test-accounts.sh`)
```bash
#!/bin/bash
# Automated testing across multiple user accounts
for user in root sdw3098 jck1278; do
    sudo -u $user /Applications/Safari.app/Contents/MacOS/Safari --load-extension ./build/
done
```

## CI/CD Pipeline
### GitHub Actions (`build.yml`)
- Automated builds on push/PR
- Multi-environment testing
- Extension validation
- Artifact generation

### GitLab Integration
- Automatic sync on GitHub releases
- Mirror repository maintenance
- Additional CI/CD validation

## Development Environment Setup
1. **Prerequisites**: macOS 11+, Safari 14+, Xcode CLI tools
2. **Install**: `npm install`
3. **Build**: `npm run build`
4. **Load Extension**: Safari Developer menu → Load Extension
5. **Test**: `npm run test:accounts`

## Release Process
1. Development and testing
2. GitHub Actions validation
3. Multi-account testing
4. GitLab sync
5. Apple Store submission
6. Production deployment

## Code Quality
- ESLint for JavaScript/TypeScript
- Markdownlint for documentation
- Jest for unit testing
- Manual Safari extension testing
- Multi-user integration validation