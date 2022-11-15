#!/usr/bin/env bash

set -u -e -o pipefail

# download fira-code latest release and extract to user's font dir
LATEST_RELEASE=$(curl -Ls https://api.github.com/repos/tonsky/FiraCode/releases/latest | jq -r '.assets[0].browser_download_url')
TMP_DIR=$(mktemp -d)
pushd "$TMP_DIR" &>/dev/null
curl -Ls "$LATEST_RELEASE" | tar x
find . -type f -name '*.ttf' -exec cp {} ~/Library/Fonts/ \;

# backup vscode user's settings file
SETTINGS_FILE="$HOME/Library/Application Support/Code/User/settings.json"
TIMESTAMP=$(date +%Y-%m-%dT%H:%M:%S%z)
cp "$SETTINGS_FILE" "${SETTINGS_FILE}.${TIMESTAMP}"

# patch vscode user's settings file
TMP_FILE="${TMP_DIR}/settings.json"
grep -vE "(//|/\*| \*)" "$SETTINGS_FILE" | tr -d '[:space:]' | sed 's/,}$/}/g' | jq -r '. += { "editor.fontFamily": "FiraCode-Retina", "editor.fontLigatures": true }' >>"$TMP_FILE"
cp "$TMP_FILE" "$SETTINGS_FILE"
