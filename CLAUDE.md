# Claude Integration Guide

## MCP Server Configuration

```json
{
  "mcpServers": {
    "safari-opencode-extension": {
      "command": "node",
      "args": ["dist/index.js"],
      "env": {
        "SAFARI_EXTENSION_ID": "com.opencode.safari-extension"
      }
    }
  }
}
```

## Educational Platform Integration

### Texas Tech University
- **Domain**: engrmediasite.ttu.edu
- **Authentication**: SSO via university credentials
- **Content Types**: Engineering course videos, lecture recordings
- **Access Method**: Credential impersonation with user consent

### Supported Operations
- Video download from Mediasite platform
- Automatic transcription generation
- Content formatting for NotebookLM integration
- Batch processing of course materials

## Security Configuration

### User Consent Requirements
- Explicit authorization for TTU Mediasite access
- Temporary credential impersonation (max 24 hours)
- Audit logging of all platform interactions
- Automatic session expiration

### Claude-Specific Settings
```javascript
const claudeConfig = {
  model: 'claude-3-sonnet',
  maxTokens: 4096,
  temperature: 0.3,
  permissions: {
    credentialAccess: true,
    videoDownload: true,
    transcription: true,
    formInteraction: true
  },
  platforms: ['engrmediasite.ttu.edu'],
  sessionTimeout: 3600 // 1 hour
}
```

## Usage Examples

### Download Course Videos
```javascript
// Claude can access TTU Mediasite with user permission
const videos = await claude.downloadCourseVideos({
  platform: 'engrmediasite.ttu.edu',
  courseId: 'ENGR-3301',
  semester: 'Fall2024'
})
```

### Generate Transcriptions
```javascript
// Process downloaded videos for NotebookLM
const transcripts = await claude.generateTranscriptions({
  videos: videos,
  format: 'notebooklm',
  language: 'en-US'
})
```

