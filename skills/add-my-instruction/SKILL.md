---
name: add-my-instruction
description: Add a personal rule to the user's own local Claude instructions (the "My own instructions" section of ~/.claude/CLAUDE.md). Use when the user says "add this to my own instructions", "remember this rule for all my projects", or similar. Not for the shared instructions.
---

# Add to my own instructions

1. Restate the rule in one short, clear line. Ask only if it is ambiguous.
2. Open `~/.claude/CLAUDE.md` and find the `# My own instructions` section. If it is missing, add it at the end.
3. Check for a duplicate or conflicting rule. If you find one, show it and ask whether to replace it.
4. Back up the file to `~/.claude/backups/claude-md-<timestamp>.md`, then append the rule as a bullet under that section.
5. Never edit `~/.claude-shared`. It gets overwritten on the next update.
6. Tell the user it takes effect from the next new session. If the rule seems useful for the whole team, suggest sending it to the owner of the shared instructions.
