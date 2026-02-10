# Development Prompts

## Core Extension Development

### Prompt 1: Safari Extension Manifest
```
Create a Safari extension manifest.json that:
- Supports macOS 11.0+ and Safari 14.0+
- Requests minimal required permissions for educational content access
- Includes proper bundle identifier for TTU (edu.ttu.safari-opencode-extension)
- Defines content scripts for form interaction and video detection
- Specifies background script for LLM communication
- Includes proper CSP for security
```

### Prompt 2: Popup UI Implementation
```
Build a Safari extension popup interface that:
- Displays available LLM providers (Claude, Gemini, GPT-4)
- Shows clear consent warnings for credential impersonation
- Allows per-LLM permission toggling
- Displays current session status and timeouts
- Includes TTU branding and educational use disclaimer
- Implements accessibility standards (WCAG 2.1 AA)
```

### Prompt 3: Content Script Security
```
Implement a secure content script that:
- Detects forms on educational platforms (Canvas, Mediasite)
- Extracts video elements without exposing credentials
- Communicates with background script via secure messaging
- Implements CSP-compliant injection methods
- Handles cross-origin iframe content safely
- Logs all interactions for audit purposes
```

## LLM Integration Development

### Prompt 4: MCP Server Implementation
```
Create a TypeScript MCP server that:
- Implements Model Context Protocol for Claude/Gemini integration
- Handles secure credential passing with time-limited tokens
- Manages multiple concurrent LLM sessions
- Implements rate limiting and quota management
- Provides audit logging for all LLM interactions
- Supports graceful degradation when APIs are unavailable
```

### Prompt 5: Credential Impersonation System
```
Build a secure credential impersonation system that:
- Requires explicit user consent for each LLM provider
- Implements time-limited access tokens (max 24 hours)
- Encrypts stored credentials using Web Crypto API
- Provides session management and automatic expiration
- Logs all credential usage for compliance auditing
- Supports emergency revocation of all active sessions
```

## Educational Platform Integration

### Prompt 6: TTU Mediasite Integration
```
Implement TTU Mediasite (engrmediasite.ttu.edu) integration that:
- Authenticates using university SSO credentials
- Detects and downloads course video content
- Maintains video metadata and course associations
- Respects FERPA privacy requirements
- Implements proper error handling for network issues
- Supports batch processing of multiple videos
```

### Prompt 7: Canvas LMS Support
```
Create Canvas LMS integration that:
- Works with TTU Canvas instance and generic Canvas deployments
- Handles OAuth 2.0 authentication flow
- Accesses course materials and assignments
- Supports automated assignment submission
- Implements proper API rate limiting
- Maintains audit trails for all Canvas interactions
```

### Prompt 8: Video Transcription Service
```
Build a video transcription service that:
- Processes downloaded educational videos locally when possible
- Integrates with cloud speech-to-text APIs as fallback
- Formats transcriptions for Google NotebookLM compatibility
- Supports multiple languages and technical terminology
- Implements quality validation and error correction
- Provides progress tracking for long videos
```

## Security & Compliance

### Prompt 9: Privacy Manifest Creation
```
Generate Apple-compliant PrivacyInfo.xcprivacy that:
- Declares all data collection practices
- Specifies purposes for credential access
- Documents third-party API usage (OpenAI, Anthropic, Google)
- Includes FERPA compliance statements
- Defines data retention and deletion policies
- Meets App Store privacy requirements
```

### Prompt 10: Security Audit Implementation
```
Create comprehensive security testing that:
- Validates credential encryption and storage
- Tests for XSS and injection vulnerabilities
- Verifies proper CSP implementation
- Checks for sensitive data leakage
- Implements automated security scanning
- Provides compliance reporting for TTU IT security
```

## App Store Preparation

### Prompt 11: Code Signing Setup
```
Configure Apple Developer code signing for:
- Safari extension bundle signing
- Notarization for distribution
- Automatic signing in CI/CD pipeline
- Certificate management and renewal
- Team provisioning profile setup
- Distribution certificate validation
```

### Prompt 12: App Store Metadata
```
Create App Store Connect metadata including:
- Educational category positioning
- Age-appropriate content rating
- Privacy-focused app description
- Screenshot guidelines for Safari extensions
- Keyword optimization for discovery
- Educational institution verification
```

## Testing & Quality Assurance

### Prompt 13: Multi-User Testing Framework
```
Build automated testing for:
- Multiple macOS user account scenarios
- Different Safari versions and configurations
- Various educational platform integrations
- LLM provider API failures and recovery
- Network connectivity edge cases
- Performance under concurrent user sessions
```

### Prompt 14: Compliance Validation
```
Implement compliance testing for:
- FERPA educational record privacy
- Apple App Store guidelines adherence
- TTU IT security policy compliance
- Accessibility standards (Section 508, WCAG)
- Data protection regulations
- Educational use license restrictions
```

## Deployment & Monitoring

### Prompt 15: CI/CD Pipeline
```
Create GitHub Actions workflow for:
- Automated building and testing on macOS runners
- Code signing with TTU Apple Developer account
- App Store Connect API integration
- Automated security scanning and compliance checks
- Beta distribution via TestFlight
- Production deployment with rollback capabilities
```