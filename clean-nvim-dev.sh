#!/usr/bin/env bash
# Description: Clean neovim files to start a fresh installation

set -euo pipefail

rm -rf ~/.local/share/nvim-minimal
rm -rf ~/.local/state/nvim-minimal
rm -rf ~/.cache/nvim-minimal
