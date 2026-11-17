# Shared Claude instructions

These are my main instructions, shared across all machines. They are pulled from GitHub (wojtekd-visux/claude-shared) at the start of each session.
Machine-specific facts, such as the CLI path, live in the local `~/.claude/CLAUDE.md`, which imports this file.

## Figma, Slack, ClickUp
- Use them ONLY through the local MCP servers `figma`, `slack` and `clickup`, which are logged in with this machine's own accounts.
- Never use the claude.ai connectors for these services, and never re-enable them. They are blocked by name in `~/.claude/settings.json`.
- If a blocked connector shows up anyway (for example, injected by Claude Desktop), tell me.
- Never disconnect anything on the claude.ai account, because it is shared.
- These servers are read-only by default.
- If I ask for write access, or ask to disable it, follow `~/.claude-shared/procedures/mcp-write-access.md`.

## This file
Only the repo owner edits this repo. On other machines, never edit it or push to it. Suggest the change instead.
