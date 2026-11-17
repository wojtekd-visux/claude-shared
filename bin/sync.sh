#!/bin/sh
# Runs at the start of each Claude Code session (SessionStart hook).
# The hook runs `git pull` on ~/.claude-shared first, then this script.
# Links every shared skill into ~/.claude/skills/<name> so Claude Code finds it.
# A local skill with the same name (a real folder) is never touched, so local wins.
# Links to skills that were removed from the repo get cleaned up.
# Never fails and never prints, so it can't block a session.
REPO="$HOME/.claude-shared"
DEST="$HOME/.claude/skills"
mkdir -p "$DEST" 2>/dev/null
for dir in "$REPO"/skills/*/; do
  [ -f "$dir/SKILL.md" ] || continue
  name=$(basename "$dir")
  target="$DEST/$name"
  if [ -L "$target" ]; then
    case "$(readlink "$target")" in "$REPO"/*) ln -sfn "${dir%/}" "$target" ;; esac
  elif [ ! -e "$target" ]; then
    ln -s "${dir%/}" "$target"
  fi
done
for link in "$DEST"/*; do
  [ -L "$link" ] || continue
  case "$(readlink "$link")" in "$REPO"/*) [ -e "$link" ] || rm -f "$link" ;; esac
done
exit 0
