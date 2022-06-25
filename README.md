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
brew install alacritty autojump automake bash bash-completion bat ccat cloc \
  cmake coreutils cowsay curl diff-so-fancy diffutils fmt gcc goenv \
  golangci-lint grpc htop httperf httpie hugo jq mtr ncurses nodenv openjdk \
  pre-commit pstree pyenv rbenv readline reattach-to-user-namespace
  ruby ruby-build scala snappy source-highlight sqlite tig tldr \
  tmuxinator-completion trash tree tree-sitter unrar urlview watchman webpack

brew install --cask diffmerge

gem install tmuxinator

# rust & proximity-sort
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install proximity-sort
```
