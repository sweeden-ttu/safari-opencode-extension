# Apple App Store Submission Checklist

## Pre-Submission Requirements

### Apple Developer Account (sweeden@ttu.edu)
- [ ] Apple Developer Program enrollment verified
- [ ] Team Agent role confirmed for sweeden@ttu.edu
- [ ] Bundle ID registered: edu.ttu.safari-opencode-extension
- [ ] App Store Connect access configured
- [ ] Distribution certificates generated

### Technical Compliance
- [ ] macOS 11.0+ compatibility tested
- [ ] Safari 14.0+ support verified
- [ ] Code signing with Apple Developer certificate
- [ ] Notarization completed for distribution
- [ ] Privacy manifest (PrivacyInfo.xcprivacy) included
- [ ] App sandbox entitlements configured

### Security & Privacy
- [ ] Credential encryption implemented
- [ ] User consent workflow for LLM access
- [ ] Audit logging for all credential usage
- [ ] Session timeout mechanisms
- [ ] Data retention policies documented
- [ ] FERPA compliance for educational records

### Educational Platform Integration
- [ ] TTU Mediasite (engrmediasite.ttu.edu) integration
- [ ] Canvas LMS support
- [ ] Video download functionality
- [ ] Transcription service for NotebookLM
- [ ] Batch processing capabilities

## App Store Connect Configuration

### App Information
- **App Name**: OpenCode Safari Extension
- **Bundle ID**: edu.ttu.spark.safari-opencode-extension
- **Developer**: sparK Innovation Lab - Texas Tech University
- **Primary Category**: Education
- **Secondary Category**: Productivity
- **Content Rights**: sparK Innovation Lab
- **Age Rating**: 4+ (No Objectionable Content)

### Pricing & Availability
- **Price**: Free (Educational use)
- **Revenue Model**: Institutional licensing above $2.5M threshold
- **Tax Compliance**: Texas Comptroller reporting required
- **Availability**: All territories
- **Educational Discount**: Available for institutions
- **Volume Purchase Program**: Enabled

### App Privacy
- **Data Collection**: User credentials (temporary, encrypted)
- **Data Usage**: Educational content processing only
- **Third-Party Sharing**: LLM providers (with consent)
- **Data Retention**: Session-based, no permanent storage
- **User Control**: Full revocation capabilities

### App Review Information
- **Contact**: sweeden@ttu.edu
- **Phone**: TTU IT Support number
- **Review Notes**: Educational use extension for Texas Tech University
- **Demo Account**: Test credentials for TTU systems
- **Additional Info**: FERPA compliance documentation

## Required Documentation

### Privacy Policy (Required)
```
Location: https://www.ttu.edu/privacy/safari-extension-privacy-policy
Content: Data collection, usage, sharing, retention policies
Compliance: FERPA, COPPA, GDPR considerations
```

### Terms of Service
```
Location: https://www.ttu.edu/terms/safari-extension-terms
Content: Educational use restrictions, liability limitations
Scope: TTU students, faculty, staff usage guidelines
```

### Support Documentation
```
User Guide: Installation and usage instructions
FAQ: Common issues and troubleshooting
Contact: sweeden@ttu.edu for technical support
```

## Testing Requirements

### Functional Testing
- [ ] Extension installation and activation
- [ ] LLM provider selection and consent
- [ ] Credential impersonation workflow
- [ ] Educational platform integration
- [ ] Video download and transcription
- [ ] Session management and timeout

### Compatibility Testing
- [ ] macOS Big Sur (11.0) through Sonoma (14.0)
- [ ] Safari 14.0 through Safari 17.0
- [ ] Multiple user account scenarios
- [ ] Network connectivity variations
- [ ] API failure recovery

### Security Testing
- [ ] Credential encryption validation
- [ ] XSS and injection vulnerability scans
- [ ] CSP compliance verification
- [ ] Audit log integrity checks
- [ ] Session isolation between users

## Submission Process

### Phase 1: Preparation
1. Complete all checklist items
2. Generate final build with production certificates
3. Create App Store Connect app record
4. Upload privacy policy and terms of service
5. Prepare marketing materials and screenshots

### Phase 2: Upload
1. Archive extension using Xcode
2. Upload to App Store Connect via Transporter
3. Configure app metadata and descriptions
4. Add screenshots and promotional materials
5. Set pricing and availability

### Phase 3: Review
1. Submit for App Store review
2. Monitor review status in App Store Connect
3. Respond to reviewer feedback within 7 days
4. Address any compliance issues
5. Approve for release upon acceptance

## Post-Submission Monitoring

### Release Management
- [ ] Monitor crash reports and user feedback
- [ ] Track adoption metrics and usage patterns
- [ ] Maintain compliance with evolving regulations
- [ ] Plan regular security updates and patches
- [ ] Coordinate with TTU IT for institutional deployment

### Success Metrics
- App Store approval within 14 days
- Zero critical security vulnerabilities
- <1% crash rate in production
- 95%+ user consent completion rate
- FERPA compliance audit passing

## Emergency Procedures

### Critical Issues
- Immediate app removal process
- User notification procedures
- Data breach response plan
- Compliance violation remediation
- Emergency contact: sweeden@ttu.edu

### Rollback Plan
- Previous version restoration
- User data migration procedures
- Communication to affected users
- Regulatory notification requirements