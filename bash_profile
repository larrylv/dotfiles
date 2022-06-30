# vim: set ft=sh :

if [ -f /etc/profile ] && [ "$(uname)" == "Darwin" ]; then
  PATH=""
  source /etc/profile
fi

[[ -s $HOME/.bashrc ]] && source $HOME/.bashrc

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# START - Managed by chef cookbook stripe_cpe_bin
alias tc='/usr/local/stripe/bin/test_cookbook'
alias cz='/usr/local/stripe/bin/chef-zero'
alias cookit='tc && cz'
# STOP - Managed by chef cookbook stripe_cpe_bin
