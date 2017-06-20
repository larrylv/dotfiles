if [ -f /etc/profile ] && [ "$(uname)" == "Darwin" ]; then
  PATH=""
  source /etc/profile
fi

[[ -s $HOME/.bashrc ]] && source $HOME/.bashrc
