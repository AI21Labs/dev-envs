#!/usr/bin/env bash

set -u -e -o pipefail

CWD=$(dirname "$0")
pushd "$CWD" >/dev/null

if ! gh auth status; then
  gh auth login --web
fi

SSH_TEST=$(ssh -T git@github.com 2>&1 || true)
if ! echo "$SSH_TEST" | grep -q "successfully authenticated"; then
  gh auth refresh -s write:public_key
  ./ssh-key-gen.sh
  gh ssh-key add ~/.ssh/id_rsa.pub
fi

popd >/dev/null
