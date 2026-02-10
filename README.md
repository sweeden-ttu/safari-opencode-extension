# Safari OpenCode Extension

A Safari browser extension that enables AI agents to interact with web content through secure credential impersonation, automated form handling, and educational content processing. Built with Model Context Protocol (MCP) for seamless LLM integration.

## Overview

This extension serves as a bridge between AI language models and web applications, allowing authorized LLMs to:
- Access user credentials temporarily for automated tasks
- Interact with web forms and submit data
- Download educational video content from course platforms
- Process and transcribe content for integration with Google NotebookLM

## Core Features

### 🔐 Secure Credential Impersonation
- **Temporary Access**: LLMs gain time-limited access to user credentials
- **Explicit Consent**: Users must explicitly authorize each LLM provider
- **Sub-Agent Creation**: Spawns limited-time agents for specific tasks
- **Granular Control**: Per-LLM permission management

### 📝 Intelligent Form Interaction
- **Auto-Fill**: Automatically populate form fields based on context
- **Smart Submission**: Submit forms with validation and error handling
- **Multi-Step Forms**: Handle complex, multi-page form workflows
- **Field Detection**: Identify and interact with various input types

### 🎥 Educational Content Processing
- **Video Download**: Extract course videos from educational platforms
- **Audio Transcription**: Convert video/audio to text using speech recognition
- **Content Structuring**: Format transcriptions for NotebookLM integration
- **Batch Processing**: Handle multiple videos simultaneously

### 🤖 Multi-LLM Support
- **Anthropic**: Claude (Opus, Sonnet, Haiku)
- **Google**: Gemini, Gemini Pro, Gemini Pro 2, Vertex AI
- **OpenAI**: ChatGPT, GPT-4, Codex
- **Others**: Big Pickle, Cline, Composer, KORI, Perplexity

## Architecture

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│   Safari        │    │   MCP Server     │    │   Python        │
│   Extension     │◄──►│   (TypeScript)   │◄──►│   Backend       │
│                 │    │                  │    │                 │
│ • Popup UI      │    │ • Protocol       │    │ • Transcription │
│ • Content Script│    │ • Communication  │    │ • Processing    │
│ • Background    │    │ • Agent Mgmt     │    │ • File Handling │
└─────────────────┘    └──────────────────┘    └─────────────────┘
```

## Requirements

### System Requirements
- **Operating System**: macOS 11.0 (Big Sur) or later
- **Browser**: Safari 14.0 or later
- **Development Tools**: Xcode Command Line Tools
- **Runtime**: Node.js 18+ and Python 3.8+

### Permissions Required
- `activeTab` - Access current browser tab
- `storage` - Store extension settings and temporary data
- `downloads` - Download video files and transcriptions
- `webRequest` + `webRequestBlocking` - Intercept and modify HTTP requests
- `https://*/*` + `http://*/*` - Universal web access for form interaction

## Quick Start

### Installation
```bash
# Clone repository
git clone <repository-url>
cd safari-opencode-extension

# Install dependencies
npm install

# Build extension
npm run build
```

### Safari Setup
1. Open Safari → Develop → Allow Unsigned Extensions
2. Safari → Develop → Load Extension → Select `build/` folder
3. Click extension icon in toolbar
4. Select desired LLM providers
5. Review and accept security warnings

### Testing
```bash
# Run unit tests
npm run test

# Test across multiple user accounts
npm run test:accounts

# Development mode with hot reload
npm run dev
```

## Multi-Account Testing

The extension undergoes rigorous testing across different user privilege levels:

### Test Accounts
- **`root`** - System administrator (full system access)
- **`sdw3098`** - Scott (Douggy) Weeden (standard user)
- **`jck1278`** - Johnathan Casey King (limited user)

### Testing Scenarios
- Credential access across different permission levels
- Form interaction with various authentication states
- Video download from different educational platforms
- Cross-account data isolation and security

### Automated Testing
```bash
#!/bin/bash
# Multi-account testing script
for user in root sdw3098 jck1278; do
    sudo -u $user /Applications/Safari.app/Contents/MacOS/Safari \
        --load-extension ./build/
done
```

## CI/CD Pipeline

- **GitHub Actions**: Automated builds and testing
- **GitLab Sync**: Automatic synchronization on releases
- **Apple Store**: Validated deployment process

## Documentation

- [Development Guide](DEVELOPMENT.md)
- [Deployment Guide](DEPLOYMENT.md)
- [Claude Integration](CLAUDE.md)
- [Gemini Integration](GEMINI.md)
- [Agent Configuration](AGENTS.md)

## Security Model

### ⚠️ Critical Security Notice
**This extension can impersonate user credentials and perform actions on your behalf.**

### User Consent Requirements
- **Explicit Authorization**: Each LLM must be individually authorized
- **Risk Acknowledgment**: Users must understand credential impersonation risks
- **Temporary Access**: No indefinite credential access granted
- **Revocable Permissions**: Users can disable LLM access at any time

