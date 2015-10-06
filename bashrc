# vim:ft=sh:

# alias
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias tigs='tig status'
alias rb='rbenv'
alias be='bundle exec'
alias pt='pstree'
alias bi='bundle install --path=vendor/bundle --binstubs=.binstubs'
alias vless='/usr/local/opt/vim/share/vim/vim74/macros/less.sh'
alias tailf='tail -f'
alias gtags='ctags -R --languages=-javascript --exclude=.git --exclude=log --exclude=target --fields=+iaS --extra=+q .'
alias mcopy='reattach-to-user-namespace pbcopy'
alias mpaste='reattach-to-user-namespace pbpaste'
alias ag='ack -H --smart-case --column --ignore-dir=.binstubs --ignore-dir=vendor --ignore-dir=log --ignore-dir=tmp --ignore-file=is:Session.vim --ignore-file=is:tags'
alias t='git ls-files | ack --smart-case --no-column --noenv'
alias vs='vim -S Session.vim'

# environment

bind 'set completion-ignore-case on'

export CLICOLOR=1
export EDITOR=vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

## go
export GOPATH=$HOME/.gopath
export PATH=$PATH:$GOPATH/bin

## rbenv
export PATH=$HOME/.rbenv/bin:$PATH
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

## binstubs
export PATH=.binstubs:$PATH

## history
shopt -s histappend
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=ignoredups

# source scripts -----------------------------------------------------------#{{{

## bash completion
bash_completion="$(brew --prefix 2>/dev/null)/etc/bash_completion"
if [ -r "$bash_completion" ]; then
  source "$bash_completion"
fi
unset bash_completion

## git completion
git_completion="$(brew --prefix 2>/dev/null)/etc/bash_completion.d/git-completion.bash"
if [ -r "$git_completion" ]; then
  source "$git_completion"
fi
unset git_completion

## vagrant completion
vagrant_completion="$(brew --prefix 2>/dev/null)/etc/bash_completion.d/vagrant"
if [ -r "$vagrant_completion" ]; then
  source "$vagrant_completion"
fi
unset vagrant_completion

## tmuxinator completion
tmuxinator_completion="$HOME/.tmuxinator.bash"
if [ -r "$tmuxinator_completion" ]; then
  source "$tmuxinator_completion"
fi
unset tmuxinator_completion

## autojump script
autojump_script="$(brew --prefix 2>/dev/null)/etc/profile.d/autojump.sh"
if [ -r "$autojump_script" ]; then
  source "$autojump_script"
fi
autojump_script="/usr/share/autojump/autojump.bash"
if [ -r "$autojump_script" ]; then
  source "$autojump_script"
fi
unset autojump_script

## colors script
[[ -s $HOME/.colors.bash ]] && source $HOME/.colors.bash

#}}}

# PS1 -------------------------------------------------------------------------#{{{

GIT_PROMPT_CLEAN=" ${echo_bold_green}✔ "
GIT_PROMPT_DIRTY=" ${echo_bold_red}✗"
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
  local ref="$(command git symbolic-ref -q HEAD 2>/dev/null)"
  if [ -n "$ref" ]; then
    echo -e "${echo_bold_cyan}git:($(git_branch_name)${echo_bold_cyan})$(parse_git_dirty)$(parse_git_stash)"
  fi
}

function rbenv_prompt_info() {
  if which rbenv > /dev/null; then
    echo -e "${echo_bold_cyan}ruby:(${echo_bold_purple}$(rbenv version-name)${echo_bold_cyan})"
  fi
}

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  PS1="${bold_green}\u@\h ${bold_yellow}➜  ${bold_blue}\w \$(rbenv_prompt_info) \$(git_prompt_info)${reset_color}\n${bold_green}\$ ${reset_color}"
else
  PS1="${bold_yellow}➜  ${bold_blue}\w \$(rbenv_prompt_info) \$(git_prompt_info)${reset_color}\n${bold_green}\$ ${reset_color}"
fi

#}}}

# set terminal title#{{{

setTerminalTitle () {
  # echo works in bash & zsh
  local mode=$1 ; shift
  echo -ne "\033]$mode;$@\007"
}
set_both_title   () { setTerminalTitle 0 $@; }
set_tab_title    () { setTerminalTitle 1 $@; }
set_window_title () { setTerminalTitle 2 $@; }
alias s='set_tab_title'

# color ssh
tab-color() {
  echo -ne "\033]6;1;bg;red;brightness;$1\a"
  echo -ne "\033]6;1;bg;green;brightness;$2\a"
  echo -ne "\033]6;1;bg;blue;brightness;$3\a"
}
tab-reset() {
  echo -ne "\033]6;1;bg;*;default\a"
}

# Change the color of the tab when using SSH
# reset the color after the connection closes
color-ssh() {
  if [[ -n "$ITERM_SESSION_ID" ]]; then
    trap "tab-reset" INT EXIT
    if [[ "$*" =~ "production|ec2-.*compute-1" ]]; then
      tab-color 255 0 0
    else
      tab-color 0 255 0
    fi
  fi
  ssh $*
}

alias ssh=color-ssh

#}}}
