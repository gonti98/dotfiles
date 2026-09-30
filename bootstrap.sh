#!/usr/bin/env bash
set -euo pipefail

missing_packages=()
wanted_packages=(
  "age"
  "bitwarden-cli"
  "chezmoi"
)

if [[ ! -f /etc/arch-release ]]; then
  echo "Unsupported distribution" >&2
  exit 1
fi

for package in "${wanted_packages[@]}"; do
  if ! command -v "${package}" >/dev/null; then
    missing_packages+=("${package}")
  fi
done

if [[ ${#missing_packages[@]} -eq 0 ]]; then
  return 0
else
  sudo pacman --sync --refresh --sysupgrade --needed --noconfirm -- "${missing_packages[@]}"
fi

chezmoi init --apply gonti98
