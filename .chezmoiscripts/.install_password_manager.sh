#!/usr/bin/env bash
set -euo pipefail

BIN_DIR="${HOME}/.local/bin"
BIN="${BIN_DIR}/bw"
BW_URL="https://bitwarden.com/download/?app=cli&platform=linux"

if command -v bw >/dev/null 2>&1; then
  exit 0
fi

if [[ -x "$BIN" ]]; then
  exit 0
fi

mkdir --parents "$BIN_DIR"

tmpdir="$(mktemp --directory)"
trap 'rm --recursive --force "$tmpdir"' EXIT

curl --fail --location \
  "$BW_URL" \
  --output "$tmpdir/bw.zip"

unzip -q "$tmpdir/bw.zip" -d "$tmpdir"

install --mode=0755 "$tmpdir/bw" "$BIN"
