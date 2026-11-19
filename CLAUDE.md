# Shared Claude instructions

These are my main instructions, shared across all machines. They are pulled from GitHub (wojtekd-visux/claude-shared) at the start of each session.
Machine-specific facts, such as the CLI path, live in the local `~/.claude/CLAUDE.md`, which imports this file.

## Stay inside the current project
- Work only inside the current project folder, the one this session was started in.
- Don't read, list or search other project folders or the home directory unless I explicitly ask. This applies to the file tools and to shell commands such as `ls`, `cat`, `find` and `grep`.
- Exceptions: the shared instructions (`~/.claude-shared`), `~/.claude` config files when I ask about the setup, and system or tool files a task needs, such as installed libraries and the CLI.
- If a task seems to need files from somewhere else, ask me first and name the path.

## Figma, Slack, ClickUp
- Use them ONLY through local MCP servers logged in with this machine's own accounts. They are named either
  - `figma`, `slack`, `clickup`: set up for the whole OS user, or
  - `figma-<label>`, `slack-<label>`, `clickup-<label>`: set up per folder. Here the label names a set of accounts (emails), and the servers, blocks and rules exist only in the folders that use them. In a folder without them, these services are not connected. Say so, and suggest running the per-folder setup prompt there.
- Never use the claude.ai connectors for these services, and never re-enable them. They are blocked by name in `~/.claude/settings.json`, or per folder in `.claude/settings.local.json`.
- If a blocked connector shows up anyway (for example, injected by Claude Desktop), tell me.
- Never disconnect anything on the claude.ai account, because it is shared.
- Figma has read AND write access. Slack and ClickUp are read-only by default.
- If I ask for write access in Slack or ClickUp, or ask to disable it, follow `~/.claude-shared/procedures/mcp-write-access.md`.

## This file
Only the GitHub account wojtekd-visux may edit or push to this repo. Before any change, check with `gh api user --jq .login`. If the logged-in account is different, or gh is not logged in, never edit or push: suggest the change instead.
