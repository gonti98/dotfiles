#!/usr/bin/env bash
set -euo pipefail

readonly REQUIRED_PACKAGES=(
  age
  bitwarden-cli
  chezmoi
)

if [[ ! -f /etc/arch-release ]]; then
  printf '\n--- Unsupported distribution: Arch Linux is required ---\n' >&2
  exit 1
fi

if ((EUID == 0)); then
  printf '\n--- Do not run this script as root ---\n' >&2
  exit 1
fi

missing_packages=()

for package in "${REQUIRED_PACKAGES[@]}"; do
  if ! pacman --query "$package" &>/dev/null; then
    missing_packages+=("$package")
  fi
done

if ((${#missing_packages[@]})); then
  sudo pacman \
    --sync \
    --refresh \
    --sysupgrade \
    --needed \
    --noconfirm \
    "${missing_packages[@]}"
fi

exec chezmoi init --apply gonti98
