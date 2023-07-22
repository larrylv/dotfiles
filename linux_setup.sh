#! /bin/bash

set -exuo pipefail

HOME_BIN_DIR="${HOME}/.local/bin"

mkdir -p "${HOME_BIN_DIR}"

echo "Hey larrylv! Starting dotfiles setup."

echo "Installing neovim"
CUSTOM_NVIM_PATH=${HOME_BIN_DIR}/nvim
wget -O $CUSTOM_NVIM_PATH https://github.com/neovim/neovim/releases/download/v0.9.1/nvim.appimage &&
  chmod +x $CUSTOM_NVIM_PATH

echo "Setting up larrylv/dotfiles"
mkdir -p ~/.config/nvim
mkdir ~/code
git clone https://github.com/larrylv/dotfiles.git ~/code/dotfiles
pushd ~/code/dotfiles
rake SKIP_EXISTING=true install
popd

echo "Installing nvim plugins"
"${HOME}"/.local/bin/nvim --headless +PlugInstall +qall
echo "Setting up company specific vim configs"
mkdir -p "${HOME}"/.config/nvim/layers/private
ln -s nvim/layers/private/config.vim "${HOME}"/.config/nvim/layers/private/config.vim

# echo "LSP setup for coc.nvim"
# REPO_PATH="/pay/src/REPO_PATH"
# mkdir -p "${REPO_PATH}"/.vim
# ln -s customized-vim-coc-settings.json "${REPO_PATH}"/.vim/coc-settings.json

echo "Installing tmux and tmuxinator"
# install tmux
CUSTOM_TMUX_PATH=${HOME_BIN_DIR}/tmux
if $(tmux -V | grep --quiet '3.2a'); then
  echo "tmux v3.2a already installed, skipping install"
else
  wget -O $CUSTOM_TMUX_PATH https://github.com/nelsonenzo/tmux-appimage/releases/download/3.2a/tmux.appimage &&
    chmod +x $CUSTOM_TMUX_PATH &
fi
# install tmuxinator
wget -O ~/.local/xdg-2.2.5.gem https://rubygems.org/downloads/xdg-2.2.5.gem
sudo gem install ~/.local/xdg-2.2.5.gem
wget -O ~/.local/tmuxinator-3.0.5.gem https://rubygems.org/downloads/tmuxinator-3.0.5.gem
sudo gem install ~/.local/tmuxinator-3.0.5.gem
sudo rbenv rehash

echo "Installing other softwares and stripe-specific dotfiles"
# setup fd
if [ -L /usr/local/bin/fd ]; then
  echo "fd already symlinked, skipping"
else
  sudo ln -s $(which fdfind) /usr/local/bin/fd
fi
# setup fzf
if [ -f ~/.local/bin/fzf ]; then
  echo "fzf already installed"
else
  mkdir -p ~/.scripts
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.scripts/fzf
  ~/.scripts/fzf/install --completion --key-bindings --no-update-rc --xdg --no-zsh --no-fish
  ln -s ~/.scripts/fzf/bin/fzf ~/.local/bin/fzf
fi
# install non-ancient version of ripgrep
wget https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb &&
  sudo dpkg -i ripgrep_13.0.0_amd64.deb &
# linking stripe-specific dotfiles
rake install
# setup proximity-sort
unzip "${REPO_PATH}"/devbox/dotfiles/larrylv/proximity-sort.zip -d "${HOME_BIN_DIR}"

wait

echo "👋 done!"
