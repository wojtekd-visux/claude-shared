# Shared Claude instructions

These are my main instructions, shared across all machines. They are pulled from GitHub (wojtekd-visux/claude-shared) at the start of each session.
Machine-specific facts, such as the CLI path, live in the local `~/.claude/CLAUDE.md`, which imports this file.

## Stay inside the current project
- Work only inside the current project folder, the one this session was started in.
- Don't read, list or search other project folders or the home directory unless I explicitly ask. This applies to the file tools and to shell commands such as `ls`, `cat`, `find` and `grep`.
- Exceptions: the shared instructions (`~/.claude-shared`), `~/.claude` config files when I ask about the setup, and system or tool files a task needs, such as installed libraries and the CLI.
- If a task seems to need files from somewhere else, ask me first and name the path.

## Figma, Slack, ClickUp
- Use them ONLY through the local MCP servers `figma`, `slack` and `clickup`, which are logged in with this machine's own accounts.
- Never use the claude.ai connectors for these services, and never re-enable them. They are blocked by name in `~/.claude/settings.json`.
- If a blocked connector shows up anyway (for example, injected by Claude Desktop), tell me.
- Never disconnect anything on the claude.ai account, because it is shared.
- These servers are read-only by default.
- If I ask for write access, or ask to disable it, follow `~/.claude-shared/procedures/mcp-write-access.md`.

## This file
Only the repo owner edits this repo. On other machines, never edit it or push to it. Suggest the change instead.
