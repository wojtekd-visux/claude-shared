# claude-shared

Shared global instructions for Claude Code, used on several machines.

- Clone it to `~/.claude-shared`.
- Import it from `~/.claude/CLAUDE.md` with the line `@~/.claude-shared/CLAUDE.md`.
- A `SessionStart` hook in `~/.claude/settings.json` runs `bin/sync.sh` at the start of each session. The script runs `git pull` and links every folder in `skills/` into `~/.claude/skills/`. A local skill with the same name always wins.
- Changes take effect from the next new session.

Do not put secrets here. This repo is public.