### Security Safeguards
- **Time-Limited Sessions**: Sub-agents expire automatically
- **Audit Logging**: All credential usage is logged
- **Sandboxed Execution**: LLM actions are contained and monitored
- **Permission Granularity**: Fine-grained control over LLM capabilities

### Supported Educational Platforms
- Canvas LMS
- Blackboard Learn
- Moodle
- Coursera
- edX
- Udemy
- Khan Academy
- Custom institutional platforms

### Data Privacy
- **Local Processing**: Transcription occurs locally when possible
- **Encrypted Storage**: Temporary credentials are encrypted
- **No Data Retention**: Credentials are not stored permanently
- **User Control**: Complete control over data sharing with LLMs

## License

MIT License - See LICENSE file for details

## Rocky Linux 10 Dell Optimization

### Disk I/O Optimization
```bash
# Fix sda transfer size alignment
echo 4096 > /sys/block/sda/queue/optimal_io_size
echo 4096 > /sys/block/sda/queue/minimum_io_size

# Make persistent
echo 'ACTION=="add|change", KERNEL=="sda", ATTR{queue/optimal_io_size}="4096"' > /etc/udev/rules.d/60-sda-optimization.rules
udevadm control --reload-rules
```

### OLLAMA Removal
```bash
# Stop and remove OLLAMA
systemctl stop ollama
systemctl disable ollama
rm -rf /usr/local/bin/ollama /usr/share/ollama ~/.ollama /var/lib/ollama
rm -f /etc/systemd/system/ollama.service
systemctl daemon-reload
```

### Automated Script
```bash
sudo ./scripts/optimize-rocky.sh
```

## Development Workflow

### Build Commands
```bash
npm run build          # Production build via build.sh
npm run build:js       # Webpack production build only
npm run dev           # Development mode with hot reload
npm run test          # Jest unit tests
npm run test:accounts # Multi-account integration tests
npm run lint          # ESLint code quality checks
npm run lint:md       # Markdown documentation linting
```

### Project Structure
```
safari-opencode-extension/
├── src/
│   ├── background.js       # Background service worker
│   ├── content.js         # Content script for web interaction
│   └── popup/             # Extension UI components
│       ├── popup.html
│       ├── popup.js
│       └── popup.css
├── scripts/
│   ├── build.sh           # Production build script
│   └── test-accounts.sh   # Multi-user testing automation
├── .github/workflows/
│   └── build.yml          # CI/CD automation
├── manifest.json          # Extension configuration
├── package.json           # Node.js dependencies
└── webpack.config.js      # Build configuration
```

## Use Cases

### Educational Content Processing
1. **Course Video Download**
   - Detect video elements on educational platforms
   - Download with proper authentication
   - Maintain quality and metadata

2. **Transcription Workflow**
   - Extract audio from downloaded videos
   - Generate accurate transcriptions
   - Format for NotebookLM compatibility

3. **Automated Form Handling**
   - Login to educational platforms
   - Navigate course structures
   - Submit assignments and quizzes

### LLM Agent Tasks
1. **Research Automation**
   - Gather information from multiple sources
   - Fill research forms and surveys
   - Compile data for analysis

2. **Content Aggregation**
   - Collect materials from various platforms
   - Organize and structure content
   - Prepare for further processing

## Troubleshooting

### Common Issues

**Extension Not Loading**
- Ensure Safari Developer menu is enabled
- Check that unsigned extensions are allowed
- Verify build directory contains all required files

**Credential Access Denied**
- Review LLM authorization settings
- Check user consent status
- Verify platform-specific authentication

**Video Download Failures**
- Confirm platform compatibility
- Check network connectivity
- Verify user permissions on educational platform

### Debug Mode
```bash
# Enable debug logging
npm run dev -- --debug

# View extension console
# Safari → Develop → Extension → OpenCode Extension
```

## Contributing

### Development Setup
1. Fork the repository
2. Create a feature branch: `git checkout -b feature/new-capability`
3. Install dependencies: `npm install`
4. Make changes and test: `npm run test`
5. Build and validate: `npm run build`
6. Submit pull request

### Code Standards
- **ESLint**: Follow established JavaScript/TypeScript standards
- **Testing**: Maintain >80% code coverage
- **Documentation**: Update relevant documentation
- **Security**: Follow secure coding practices

## Support

### Getting Help
- **Issues**: Report bugs and feature requests via GitHub Issues
- **Discussions**: Community support via GitHub Discussions
- **Documentation**: Comprehensive guides in `/docs` directory

### Known Limitations
- macOS and Safari only (no cross-platform support)
- Requires explicit user consent for each LLM
- Limited to supported educational platforms
- Temporary credential access only (no persistent storage)

## Acknowledgments

- Model Context Protocol (MCP) for standardized LLM communication
- Safari Extension framework for secure browser integration
- Educational platform APIs for content access
- Open source community for tools and libraries