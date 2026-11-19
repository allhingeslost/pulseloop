#!/bin/bash
set -e

sudo mount --make-rshared / || true

mkdir -p ~/.config/opencode ~/.local/share/opencode ~/.config/gh

if [ -f /tmp/host-sync/.gitconfig ]; then
    cp /tmp/host-sync/.gitconfig ~/.gitconfig
fi

if [ -d /tmp/host-sync/gh ]; then
    cp -rf /tmp/host-sync/gh/* ~/.config/gh/ 2>/dev/null || true
fi

if [ -f /tmp/host-sync/opencode/opencode.json ]; then
    cp /tmp/host-sync/opencode/opencode.json ~/.config/opencode/opencode.json
fi

if [ -f /tmp/host-sync/opencode-share/auth.json ]; then
    cp /tmp/host-sync/opencode-share/auth.json ~/.local/share/opencode/auth.json
fi

echo "DevBox Configs Synced & Ready!"
