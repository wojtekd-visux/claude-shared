# Shared Claude instructions

These instructions are shared across all machines. They are pulled from a public GitHub repo at the start of each session.
Machine-specific facts, such as the CLI path and the accounts in use, live in the local `~/.claude/CLAUDE.md`, which imports this file.

## Figma, Slack, ClickUp: local MCP servers only, read-only by default

- Use Figma, Slack and ClickUp ONLY through the local user-scope MCP servers `figma`, `slack` and `clickup`. These are logged in with this machine's own accounts.
- The claude.ai connectors "claude.ai Figma", "claude.ai Slack" and "claude.ai ClickUp" are blocked by EXACT name in `~/.claude/settings.json` (`deniedMcpServers`, plus `permissions.deny` on `mcp__claude_ai_<Name>`). Never block by URL: the local servers use the same URLs.
- Never re-enable or disconnect anything on the claude.ai account. It is shared.
- Read-only works at two levels:
  - The OAuth scopes are read-only: Slack gets read scopes only, and ClickUp gets `"read"`.
  - Every write tool is listed in `permissions.deny`.
- If a blocked claude.ai connector still shows up (for example, injected by Claude Desktop), tell the user. Never use it.

### "I want write access in <service>"
1. Confirm which services. Warn the user that writes act as them and apply only to this machine.
2. Back up `~/.claude.json` and `~/.claude/settings.json` to `~/.claude/backups/mcp-local-<timestamp>/`.
3. Scopes, in `~/.claude.json` → `mcpServers.<name>.oauth.scopes`:
   - Slack: append `chat:write canvases:write channels:write groups:write im:write mpim:write files:write lists:write reactions:write`.
   - ClickUp: set the scopes to `"read write"`.
   - Figma: no change.
4. For Slack and ClickUp, run `<CLI> mcp logout <name>`, then log in again.
   - Linux: `setsid nohup script -qfec "<CLI> mcp login <name>" /dev/null > <tmp>/login.log 2>&1 &`
   - macOS: `nohup script -q /dev/null <CLI> mcp login <name> > <tmp>/login.log 2>&1 &`
   - Then show the user the full authorization URL from the log as a single line, and poll the log until it shows "Authenticated".
   - On Windows, the user runs `/mcp` → <name> → Authenticate.
5. Move that service's write tools from `permissions.deny` to `permissions.ask`. Every write then still needs the user's click.
6. Ask the user to restart the session, then verify.

### "Disable write access in <service>"
Reverse the steps above: restore the read-only scopes, log out and back in, then move the write tools back to `permissions.deny`.

## Editing these shared instructions
This file is maintained by the repo owner only. On other machines, never edit or push it. Suggest the change to the user instead.

<!-- test marker: PINEAPPLE-42 (temporary) -->
