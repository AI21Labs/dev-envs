# Development Environment and Experience

A collection of [helper scripts](#helpers) to bootstrap your Mac box for development.
Let's start...

---

**If you find any issue or you feel something is missing, we encourage you to contribute to the project.** For more information, see [contributing](#contributing).

---

## Disclaimer

1. **We do not modify user settings automatically** — to complete the setup, please complete the installation as noted at the first line of each language below
2. **Always start by bootstrapping your machine.** For more information, see [Getting Started](#getting-started)

## Getting Started

1. Clone the repository, **or**

   ```shell
   git clone git@bitbucket.org:ai21labs/dev-envs.git
   ```

2. [Download it as a zip ball](https://bitbucket.org/ai21labs/dev-envs/src/master/), unzip to a directory and change into it (if you are a new on the crew, you probably want this)

   ```shell
   unzip -q -o ai21-dev-envs-*.zip
   cd ai21-dev-envs-*/
   ```

## Bootstrap Your Mac

1. [Kandji](https://www.kandji.io/mdm/start/product/) should have completed bootstrapping your Mac installation with [brew](https://brew.sh/) as described [here](https://ai21labs.atlassian.net/wiki/spaces/engineering/pages/155812007/How+to+Bootstrap+your+Mac+with+Kandji)
   - Verify by running `brew doctor`
   - If you find some packages are missing, feel free to contribute to [infra-mac-bootstrap](https://bitbucket.org/ai21labs/infra-mac-bootstrap/src/master)
2. Our [helper scripts](#helpers) require Bash version 5.1.8 (or higher). By default MacOS comes with Bash version 3.2.x. Refer to [this section](https://itnext.io/upgrading-bash-on-macos-7138bd1066ba) to set Bash version 5.x.x as default

## Generate SSH keys

1. Execute `./helpers/ssh-key-gen.sh`
2. Store the generated SSH keys in your password manager

## GitHub

1. Execute `./helpers/config-github.sh`
2. Authorize [an SSH key for use with SAML single sign-on](https://docs.github.com/en/github/authenticating-to-github/authenticating-with-saml-single-sign-on/authorizing-an-ssh-key-for-use-with-saml-single-sign-on)
3. Use Git to clone and push code changes using [Git protocol](https://git-scm.com/book/en/v2/Git-on-the-Server-The-Protocols); e.g.

   ```shell
   git clone git@github.com:ai21/dev-envs.git
   ```

If you wish to enhance your GitHub experience, see [GitHub Experience](./docs/github-experience.md).

[Git has support for signing your work](https://git-scm.com/book/en/v2/Git-Tools-Signing-Your-Work) to ensure commits come from a trusted source. To sign your work, please follow [Signed Commits guide](docs/signed-commits.md).

## Language and Stack Specifics

We have more specific notes for each language

- [NodeJS / NPM](./docs/nodejs-dev.md)
- [Python / PIP](./docs/python-dev.md)

## Conventional Commits

We strive to be [Commitizen-friendly](https://commitizen-tools.github.io/commitizen/), you are encouraged to use `git cz commit` as an helper for using [conventional commits](https://conventionalcommits.org/)

## Customizations

### Shell

MacOS (Catalina and greater) uses [ZSH](https://en.wikipedia.org/wiki/Z_shell) as the default and it's a great default. If you're not a shell person, just use it.

- If you want to read on why we use ZSH read [The Battle of Shell](./docs/shell-battle.md#the-great-shell-battle)
- If you want your shell to be awesome read [Pimp My shell](./docs/pimp-my-shell.md#pimp-my-shell)

Please avoid using [fish](https://fishshell.com/), as most of our scripts are written for [Bash](https://www.gnu.org/software/bash/).

#### Bash

To verify the [brewed Bash](https://github.com/present-smple/dev-envs/blob/main/helpers/.Brewfile#L8) is working for you, the following commands should return the same output

```shell
realpath $(brew --prefix bash)/bin/bash
realpath $(which bash)
```

If you wish to set Bash as the default shell, follow [this guide](https://www.howtogeek.com/444596/how-to-change-the-default-shell-to-bash-in-macos-catalina/).

### Integrated Development Environments (IDEs)

We recommend using [Visual Studio Code](https://code.visualstudio.com/) (VSCode), which should be installed for you if [bootstrapped your mac](#bootstrap-your-mac).

If you wish to enhance your VSCode experience, see [VSCode Experience](./docs/vscode-experience.md).

## Helpers

This is what the helpers do:

- `config-github.sh` configures Github SSH
- `ssh-key-gen.sh` generates SSH key-pair
- `vscode-exts.sh` installs [recommended VSCode extensions](./docs/vscode-experience.md#extensions)
- `vscode-ligatures.sh` installs [programming ligatures for VSCode](./docs/vscode-experience.md#programming-ligatures)

Some helpers have parameters for more streamlined work; use the `--help`. e.g.

```shell
$ ./helpers/vscode-exts.sh --help
vscode-exts.sh OPTIONS

OPTIONS:
  [-r|--region <region>]     default: us-east-1
  [-a|--auto]                use default values
```

```shell
./helpers/vscode-exts.sh
```

## Contribute

1. Run validation by leveraging [pre-commit](https://pre-commit.com)
   1. Install `pre-commit install --install-hooks -t pre-commit -t commit-msg`
   2. To run on-demand `pre-commit run -a`
      - `pre-commit run shellcheck -a --verbose --hook-stage manual` for recommendation
2. Submit a pull-request
