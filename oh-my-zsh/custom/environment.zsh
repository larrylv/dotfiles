# zsh
unsetopt correct_all

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=HISTSIZE

[[ -s "/opt/local/bin" ]] && export PATH=/opt/local/bin:$PATH
[[ -s "/usr/local/bin" ]] && export PATH=/usr/local/bin:$PATH

export EDITOR=vim

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
