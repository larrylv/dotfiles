# larrylv/dotfiles

These are the config files to set up a machine the way I like it.

## dotfiles

```
git clone git@github.com:larrylv/dotfiles.git ~/code/dotfiles
cd ~/code/dotfiles
mkdir -p ~/.config/nvim
rake install
```

## homebrew & packages

```
# https://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# packages are managed by `Brewfile`
brew bundle install --no-lock --verbose

# install missing packages only
brew bundle install --no-upgrade --no-lock --verbose
```

## python stuff

```
pyenv install 3.12.2
pyenv global 3.12.2

pip install --upgrade autopep8 isort ruff pytest pipenv virtualenv pdm
```

## ruby stuff

```
rbenv install 3.3.0
rbenv global 3.3.0

gem install bundler coderay colorize m mocha minitest pry pry-byebug ripper-tags rubocop sorbet sorbet-runtime sorbet-static
```

## neovim, along with its plugins and dependencies

```
pip install --upgrade pynvim neovim

nvim --headless +PlugInstall +UpdateRemotePlugins +qall

cargo install proximity-sort
```

## tmux & plugins

```
gem install tmuxinator
```

Install tmux plugins: https://github.com/tmux-plugins/tpm#installation

```
cp $TMUX_RESURRECT_BACKUP ~/.tmux/resurrect/tmux_resurrect_backup.txt
ln -s ~/.tmux/resurrect/last ~/.tmux/resurrect/tmux_resurrect_backup.txt
```

## bash

```
# add $HOMEBREW_PREFIX/bin/bash to `/etc/shells`, then
chsh -s $HOMEBREW_PREFIX/bin/bash

# enable sudo without a password
# https://jefftriplett.com/2022/enable-sudo-without-a-password-on-macos/

# make sure that the existing ~/.bash_history doesn't have anything you wanna keep
cp $BASH_HISTORY_BACKUP ~/.bash_history
```

## other stuff

* Install [Monaco Nerd Font](https://github.com/larrylv/monaco-nerd-font/blob/main/Monaco%20Nerd%20Font%20Complete.otf).
* Install `solarized` for `iTerm` and `Terminal`.

random stuff:
```
mkdir -p $HOME/code/gopath
mkdir -p ~/.local/bin

# fix gitgutter `too many files` error
sudo launchctl limit maxfiles 10240 200000
# or make the change permanent
https://apple.stackexchange.com/questions/381999/how-to-make-sudo-launchctl-limit-change-permanent
```

Interesting open source projects:
```
# solarized
git clone git@github.com:altercation/solarized.git ~/code/solarized

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
