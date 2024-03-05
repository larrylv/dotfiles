# Larry Lv Dot Files

These are the config files to set up a machine the way I like it.

## Installation

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

### font

* [Monaco Nerd Font](https://github.com/larrylv/monaco-nerd-font/blob/main/Monaco%20Nerd%20Font%20Complete.otf)

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

* pipenv 101
  * `pipenv install requests`
  * To activate this project's virtualenv, run `pipenv shell`.
  * Alternatively, run a command inside the virtualenv with `pipenv run`.

* virtualenv 101
  * `python -m venv .venv`
  * `source .venv/bin/activate`
  * `pip install -r requirements.txt`

* autoenv 101
  * `.env` example
```
[[ -f .venv/bin/activate ]] && source .venv/bin/activate
```
  * `.env.leave` example
```
deactivate
```

### ruby stuff

```
brew install rbenv
rbenv install 3.3.0
rbenv global 3.3.0

brew install rubyfmt
gem install bundler coderay colorize m mocha minitest pry pry-byebug rubocop sorbet sorbet-runtime sorbet-static
```

### vim plugins and dependencies

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
