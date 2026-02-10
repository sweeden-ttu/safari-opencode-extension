# Safari OpenCode Extension - Memory Bank

## Project Identity
- **Name**: safari-opencode-extension
- **Type**: Safari Browser Extension
- **Purpose**: Enable OpenCode AI to impersonate user credentials, interact with web forms, download course videos, and transcribe content for NotebookLM integration

## Core Functionality
- **Credential Impersonation**: Safely impersonate user credentials for automated tasks
- **Form Interaction**: Automatically fill and submit web forms on websites
- **Video Download**: Download course lecture videos from educational platforms
- **Transcription**: Convert video content to text for NotebookLM integration
- **LLM Integration**: Support for multiple LLMs (Claude, Gemini, ChatGPT, etc.)

## Architecture
- **Frontend**: TypeScript/JavaScript Safari Extension
- **Backend**: Python backend for processing
- **Protocol**: Model Context Protocol (MCP) server implementation
- **Manifest Version**: 2 (Chrome Extension format adapted for Safari)

## Key Files
- `manifest.json` - Extension configuration and permissions
- `background.js` - Background service worker
- `content.js` - Content script for web page interaction
- `popup/popup.html` - Extension popup interface
- `package.json` - Node.js dependencies and scripts

## Security Model
⚠️ **Critical**: Extension can impersonate user credentials
- Users must explicitly consent to LLM access
- Temporary credential impersonation (not indefinite)
- Sub-agents created for limited time periods
- Multiple LLM providers supported with granular permissions

## Development Environment
- **OS**: macOS 11+ required
- **Browser**: Safari 14+
- **Build Tools**: Xcode Command Line Tools, Node.js 18+, Webpack
- **Testing**: Jest, ESLint, Multi-account testing

## User Accounts for Testing
- `root` - System administrator
- `sdw3098` - Scott (Douggy) Weeden  
- `jck1278` - Johnathan Casey King

## CI/CD Pipeline
- **GitHub Actions**: Automated builds and testing (`build.yml`)
- **GitLab Sync**: Automatic synchronization on releases
- **Apple Store**: Validated deployment process
- **Multi-account Testing**: Automated testing across user accounts