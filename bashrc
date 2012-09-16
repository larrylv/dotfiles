[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.

alias ls='ls --color'
# for Mac: alias ls='ls -G'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias rm='trash'
alias tigs='tig status'

if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

# set completion-ignore-case On # this won't work on OS X 10.7
bind 'set completion-ignore-case On' # this works fine
# single tab press to show a list
set show-all-if-ambiguous on
# Completion applied similar insensitivity between hyphens and underscores
set completion-map-case on

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function proml {
    local BLUE="\[\033[0;34m\]"
    local RED="\[\033[0;31m\]"
    local LIGHT_RED="\[\033[1;31m\]"
    local GREEN="\[\033[0;32m\]"
    local LIGHT_GREEN="\[\033[1;32m\]"
    local WHITE="\[\033[1;37m\]"
    local LIGHT_GRAY="\[\033[0;37m\]"
    local DEFAULT="\[\033[0m\]"
    case $TERM in
        xterm*)
            TITLEBAR='\[\033]0;\u@\h:\w\007\]'
            ;;
        *)
            TITLEBAR=""
            ;;
    esac

#PS1="${TITLEBAR}\
    #  $BLUE[$RED\$(date +%H:%M)$BLUE]\
    #  $BLUE[$RED\u@\h:\w$GREEN\$(parse_git_branch)$BLUE]\
    # $GREEN\$ "
PS1="\[\033[G\]${TITLEBAR}\
$BLUE[$RED\u@\h:$LIGHT_GREEN\w$BLUE]\
$GREEN\$(parse_git_branch)\
$GREEN\$ $DEFAULT"
PS2='> '
PS4='+ '
}
proml

export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export EDITOR=vim
