#!/usr/bin/env bash

set -e -o pipefail

CWD=$(dirname "$0")
pushd "$CWD" >/dev/null

xcode-select --install || true
brew bundle --file .Brewfile

if [ "$(uname -p)" == "arm" ]; then
  softwareupdate --install-rosetta --agree-to-license
fi

open -a Docker.app

popd >/dev/null
