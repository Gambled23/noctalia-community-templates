#!/usr/bin/env bash
set -euo pipefail

cfg="${XDG_CONFIG_HOME:-$HOME/.config}/Tachibana Labs"
src="$cfg/theme.conf"
dst="$cfg/ACCELA.conf"

for k in accent_color background_color user_accent_color user_background_color; do
    v=$(grep "^$k=" "$src" | cut -d= -f2-)
    if [ -n "$v" ]; then
        sed -i "s|^$k=.*|$k=$v|" "$dst"
    fi
done

rm "$src"