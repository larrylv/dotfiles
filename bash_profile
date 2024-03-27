# vim: set ft=sh :

if [ -f /etc/profile ] && [ "$(uname)" == "Darwin" ]; then
  PATH=""
  source /etc/profile
fi

export GPG_TTY=$(tty)
[[ -s $HOME/.bashrc ]] && source $HOME/.bashrc
[[ -s "$HOME/.bash_profile.local" ]] && source "$HOME/.bash_profile.local"
