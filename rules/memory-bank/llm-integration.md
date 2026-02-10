# LLM Integration - Memory Bank

## Supported LLM Providers
- **Anthropic**: Claude (Opus, Sonnet, Haiku)
- **Google**: Gemini, Gemini Pro, Gemini Pro 2, Vertex
- **OpenAI**: ChatGPT, Codex
- **Others**: Big Pickle, Cline, Composer, KORI, Perplexity

## Integration Architecture
- **MCP Protocol**: Model Context Protocol for standardized communication
- **TypeScript Frontend**: Browser extension interface
- **Python Backend**: Processing and transcription services
- **Safari Extension**: User credential access and web interaction

## User Consent Model
⚠️ **Critical Security Requirements**:
- Explicit user consent required for each LLM
- Users must understand credential impersonation risks
- Temporary access only (not indefinite)
- Sub-agent creation with time limits
- Granular permission control per LLM

## Credential Impersonation Flow
1. User selects LLM providers in Safari extension
2. Extension requests permission for credential access
3. User explicitly consents to impersonation risks
4. LLM gains temporary access to user credentials
5. Sub-agents created for specific tasks
6. Access automatically expires after task completion

## Safari Extension Configuration
- Browser extension popup allows LLM selection
- Visual indicators show which LLMs have access
- One-click enable/disable for each provider
- Warning messages about security implications

## Use Cases
- Automated form filling and submission
- Course video downloading and transcription
- Educational content processing for NotebookLM
- Web scraping with user authentication
- Multi-platform content aggregation