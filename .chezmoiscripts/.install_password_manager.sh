#!/usr/bin/env bash
set -euo pipefail

BIN_DIR="${HOME}/.local/bin"
BIN="${BIN_DIR}/bw"

if command -v bw >/dev/null 2>&1; then
  exit 0
fi

if [[ -x "$BIN" ]]; then
  exit 0
fi

mkdir -p "$BIN_DIR"

tmpdir="$(mktemp -d)"
trap 'rm -rf "$tmpdir"' EXIT

curl -fL \
  'https://bitwarden.com/download/?app=cli&platform=linux' \
  -o "$tmpdir/bw.zip"

unzip -q "$tmpdir/bw.zip" -d "$tmpdir"

install -m 0755 "$tmpdir/bw" "$BIN"
