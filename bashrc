# vim:ft=sh:

# alias
alias af='git ls-files | ack --smart-case --no-column --noenv'
alias ag='ack'
alias be='bundle exec'
alias bi='bundle install --path=vendor/bundle --binstubs=.binstubs'
alias cat='ccat'
alias grep='grep --color=auto'
alias gtags='ctags -R --languages=-javascript --exclude=.git --exclude=log --exclude=target --fields=+ialS --extras=+q .'
alias ki='kiex'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias mcopy='reattach-to-user-namespace pbcopy'
alias mpaste='reattach-to-user-namespace pbpaste'
alias nvs='nvim -S Session.vim'
alias pt='pstree'
alias rb='rbenv'
alias ssh='TERM=xterm ssh'
alias tailf='tail -f'
alias tigs='tig status'
alias vs='vim -S Session.vim'

# bash-sensible (https://github.com/mrzool/bash-sensible/blob/master/sensible.bash)

## Prevent file overwrite on stdout redirection
## # Use `>|` to force redirection to an existing file
set -o noclobber

## Enable history expansion with space
## E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space

## Turn on recursive globbing (enables ** to recurse all directories)
shopt -s globstar 2> /dev/null

## SMARTER TAB-COMPLETION (Readline bindings) ##

## Perform file completion in a case insensitive fashion
bind "set completion-ignore-case on"

## Treat hyphens and underscores as equivalent
bind "set completion-map-case on"

## Display matches for ambiguous patterns at first tab press
bind "set show-all-if-ambiguous on"

## Save multi-line commands as one command
shopt -s cmdhist

## Enable incremental history search with up/down arrows (also Readline goodness)
## Learn more about this here: http://codeinthehole.com/writing/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'

## Prepend cd to directory names automatically
shopt -s autocd 2> /dev/null
## Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null
## Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null


# environment

export CLICOLOR=1
export EDITOR=vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

## rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

## goenv
if which goenv > /dev/null; then eval "$(goenv init -)"; fi

## pyenv
# if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

## jEnv
# if which jenv > /dev/null; then eval "$(jenv init -)"; fi

## kiex
# shellcheck disable=SC1090
# [[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"

## binstubs
export PATH=.binstubs:$PATH

## history
shopt -s histappend
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=ignoredups
## Use standard ISO 8601 timestamp
## %F equivalent to %Y-%m-%d
## %T equivalent to %H:%M:%S (24-hours format)
export HISTTIMEFORMAT='%F %T '

# export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# source scripts -----------------------------------------------------------#{{{

## bash completion
bash_completion="$(brew --prefix 2>/dev/null)/etc/bash_completion"
if [ -r "$bash_completion" ]; then
  # shellcheck disable=SC1090
  source "$bash_completion"
fi
unset bash_completion

## git completion
git_completion="$(brew --prefix 2>/dev/null)/etc/bash_completion.d/git-completion.bash"
if [ -r "$git_completion" ]; then
  # shellcheck disable=SC1090
  source "$git_completion"
fi
unset git_completion

## vagrant completion
vagrant_completion="$(brew --prefix 2>/dev/null)/etc/bash_completion.d/vagrant"
if [ -r "$vagrant_completion" ]; then
  # shellcheck disable=SC1090
  source "$vagrant_completion"
fi
unset vagrant_completion

## tmuxinator completion
tmuxinator_completion="$HOME/.tmuxinator.bash"
if [ -r "$tmuxinator_completion" ]; then
  # shellcheck disable=SC1090
  source "$tmuxinator_completion"
fi
unset tmuxinator_completion

## autojump script
autojump_script="$(brew --prefix 2>/dev/null)/etc/profile.d/autojump.sh"
if [ -r "$autojump_script" ]; then
  # shellcheck disable=SC1090
  source "$autojump_script"
fi
unset autojump_script

## colors script
# shellcheck disable=SC1090
[[ -s "$HOME/.colors.bash" ]] && source "$HOME/.colors.bash"

