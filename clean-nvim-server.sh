#!/usr/bin/env bash
# Description: Clean neovim files to start a fresh installation

set -euo pipefail

rm -rf ~/.local/share/nvim-server
rm -rf ~/.local/state/nvim-server
rm -rf ~/.cache/nvim-server
