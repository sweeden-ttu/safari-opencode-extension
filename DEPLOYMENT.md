# Apple App Store Deployment Plan

## Apple Developer Account Setup
- **Testing Account**: sweeden@ttu.edu
- **Publishing Entity**: sparK Innovation Lab - Texas Tech University
- **Funding Source**: sparK Innovation Lab
- **Bundle ID**: edu.ttu.spark.safari-opencode-extension
- **Team ID**: [To be obtained from sparK Apple Developer Portal]
- **Tax Entity**: sparK Innovation Lab (TTU subsidiary)
- **Revenue Reporting**: Texas Comptroller (threshold: $2.5M)

## App Store Requirements

### Technical Requirements
- macOS 11.0+ compatibility
- Safari 14.0+ support
- Code signing with Apple Developer certificate
- Notarization for distribution outside App Store
- Privacy manifest (PrivacyInfo.xcprivacy)

### Compliance Requirements
- App Store Review Guidelines compliance
- Privacy policy for credential handling
- Terms of service for LLM integration
- Educational use disclaimer
- Data collection transparency

## Development Phases

### Phase 1: Core Extension (Weeks 1-2)
- [ ] Safari extension manifest configuration
- [ ] Basic popup UI for LLM selection
- [ ] Content script for form detection
- [ ] Background script for message handling
- [ ] Local storage for user preferences

### Phase 2: LLM Integration (Weeks 3-4)
- [ ] MCP server implementation
- [ ] Claude API integration
- [ ] Gemini API integration
- [ ] User consent workflow
- [ ] Credential impersonation system

### Phase 3: Educational Platform Support (Weeks 5-6)
- [ ] TTU Mediasite integration
- [ ] Canvas LMS support
- [ ] Video download functionality
- [ ] Transcription service
- [ ] NotebookLM formatting

### Phase 4: Security & Compliance (Weeks 7-8)
- [ ] Encryption for stored credentials
- [ ] Audit logging system
- [ ] Session timeout implementation
- [ ] Privacy manifest creation
- [ ] Security review and testing

### Phase 5: App Store Preparation (Weeks 9-10)
- [ ] Code signing setup
- [ ] App Store metadata
- [ ] Screenshots and descriptions
- [ ] Privacy policy creation
- [ ] Beta testing with TestFlight

## Critical Deliverables

### 1. Privacy Manifest (PrivacyInfo.xcprivacy)
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>NSPrivacyCollectedDataTypes</key>
    <array>
        <dict>
            <key>NSPrivacyCollectedDataType</key>
            <string>NSPrivacyCollectedDataTypeUserID</string>
            <key>NSPrivacyCollectedDataTypeLinked</key>
            <false/>
            <key>NSPrivacyCollectedDataTypeTracking</key>
            <false/>
            <key>NSPrivacyCollectedDataTypePurposes</key>
            <array>
                <string>NSPrivacyCollectedDataTypePurposeAppFunctionality</string>
            </array>
        </dict>
    </array>
</dict>
</plist>
```

### 2. App Store Metadata
- **App Name**: OpenCode Safari Extension
- **Subtitle**: AI-Powered Educational Content Assistant
- **Category**: Education
- **Age Rating**: 4+ (Educational content)
- **Price**: Free (Educational use)

### 3. Required Documentation
- Privacy Policy (hosted at ttu.edu domain)
- Terms of Service
- User Guide
- Security Disclosure
- Educational Use License

## Risk Mitigation

### High-Risk Areas
1. **Credential Impersonation**: Requires explicit user consent and audit trails
2. **Cross-Site Scripting**: Content script security hardening needed
3. **Data Privacy**: FERPA compliance for educational records
4. **API Rate Limits**: Implement exponential backoff and user quotas

### Compliance Strategy
- Regular security audits
- Privacy impact assessments
- Educational use restrictions
- Transparent data handling policies

## Timeline & Milestones

| Week | Milestone | Deliverable |
|------|-----------|-------------|
| 2 | Core Extension Complete | Basic Safari extension |
| 4 | LLM Integration Ready | Working AI agent system |
| 6 | Platform Support Added | TTU/Canvas integration |
| 8 | Security Audit Complete | Compliance documentation |
| 10 | App Store Submission | Published extension |

## Success Metrics
- App Store approval within 7 days
- Zero critical security vulnerabilities
- <2% crash rate in production
- 90%+ user consent completion rate
- FERPA compliance certification
- Texas Comptroller reporting compliance (revenue >$2.5M)