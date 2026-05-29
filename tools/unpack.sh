#!/usr/bin/env bash
set -euo pipefail
REPO="$(cd "$(dirname "$0")/.." && pwd)"
MSAPP="$(ls "$REPO"/*.msapp 2>/dev/null | head -1)"
if [[ -z "$MSAPP" ]]; then
  echo "No .msapp found at repo root" >&2
  exit 1
fi
dotnet /tmp/PowerApps-Tooling/artifacts/bin/PASopa/release/PASopa.dll \
  -unpack "$MSAPP" "$REPO/src"
echo "Unpacked: $MSAPP -> $REPO/src"
