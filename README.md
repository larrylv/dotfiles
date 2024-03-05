# Larry Lv Dot Files

These are the config files to set up a machine the way I like it.

## Installation

### Alacritty

```
brew install alacritty
```

### bash

```
brew install bash

# add $HOMEBREW_PREFIX/bin/bash to `/etc/shells`, then
chsh -s $HOMEBREW_PREFIX/bin/bash

# enable sudo without a password
# https://jefftriplett.com/2022/enable-sudo-without-a-password-on-macos/
```

### dotfiles

```
git clone git://github.com/larrylv/dotfiles.git ~/code/dotfiles
cd ~/code/dotfiles
rake install
```

### python stuff

```
brew install pyenv
pyenv install 3.12.2
pip install --upgrade autopep8 isort ruff pytest

pip install --upgrade pipenv
pip install --upgrade virtualenv
pip install --upgrade pdm

brew install autoenv

brew install uv
```

### ruby stuff

```
brew install rbenv
rbenv install 3.3.0
rbenv global 3.3.0

brew install rubyfmt
gem install bundler coderay colorize m mocha minitest pry pry-byebug rubocop sorbet sorbet-runtime sorbet-static
```

### neovim, along with its plugins and dependencies

```
pip install --upgrade pynvim neovim

brew install neovim

nvim --headless +PlugInstall +UpdateRemotePlugins +qall

gem install ripper-tags
brew install fd fzf universal-ctags ripgrep rust

# proximity-sort
cargo install proximity-sort
```

### tmux & plugins

```
brew install tmux

gem install tmuxinator
```

https://github.com/tmux-plugins/tpm#installation

### other stuff

Install [Monaco Nerd Font](https://github.com/larrylv/monaco-nerd-font/blob/main/Monaco%20Nerd%20Font%20Complete.otf)

```
brew install autojump automake bash-completion bat ccat cloc \
  cmake coreutils cowsay curl diff-so-fancy diffutils fmt fpp gcc goenv \
  golangci-lint grpc htop httperf httpie hugo ijq jq mtr ncurses nodenv openjdk\
  openjdk@11 pre-commit pstree readline reattach-to-user-namespace \
  ruby ruby-build rust scala snappy source-highlight sqlite tig tldr \
  tmuxinator-completion trash tree tree-sitter urlview watchman webpack

brew install --cask diffmerge

mkdir -p $HOME/code/gopath

# fix gitgutter `too many files` error
sudo launchctl limit maxfiles 10240 200000
# or make the change permanent
https://apple.stackexchange.com/questions/381999/how-to-make-sudo-launchctl-limit-change-permanent
```

Interesting open source projects:
```
# go
git clone git@github.com:nadoo/glider.git ~/code/gopath/src/github.com/nadoo/glider
git clone git@github.com:panjf2000/gnet.git ~/code/gopath/src/github.com/panjf2000/gnet
git clone git@github.com:rqlite/rqlite.git ~/code/gopath/src/github.com/rqlite/rqlite

# python
git clone git@github.com:agronholm/anyio.git ~/code/anyio
git clone git@github.com:tiangolo/fastapi.git ~/code/fastapi
git clone git@github.com:pydantic/pydantic.git ~/code/pydantic
git clone git@github.com:tiangolo/sqlmodel.git ~/code/sqlmodel
git clone git@github.com:encode/starlette.git ~/code/starlette
```