#}}}

# PS1 -------------------------------------------------------------------------#{{{

# shellcheck disable=SC2154
GIT_PROMPT_CLEAN=" ${echo_bold_green}✔"
# shellcheck disable=SC2154
GIT_PROMPT_DIRTY=" ${echo_bold_red}✗"
# shellcheck disable=SC2154
GIT_PROMPT_STASH=" ${echo_bold_purple}#"
GIT_PROMPT_NOSTASH=""

function parse_git_dirty () {
  if [[ $(git status 2> /dev/null | tail -n1 | cut -c 1-17) != "nothing to commit" ]]; then
    echo -e "$GIT_PROMPT_DIRTY"
  else
    echo -e "$GIT_PROMPT_CLEAN"
  fi
}

function parse_git_stash() {
  if [[ -n $(git stash list 2> /dev/null) ]]; then
    echo -e "$GIT_PROMPT_STASH"
  else
    echo -e "$GIT_PROMPT_NOSTASH"
  fi
}

function git_branch_name() {
  echo -e "${echo_bold_purple}$(git symbolic-ref HEAD 2> /dev/null | sed -e "s/refs\/heads\///")"
}

function git_prompt_info() {
  # shellcheck disable=SC2155
  local ref="$(command git symbolic-ref -q HEAD 2>/dev/null)"
  if [ -n "$ref" ]; then
    # shellcheck disable=SC2154
    echo -e " ${echo_bold_cyan}git:($(git_branch_name)${echo_bold_cyan})$(parse_git_dirty)$(parse_git_stash)"
  fi
}

function rbenv_prompt_info() {
  if which rbenv > /dev/null; then
    echo -e " ${echo_bold_cyan}ruby:(${echo_bold_purple}$(rbenv version-name)${echo_bold_cyan})"
  fi
}

function goenv_prompt_info() {
  if which goenv > /dev/null; then
    echo -e " ${echo_bold_cyan}go:(${echo_bold_purple}$(goenv version-name)${echo_bold_cyan})"
  fi
}

function pyenv_prompt_info() {
  if which pyenv > /dev/null; then
    if [ ! -f "$PWD/Gemfile" ] && [ ! -f "$PWD/mix.exs" ] && [ ! -f "$PWD/project.clj" ] ; then
      echo -e " ${echo_bold_cyan}python:(${echo_bold_purple}$(pyenv version-name)${echo_bold_cyan})"
    fi
  fi
}

function kiex_prompt_info() {
  if which kiex > /dev/null; then
    if [ -f "$PWD/mix.exs" ]; then
      echo -e " ${echo_bold_cyan}elixir:(${echo_bold_purple}$ELIXIR_VERSION${echo_bold_cyan})"
    fi
  fi
}

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  # shellcheck disable=SC2154
  PS1="${bold_green}\u@\h ${bold_yellow}➜  ${bold_blue}\w\$(rbenv_prompt_info)\$(goenv_prompt_info)\$(git_prompt_info)${reset_color}\n${bold_green}\$ ${reset_color}"
else
  PS1="${bold_yellow}➜  ${bold_blue}\w\$(rbenv_prompt_info)\$(goenv_prompt_info)\$(git_prompt_info)${reset_color}\n${bold_green}\$ ${reset_color}"
fi

#}}}

# set terminal title#{{{

setTerminalTitle () {
  # echo works in bash & zsh
  local mode=$1 ; shift
  # shellcheck disable=SC2145
  echo -ne "\033]$mode;$@\007"
}
# shellcheck disable=SC2068
set_both_title   () { setTerminalTitle 0 $@; }
# shellcheck disable=SC2068
set_tab_title    () { setTerminalTitle 1 $@; }
# shellcheck disable=SC2068
set_window_title () { setTerminalTitle 2 $@; }
alias s='set_tab_title'

#}}}

# shellcheck disable=SC1090
[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash

# Local config
# shellcheck disable=SC1090
[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local
