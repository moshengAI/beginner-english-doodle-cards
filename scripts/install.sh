#!/usr/bin/env bash
set -euo pipefail

SKILL_NAME="beginner-english-doodle-cards"
ARCHIVE="${BEGINNER_ENGLISH_DOODLE_CARDS_ARCHIVE:-}"
TARGETS=()
TEMP_DIR=""
SOURCE_DIR=""

usage() {
  cat <<'EOF'
Install beginner-english-doodle-cards for Codex and other agent runtimes.

Usage:
  install.sh [--target codex|claude|agents|grok|all] [--archive PATH_OR_URL]
  install.sh --all [--archive PATH_OR_URL]

Examples:
  install.sh --target codex
  install.sh --all
  install.sh --all --archive /path/to/beginner-english-doodle-cards.skill.zip
  curl -fsSL https://example.com/install.sh | bash -s -- \
    --all --archive https://example.com/beginner-english-doodle-cards.skill.zip

Targets:
  codex   ~/.codex/skills (or $CODEX_HOME/skills)
  claude  ~/.claude/skills
  agents  ~/.agents/skills
  grok    ~/.grok/skills
  all     install to all four locations
EOF
}

die() {
  echo "Error: $*" >&2
  exit 1
}

cleanup() {
  if [[ -n "$TEMP_DIR" && -d "$TEMP_DIR" ]]; then
    rm -rf "$TEMP_DIR"
  fi
}
trap cleanup EXIT

target_root() {
  case "$1" in
    codex) echo "${CODEX_HOME:-$HOME/.codex}/skills" ;;
    claude) echo "$HOME/.claude/skills" ;;
    agents) echo "$HOME/.agents/skills" ;;
    grok) echo "$HOME/.grok/skills" ;;
    *) die "unknown target: $1" ;;
  esac
}

add_target() {
  local target="$1"
  if [[ "$target" == "all" ]]; then
    TARGETS=(codex claude agents grok)
    return
  fi
  case "$target" in
    codex|claude|agents|grok) TARGETS+=("$target") ;;
    *) die "unknown target: $target" ;;
  esac
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target)
      [[ $# -ge 2 ]] || die "--target requires a value"
      add_target "$2"
      shift 2
      ;;
    --all)
      add_target all
      shift
      ;;
    --archive)
      [[ $# -ge 2 ]] || die "--archive requires a path or URL"
      ARCHIVE="$2"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      die "unknown option: $1 (use --help for usage)"
      ;;
  esac
done

if [[ ${#TARGETS[@]} -eq 0 ]]; then
  TARGETS=(codex)
fi

if [[ -n "$ARCHIVE" ]]; then
  TEMP_DIR="$(mktemp -d)"
  ZIP_PATH="$TEMP_DIR/skill.zip"
  if [[ "$ARCHIVE" == http://* || "$ARCHIVE" == https://* ]]; then
    command -v curl >/dev/null 2>&1 || die "curl is required to download an archive"
    curl -fsSL "$ARCHIVE" -o "$ZIP_PATH"
  else
    [[ -f "$ARCHIVE" ]] || die "archive not found: $ARCHIVE"
    cp "$ARCHIVE" "$ZIP_PATH"
  fi
  command -v unzip >/dev/null 2>&1 || die "unzip is required for archive installation"
  unzip -q "$ZIP_PATH" -d "$TEMP_DIR/extracted"
  SOURCE_DIR="$(find "$TEMP_DIR/extracted" -type f -name SKILL.md -print -quit | sed 's#/SKILL.md$##')"
else
  SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
fi

[[ -n "$SOURCE_DIR" && -f "$SOURCE_DIR/SKILL.md" ]] || die "could not locate $SKILL_NAME/SKILL.md"

for target in "${TARGETS[@]}"; do
  ROOT="$(target_root "$target")"
  DEST="$ROOT/$SKILL_NAME"
  mkdir -p "$DEST"
  cp -R "$SOURCE_DIR"/. "$DEST"/
  echo "Installed $SKILL_NAME for $target: $DEST"
done

echo "Done. Invoke it with: \$$SKILL_NAME"
