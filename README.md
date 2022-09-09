# Larry Lv Dot Files

These are the config files to set up a machine the way I like it.

## Installation

```
git clone git://github.com/larrylv/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
rake install
```
### font

[Monaco Nerd Font](https://github.com/larrylv/monaco-nerd-font)

### vim plugins & dependencies

```
brew install neovim
nvim +PlugInstall +qall

gem install ripper-tags
brew install fd fzf universal-ctags ripgrep
```

### tmux & plugins

```
brew install tmux
```

https://github.com/tmux-plugins/tpm#installation

### other stuff

```
brew install autojump automake bash bash-completion bat ccat cloc \
  cmake coreutils cowsay curl diff-so-fancy diffutils fmt gcc goenv \
  golangci-lint grpc htop httperf httpie hugo jq mtr ncurses nodenv openjdk \
  openjdk@11 pre-commit pstree pyenv rbenv readline reattach-to-user-namespace \
  ruby ruby-build rust scala snappy source-highlight sqlite tig tldr \
  tmuxinator-completion trash tree tree-sitter urlview watchman webpack

brew install --cask alacritty diffmerge

gem install tmuxinator

# proximity-sort
cargo install proximity-sort

# add $HOMEBREW_PREFIX/bin/bash to `/etc/shells`, then
chsh -s $HOMEBREW_PREFIX/bin/bash

# enable sudo without a password
# https://jefftriplett.com/2022/enable-sudo-without-a-password-on-macos/
```
