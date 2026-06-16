#!/usr/bin/env bash
set -euo pipefail

TARGET_REPO_DIR="${1:-}"

if [ -z "$TARGET_REPO_DIR" ]; then
  echo "Usage: ./scripts/install-to-existing-repo.sh /path/to/your/repo"
  exit 1
fi

if [ ! -d "$TARGET_REPO_DIR" ]; then
  echo "Target repo directory does not exist: $TARGET_REPO_DIR"
  exit 1
fi

mkdir -p "$TARGET_REPO_DIR/.agents/skills/bvshop-elfsight-v1"
mkdir -p "$TARGET_REPO_DIR/docs/bvshop-elfsight-v1"
mkdir -p "$TARGET_REPO_DIR/examples"
mkdir -p "$TARGET_REPO_DIR/codex-prompts"

cp -f "AGENTS.md" "$TARGET_REPO_DIR/AGENTS.md"
cp -f ".agents/skills/bvshop-elfsight-v1/SKILL.md" "$TARGET_REPO_DIR/.agents/skills/bvshop-elfsight-v1/SKILL.md"
cp -f docs/bvshop-elfsight-v1/* "$TARGET_REPO_DIR/docs/bvshop-elfsight-v1/"
cp -f examples/* "$TARGET_REPO_DIR/examples/"
cp -f codex-prompts/* "$TARGET_REPO_DIR/codex-prompts/"

echo "Installed BVSHOP × Elfsight V1 Codex files into: $TARGET_REPO_DIR"
echo "Next: git add AGENTS.md .agents docs examples codex-prompts && git commit -m 'Add BVSHOP Elfsight Codex skill'"
