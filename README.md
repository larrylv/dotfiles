# larrylv/dotfiles

These are the config files to set up a machine the way I like it.

## homebrew stuff

```
brew install alacritty autojump automake bash bash-completion bat ccat cloc \
  cmake coreutils cowsay curl diff-so-fancy diffutils fmt fpp gcc git goenv \
  golangci-lint grpc grpcurl htop httperf httpie hugo ijq jq libevent \
  libfaketime libxml2 luajit mtr ncurses nodenv openjdk openjdk@11 openssl@1.1 \
  openssl pre-commit prettier pstree readline reattach-to-user-namespace \
  rsync ruby ruby-build rust scala shellcheck snappy source-highlight sqlite \
  tig tldr tmux tmuxinator-completion trash tree tree-sitter urlview watchman \
  webpack wget yq

brew install --cask diffmerge

# python
brew install pyenv autoenv uv

# ruby
brew install rbenv rubyfmt

# neovim & dependencies
brew install neovim
brew install fd fzf universal-ctags ripgrep
```

## bash

```
# add $HOMEBREW_PREFIX/bin/bash to `/etc/shells`, then
chsh -s $HOMEBREW_PREFIX/bin/bash

# enable sudo without a password
# https://jefftriplett.com/2022/enable-sudo-without-a-password-on-macos/
```

## dotfiles

```
git clone git@github.com:larrylv/dotfiles.git ~/code/dotfiles
cd ~/code/dotfiles
rake install
```

## python stuff

```
pyenv install 3.12.2
pip install --upgrade autopep8 isort ruff pytest

pip install --upgrade pipenv
pip install --upgrade virtualenv
pip install --upgrade pdm
```

## ruby stuff

```
rbenv install 3.3.0
rbenv global 3.3.0

gem install bundler coderay colorize m mocha minitest pry pry-byebug rubocop sorbet sorbet-runtime sorbet-static
```

## neovim, along with its plugins and dependencies

```
pip install --upgrade pynvim neovim

nvim --headless +PlugInstall +UpdateRemotePlugins +qall

gem install ripper-tags

# proximity-sort
cargo install proximity-sort
```

## tmux & plugins

```
gem install tmuxinator
```

Install tmux plugins: https://github.com/tmux-plugins/tpm#installation

## configs

* bash_history
* solarized (for `iTerm` and `Terminal`)
* tmux_resurrect.txt

## other stuff

Install [Monaco Nerd Font](https://github.com/larrylv/monaco-nerd-font/blob/main/Monaco%20Nerd%20Font%20Complete.otf)

```
# fix gitgutter `too many files` error
sudo launchctl limit maxfiles 10240 200000
# or make the change permanent
https://apple.stackexchange.com/questions/381999/how-to-make-sudo-launchctl-limit-change-permanent
```

Interesting open source projects:
```
# go
mkdir -p $HOME/code/gopath
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
