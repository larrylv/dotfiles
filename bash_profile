if [ -f /etc/profile ] && [ "$(uname)" == "Darwin" ]; then
  PATH=""
  source /etc/profile
fi

[[ -s $HOME/.bashrc ]] && source $HOME/.bashrc

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
