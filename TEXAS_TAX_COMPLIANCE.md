# Texas State Tax Compliance

## Apple Developer Account Configuration
- **Testing Account**: sweeden@ttu.edu
- **Publishing Entity**: sparK Innovation Lab - Texas Tech University
- **Funding Source**: sparK Innovation Lab
- **Tax Status**: TTU Innovation Lab (Educational Subsidiary)
- **Comptroller Reporting**: Required for revenue >$2.5M

## Revenue Reporting Requirements

### Texas Comptroller Office Reporting
- **Threshold**: $2.5 million annual revenue
- **Reporting Entity**: Texas Tech University
- **Contact**: Texas Comptroller of Public Accounts
- **Frequency**: Annual filing required
- **Tax Rate**: Standard Texas state tax rates apply

### App Store Revenue Tracking
```javascript
// Revenue monitoring configuration
const revenueConfig = {
  threshold: 2500000, // $2.5M threshold
  reportingEntity: "Texas Tech University",
  comptrollerOffice: "Texas Comptroller of Public Accounts",
  taxableRevenue: true,
  reportingFrequency: "annual"
}
```

## Compliance Documentation

### Required Filings
- **Form**: Texas Franchise Tax Report (if applicable)
- **Entity**: sparK Innovation Lab - Texas Tech University
- **Schedule**: Annual revenue disclosure
- **Threshold Monitoring**: Automated tracking at $2.5M
- **Payment Due**: Upon exceeding threshold
- **Contact**: Texas Comptroller's Office Revenue Division

### Revenue Categories
- App Store sales revenue
- In-app purchase revenue  
- Subscription revenue
- Educational licensing fees

## Implementation Requirements

### App Store Connect Configuration
- Set Texas Tech University as legal entity
- Configure automatic tax reporting
- Enable revenue threshold monitoring
- Implement comptroller office notifications

### Financial Tracking
```json
{
  "revenueTracking": {
    "enabled": true,
    "threshold": 2500000,
    "currency": "USD",
    "reportingPeriod": "annual",
    "taxAuthority": "Texas Comptroller",
    "autoNotification": true
  }
}
```

### Notification System
- Automated alerts at 80% of threshold ($2M)
- Quarterly revenue reports to TTU Finance
- Annual filing preparation assistance
- Comptroller office direct reporting

## Contact Information
- **Primary**: sweeden@ttu.edu
- **TTU Finance**: [TTU Finance Office]
- **Texas Comptroller**: comptroller.texas.gov
- **Revenue Threshold**: $2,500,000 annually