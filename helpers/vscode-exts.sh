#!/usr/bin/env bash

set -e -o pipefail

CWD=$(dirname "$0")
pushd "$CWD" >/dev/null

EXTENSIONS=(
  aaron-bond.better-comments
  bungcip.better-toml
  castwide.ruby-debug
  castwide.solargraph
  christian-kohler.npm-intellisense
  christian-kohler.path-intellisense
  chrmarti.regex
  CoenraadS.bracket-pair-colorizer-2
  DotJoshJohnson.xml
  eamodio.gitlens
  firefox-devtools.vscode-firefox-debug
  formulahendry.auto-close-tag
  formulahendry.auto-rename-tag
  gimenete.github-linker
  GitHub.github-vscode-theme
  GitHub.remotehub
  GitHub.vscode-pull-request-github
  hashicorp.terraform
  jgclark.vscode-todo-highlight
  joaompinto.vscode-graphviz
  kaiwood.endwise
  ms-azuretools.vscode-docker
  ms-kubernetes-tools.vscode-kubernetes-tools
  ms-python.python
  ms-python.vscode-pylance
  ms-vscode-remote.remote-containers
  msjsdiag.debugger-for-chrome
  naumovs.color-highlight
  nhoizey.gremlins
  nidu.copy-json-path
  PKief.material-icon-theme
  rebornix.ruby
  redhat.java
  redhat.vscode-commons
  redhat.vscode-xml
  redhat.vscode-yaml
  ritwickdey.LiveServer
  rust-lang.rust
  shd101wyy.markdown-preview-enhanced
  streetsidesoftware.code-spell-checker
  VisualStudioExptTeam.vscodeintellicode
  vscjava.vscode-java-debug
  vscjava.vscode-java-dependency
  vscjava.vscode-java-pack
  vscjava.vscode-java-test
  vscjava.vscode-maven
  wingrunr21.vscode-ruby
)

for EXTENSION in "${EXTENSIONS[@]}"; do
  code --force --install-extension "$EXTENSION"
done

popd >/dev/null
