# The Great Shell Battle

## TLDR

If you don't want to go into this, use a POSIX compliant shell. Use the default ZSH.

## contenders

There are four common shells in the *nix world:

* Bourne Shell (sh) - The original with many variations (Korn, dash, etc).  They are not really the same but they form the basis for all shells in *nix.
* Bourne Again Shell (bash) - The 800 pound gorilla that is probably most known.  Was designed to solve many shortcomings with sh and is the one used the most.
* Z Shell (zsh) - a shell that attempted to make bash more interactive and friendly without breaking POSIX compatibility.
* Fish Shell - a modern shell that took a clean slate approach rewriting everything to make it easier to use.

If the world was just, Fish would've won easily.  But the world is not just and we humans tend to stick to what everybody uses above everything else. and you should too.

### Posix compatiblity

When *nix started to fragment they defined a standard called [POSIX](https://en.wikipedia.org/wiki/POSIX) that defines a common base of functionality.  Fish is the only non-posix compliant shell which means many scripts you will try to run off the internet will just not work.
Internally we strive to write POSIX compatible scripts in Bash to make sure you can run the scripts without issue.

## Choosing a shell

### sh

You really shouldn't use `sh` as your shell.  `sh` was written a long time ago when resources were limited and is a relatively bad experience.
In fact, in most distros `sh` is just an alias to `ksh` or `dash` or `bash`.

### bash

Bash is a good choice.  It will do everything you need.  the problem with bash is that it will provide a subpar experience as it's hard to make the experience better.

### zsh

zsh is the default shell in MacOS. It was done because of licensing issues but it's still a great choice.
ZSH let's you enjoy the best of all worlds. It has great compatibility and with a little work it will give you a great experience.
learn how to [pimp your shell](./pimp-my-shell.md#pimp-my-shell)

If you want to use zsh you're already set.

### Fish

Fish will give you the best experience out of the box. It's a really great shell.
The problem with Fish is that because it's not concerned about compatibility many of the scripts you'll need to run internally or off the internet may not work.
You can make ZSH have all the awesomeness of fish with less downsides. See how to [pimp your shell](pimp-my-shell)
Fish doesn't come built-in and has to be installed. If you want to use it head over to the [Fish Site](https://fishshell.com/) and knock yourself out.
