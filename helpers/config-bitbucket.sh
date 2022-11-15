#!/usr/bin/env bash

set -u -e -o pipefail

CWD=$(dirname "$0")
pushd "$CWD" >/dev/null

SSH_TEST=$(ssh -T git@bitbucket.org 2>&1 || true)
if ! echo "$SSH_TEST" | grep -q "authenticated via ssh key"; then
  ./ssh-key-gen.sh
  ssh-add ~/.ssh/id_rsa
fi

popd >/dev/null
