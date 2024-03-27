# vim: set ft=sh :

if [ -f /etc/profile ] && [ "$(uname)" == "Darwin" ]; then
  PATH=""
  source /etc/profile
fi

[[ -s "$HOME/.bash_profile.local" ]] && source "$HOME/.bash_profile.local"
[[ -s $HOME/.bashrc ]] && source $HOME/.bashrc
