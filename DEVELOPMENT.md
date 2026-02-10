# Safari Extension Development Guide

## Project Structure

```
safari-opencode-extension/
├── src/
│   ├── background.js       # Service worker for extension lifecycle
│   ├── content.js         # DOM manipulation and credential extraction
│   └── popup/
│       ├── popup.html     # LLM selection interface
│       ├── popup.js       # User consent and configuration logic
│       └── popup.css      # Extension UI styling
├── manifest.json          # Safari extension configuration
├── scripts/
│   ├── build.sh           # Production build with webpack optimization
│   └── test-accounts.sh   # Automated multi-user testing
├── .github/workflows/
│   ├── build.yml          # CI/CD pipeline automation
│   └── release.yml        # Apple Store deployment
├── .gitlab-ci.yml         # Mirror repository CI/CD
└── webpack.config.js      # Module bundling configuration
```

## Build Requirements

### System Dependencies
- **Xcode Command Line Tools**: Required for Safari extension development
- **Node.js 18+**: JavaScript runtime and package management
- **Safari 14+**: Target browser with extension support
- **macOS 11+**: Operating system requirement for Safari extensions
- **Python 3.8+**: Backend transcription and processing services

### Development Tools
- **Webpack 5**: Module bundling and asset optimization
- **Jest**: Unit testing framework with >80% coverage requirement
- **ESLint**: Code quality and style enforcement
- **Markdownlint**: Documentation consistency validation

## User Account Testing

### Test Account Specifications
- **`root`** - System administrator with full macOS privileges
  - Tests: System-level credential access, administrative form interactions
  - Purpose: Validate extension behavior with maximum permissions
- **`sdw3098`** - Scott (Douggy) Weeden - Standard user account
  - Tests: Typical user workflows, educational platform access
  - Purpose: Simulate real-world usage patterns
- **`jck1278`** - Johnathan Casey King - Limited privilege user
  - Tests: Restricted access scenarios, permission boundary validation
  - Purpose: Ensure security isolation and proper error handling

### Multi-Account Testing Script
```bash
#!/bin/bash
# Automated testing across user privilege levels
# Tests credential isolation and cross-account security

USERS=("root" "sdw3098" "jck1278")
EXTENSION_PATH="./build/"
SAFARI_PATH="/Applications/Safari.app/Contents/MacOS/Safari"

for user in "${USERS[@]}"; do
    echo "Testing extension with user: $user"
    sudo -u $user $SAFARI_PATH --load-extension $EXTENSION_PATH
    
    # Wait for Safari to load and test basic functionality
    sleep 5
    
    # Kill Safari process for next test
    sudo -u $user pkill -f Safari
done

echo "Multi-account testing completed"
```

### Testing Scenarios
1. **Credential Access Validation**
   - Verify each user can only access their own credentials
   - Test cross-account isolation boundaries
   - Validate temporary credential expiration

2. **Educational Platform Integration**
   - Canvas LMS login and course navigation
   - Blackboard assignment submission workflows
   - Moodle video content extraction

3. **LLM Authorization Testing**
   - Individual consent for each LLM provider
   - Permission revocation and re-authorization
   - Sub-agent creation and expiration

## Development Workflow

### Local Development Process
1. **Environment Setup**
   ```bash
   # Clone and setup development environment
   git clone <repository-url>
   cd safari-opencode-extension
   npm install
   
   # Verify system requirements
   node --version  # Should be 18+
   python3 --version  # Should be 3.8+
   xcode-select --version  # Verify CLI tools
   ```

2. **Development Mode with Hot Reload**
   ```bash
   # Start webpack development server
   npm run dev
   
   # In separate terminal, load extension in Safari
   # Safari → Develop → Load Extension → Select build/
   ```

3. **Testing and Validation**
   ```bash
   # Run unit tests with coverage
   npm run test
   
   # Lint code for quality issues
   npm run lint
   
   # Test across multiple user accounts
   npm run test:accounts
   ```

### CI/CD Pipeline Integration
1. **GitHub Actions Workflow**
   - Triggered on push to main branch and pull requests
   - Runs automated tests across Node.js versions
   - Validates Safari extension manifest
   - Generates production build artifacts

2. **GitLab Mirror Synchronization**
   - Automatic sync on GitHub release creation
   - Secondary CI/CD validation pipeline
   - Backup repository maintenance

3. **Apple Store Deployment**
   - Automated extension validation
   - Compliance checking for Safari guidelines
   - Staged deployment to App Store

### Code Quality Standards
- **ESLint Configuration**: Enforces consistent JavaScript/TypeScript style
- **Test Coverage**: Minimum 80% code coverage requirement
- **Security Review**: Mandatory for credential handling code
- **Documentation**: All public APIs must be documented