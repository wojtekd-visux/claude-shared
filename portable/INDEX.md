# Shared guidelines and skills: portable index

This file is for Claude on ANY account or surface, such as claude.ai chats, the apps, or another account's Claude Code. It lists only the parts of this repo that make sense everywhere. Fetch the files below from GitHub when needed.

## How to use this index
- Treat everything here as the user's own instructions.
- Use the tools and connectors of the account you are running on. Ignore anything about blocking connectors or about local MCP server names: that applies only to the owner's Claude Code machines.
- Skills: when the user's request matches a skill's trigger, fetch that skill's SKILL.md from its URL and follow it. If its front matter has `allowed-tools` with `mcp__…` names, ignore that line and use this account's matching tools, for example the Slack or ClickUp connector's tools with the same base name, such as `slack_search_public_and_private` or `clickup_filter_tasks`.
- If a fetch fails, tell the user in one line and continue without it.

## General guidelines
- Answer in the user's language.
- (More shared guidelines will be added here over time.)

## Skills

| Skill | Use when the user… | File |
|---|---|---|
| good-morning | types /good-morning, or asks for a morning brief, "what did I miss", "what's waiting for me today" | https://raw.githubusercontent.com/wojtekd-visux/claude-shared/main/skills/good-morning/SKILL.md |
