#!/usr/bin/env bash
set -euo pipefail

# Clean Hugo build artifacts and cache for a full rebuild.
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

rm -rf "${ROOT_DIR}/public" \
  "${ROOT_DIR}/resources/_gen" \
  "${ROOT_DIR}/.hugo_build.lock"

# Default Hugo cache dir (can be overridden via cacheDir in config).
rm -rf "${HOME}/.cache/hugo"

echo "Hugo cache and build artifacts removed."

hugo server --disableFastRender --ignoreCache --cleanDestinationDir