# claude-shared

Shared global instructions for Claude Code, used on several machines.

- Clone it to `~/.claude-shared`.
- Import it from `~/.claude/CLAUDE.md` with the line `@~/.claude-shared/CLAUDE.md`.
- A `SessionStart` hook in `~/.claude/settings.json` runs `git pull` at the start of each session to keep it up to date.

Do not put secrets here. This repo is public.
