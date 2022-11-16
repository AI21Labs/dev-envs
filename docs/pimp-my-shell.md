# Pimp My Shell

Making your shell work and look great is not just for fun. You can easily turn your shell from a simple prompt into an interactive shell that will assist you and make your life a lot easier.

This guide will focus on ZSH but Bash can be partially customized as well although it's out of scope for this document.

## The Basics

### Terminal

A terminal application hosts your shell and lets it run. The terminal affects how you manage shells in tabs, windows, or panes.
Mac OS comes with a very nice terminal app but [iTerm2](https://iterm2.com/index.html) is better in every single way with a lot of little quality of life enhancements with no downsides. And if you followed this guide it's already installed.
Customizing iTerm2 is a pretty deep rabbit hole but feel free to experiment.

### Fonts

The default font is o.k. but in order to make you prompt shine you need a "nerd" font that contains a lot of additional emojis such as git statuses and the various frameworks.

There are many [Nerd Fonts](https://www.nerdfonts.com/font-downloads) available but if you don't want to mess with it `meslo` is a good choice and just run

```shell
brew tap homebrew/cask-fonts && brew install --cask font-meslo-lg-nerd-font
```

If you like a different font just replace `meslo-lg` with you choice.

#### Use The Font

Open `iterm2` and go to preference by pressing `command+,`
Navigate to profiles --> Text and choose the font you installed.

### Starship

[Starship](https://starship.rs/) will give your prompt super powers.
By default it will show you what branch you're on, your commit status and what run times are used in the location (node, ruby, java, etc.).  It will also show you how long each command took.   If you're willing to work for it, there are many more customization options so feel free to dive in.

### Oh My ZSH

Because ZSH is so extensible [Oh My ZSH](https://ohmyz.sh/) will configuring it easier and work better. Just installing it will already make positive changes but in reality you definitely want to tweak it. Oh My ZSH is broken down into two big parts: `themes` and `plugins` which will be discussed below.

#### Oh My ZSH Installation

run the below and you're done.

```shell
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### Themes

Themes make your terminal look like you want it to. The default is decent and non offensive.

If you want something flashier browse the [themes](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)

Note that these are just the included themes and there are many many more available but you'll have to google them.

##### Installing a theme

to install a theme open `~/.zshrc` and find the
`ZSH_THEME=robbyrussel`
line.  Replace the theme with the name you like and restart your terminal.

##### Powerlevel10k

If you REALLY want to have the most powerful prompt ever and infinite customizability you should check out [PowerLevel10K](https://github.com/romkatv/powerlevel10k).
If you go the Powerlevel10K route, do not install starship as they do the same thing.
And be prepared to work a bit to get it to look like you want it to. Although the defaults are really great.

#### Plugins

The plugins is where Oh My ZSH really shines. Plugins can add a ton of functionality and make using the shell a join.

##### Installing a Plugin

Installing a Oh My ZSH plugin is usually a two step process

1. Clone the plugin repository into the oh my zsh plugin folder
1. enable the plugin in the `~/.zshrc` file.

ZSH has to load all of the plugins you chose and they all react to everything so you really don't want to go overboard. In general, ZSH can handle 10's of plugins with no performance issues but if it feels slow disable some plugins and see which one is killing you.

##### Basic Plugins

The only built-in plugin in My Oh ZSH is `git` and it's hard to give general recommendations. However, there are two plugins that will propel ZSH to the next level.

* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) - will offer completion of common commands and commands from your history which means you'll eventually just type the beginning of common commands.
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) - Will highlight the commands. Specifically commands will turn green if they're valid and red if they're not making it easy to know you got it right.

Installing these two extensions (and optionally the `fishy` theme) will give you an almost identical experience to the fish shell.

###### Plugins Installation

Clone the two plugins:

```shell
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```

Open `~/.zshrc` and find `plugins=(git)` and replace with `plugins=(git zsh-autosuggestions zsh-syntax-highlighting)`

The parentheses are a weird Bash array syntax. Just make sure the plugins are separated by a space and are enclosed in parentheses with no leading or trailing spaces.

##### Additional Plugins

The [plugin ecosystem](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins) is vast. Most are specific for your workload such as `docker` `ruby` `rails` `node` `python` etc. and will provide you with awesome autocomplete powers.

Others are more generic and here are some that can be useful:

* [Z](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/z) - Will continuously track what folders you go into and will quickly be smart enough to take you there so you could replace `cd my/very/long/and/annoying/path/` to `z path`.
* [The Fuck](https://github.com/nvbn/thefuck) - This is bit more complex but it will let you just type `fuck` when you made a stupid spelling mistake and have the command be corrected automatically!
Pure magic! and you can alias the command if it's hard on your pure soul. The Oh My ZSH plugin will let you press `ESC` twice to save even more time.

## Advanced

### Aliases

Aliases are shortcuts to commands. Defining an alias is really simple - the command is `alias` and you give it a name and the command with an `=` sign in between for example:

```shell
alias gitp='git pull'
```

will run `git pull` every time you type `gitp`. But you're not limited to a single command for example

```shell
alias buildproj='cd ~/proj && npm build
```

will cd to the project and build it in a single command.

#### Persisting Aliases

An alias is only valid for the current session. To make your aliases always available add the command as it is in a new line at the end of your `~/.zshrc` line.

### Multiplexing

Shell multiplexing is running a lot of shells together. There are four ways to multiplex:

* window - Just open new windows of your terminal.
* tabs - the default in `terminal` and `iterm` will open a new tab for each shell
* panes - `iterm` allows you to open "panes" which are sub windows that allow you to track multiple running commands at once.
* shell multiplexing - the likes of [tmux](https://github.com/tmux/tmux/wiki) which will let you run multiplexing within the shell.
  The most advanced form of multiplexing which has a stiff learning curve but highest productivity.  Another advantage of `tmux` is that it can ran everywhere including over ssh.
  But it's not for the faint of heart.

#### itermocil

[itermocil](https://github.com/TomAnthony/itermocil) let's you predefine your multiplex and get back to it with no work. It will let you predefine pane location, size and even run a command on opening the pane. `itermocil` requires `iterm2`.

tmux will do that and more but requires more effort.
