#!/usr/bin/env bash

set -u -e -o pipefail

CWD=$(dirname "$0")
pushd "$CWD" >/dev/null

if [ ! -f ~/.ssh/id_rsa ]; then
  CMT=$(date "+${USER}@ai21.com @ %Y-%m-%d %H:%M:%S")
  ssh-keygen -t rsa -b 16384 -C "${CMT}" -f ~/.ssh/id_rsa
fi

popd >/dev/null
