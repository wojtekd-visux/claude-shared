# claude-shared

Shared global instructions for Claude Code, used on several machines.

- It lives in `~/.claude-shared`. It's downloaded as an archive with curl and tar, so git isn't needed (a git clone works too).
- Import it from `~/.claude/CLAUDE.md` with the line `@~/.claude-shared/CLAUDE.md`.
- A `SessionStart` hook in `~/.claude/settings.json` updates `~/.claude-shared` at the start of each session, then runs `bin/sync.sh`, which links every folder in `skills/` into `~/.claude/skills/`. A local skill with the same name always wins.
- Changes take effect from the next new session.

Do not put secrets here. This repo is public.
