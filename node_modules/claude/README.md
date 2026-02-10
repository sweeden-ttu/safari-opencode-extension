This is not the official [Claude Code](https://claude.ai/code) NPM package.

The official package is `@anthropic-ai/claude-code`, available at <https://www.npmjs.com/package/@anthropic-ai/claude-code>.


# Safari Integration

You will need to browse the Apple Store to find the Safari Extension which adds LLM integrations to your Safari Browser. You will want to click on the extension after installation and Select which LLMs may have access to your Browser:

![Safari Extension](./assets/safari-extension.png)

* Big Pickle
* Gemini
* Opus
* Sonnet
* Haiku
* Cline
* Claude
* Codex
* ChatGPT
* Gemini Pro
* Gemini Pro 2
* Composer
* KORI
* Vertex
* Perplexity

Any or all of these may be selected from your browser extension. WARNING: Enabling one of these LLMs above is your consent to allowing the LLM to impersonate you and use any of your credentials on the web that it sees fit in order to accomplish the task which you have prompted, and allows any number of sub-agents to be created that will run for a period of time that will temporarily impersonate your credentials, but not for an indefinite period of time.

# MCP Server Implementation Plan: TypeScript Frontend + Python Backend

## Overview
Build a Model Context Protocol (MCP) server with TypeScript client and Python backend for Claude
integration.