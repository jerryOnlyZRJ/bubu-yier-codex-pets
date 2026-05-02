#!/usr/bin/env bash
set -euo pipefail

# Resolve the repository root from this script location so the installer works
# whether it is called from the repository root or another directory.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

# Codex discovers custom pets from ~/.codex/pets/<pet-id>/pet.json.
TARGET_DIR="${HOME}/.codex/pets"
mkdir -p "${TARGET_DIR}"

# Copy only the installable pet packages, not generation intermediates.
cp -R "${REPO_ROOT}/pets/bubu" "${TARGET_DIR}/"
cp -R "${REPO_ROOT}/pets/yier" "${TARGET_DIR}/"

echo "Installed bubu and yier into ${TARGET_DIR}"
echo "Restart Codex Desktop or reopen the pet selector to use them."
