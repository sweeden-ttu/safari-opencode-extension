# Technical Architecture - Memory Bank

## Extension Structure
```
safari-opencode-extension/
├── manifest.json           # Extension configuration
├── src/
│   ├── background.js       # Background service worker
│   ├── content.js         # Content script injection
│   └── popup/             # Extension UI
├── scripts/
│   ├── build.sh           # Build automation
│   └── test-accounts.sh   # Multi-user testing
└── .github/workflows/     # CI/CD automation
```

## Permissions Model
- `activeTab` - Access to current tab
- `storage` - Local data persistence
- `downloads` - File download capability
- `webRequest` + `webRequestBlocking` - HTTP request interception
- `https://*/*` + `http://*/*` - Universal web access

## Content Script Capabilities
- DOM manipulation and form interaction
- Credential extraction and impersonation
- Video element detection and download
- Real-time communication with background script

## Background Script Functions
- MCP server communication
- Download management
- Storage coordination
- Cross-tab messaging

## Build System
- **Webpack**: Module bundling and optimization
- **Production Mode**: Minified, optimized builds
- **Development Mode**: Hot reload, source maps
- **Scripts**: Automated build and test processes

## Dependencies
- `@modelcontextprotocol/sdk`: MCP protocol implementation
- `webpack`: Build system
- `jest`: Testing framework
- `eslint`: Code linting

## Testing Strategy
- Unit tests with Jest
- Multi-account integration testing
- Automated CI/CD validation
- Manual Safari extension testing