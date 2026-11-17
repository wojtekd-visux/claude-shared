# Turning write access on and off for Figma, Slack and ClickUp

Read this only when the user asks for write access, or asks to disable it.

## "I want write access in <service>"
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

## "Disable write access in <service>"
Reverse the steps above: restore the read-only scopes, log out and back in, then move the write tools back to `permissions.deny`.
