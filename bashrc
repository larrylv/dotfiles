# vim:ft=sh:

### BEGIN HOMEBREW FOR APPLE SILICON
if [[ $(/usr/bin/uname -m) == "arm64" ]]; then
  if [[ -f /opt/homebrew/bin/brew ]]; then
    export HOMEBREW_PREFIX="/opt/homebrew";
    export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
    export HOMEBREW_REPOSITORY="/opt/homebrew";
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/opt/homebrew/opt/python/bin${PATH+:$PATH}";
    export LIBRARY_PATH="${LIBRARY_PATH}:/opt/homebrew/lib";
    export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
    export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
  fi
else
  if [[ -f /usr/local/bin/brew ]]; then
    export HOMEBREW_PREFIX="/usr/local";
    export HOMEBREW_CELLAR="/usr/local/Cellar";
    export HOMEBREW_REPOSITORY="/opt/homebrew";
    export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/opt/python/bin:$PATH"
    export LIBRARY_PATH="${LIBRARY_PATH}:/usr/local/lib";
    export MANPATH="/usr/local/share/man${MANPATH+:$MANPATH}:";
    export INFOPATH="/usr/local/share/info:${INFOPATH:-}";
  fi
fi
### END HOMEBREW FOR APPLE SILICON

[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local

# alias
alias vim='nvim'

alias af='git ls-files | ack --smart-case --no-column --noenv'
alias ag='rg'
alias be='bundle exec'
# use `bundle config set path 'vendor/bundle'` and `bundle binstubs --all`
alias bi='bundle install'
alias du="ncdu --color dark -rr -x"
alias fvim="vim \$(fzf)"
alias grep='grep --color=auto'
alias gtags='ctags -R --languages=-javascript --exclude=.git/ --exclude=log/ --exclude=target/ --exclude=node_modules/ --fields=+ialS --extras=+q .'
alias jtags='find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; | sed '''/^$/d''' | LANG=C sort >| tags'
alias l='ls -CF'
alias la='ls -A'
alias lgit='GIT_SSH_COMMAND="ssh -i ~/.ssh/id_rsa -F /dev/null" git'
alias ll='ls -alF'
alias mcopy='reattach-to-user-namespace pbcopy'
alias mpaste='reattach-to-user-namespace pbpaste'
alias ping='prettyping --nolegend'
alias preview="fzf --preview='bat --color always {}'"
alias pt='pstree'
alias rb='rbenv'
alias ssh='TERM=xterm ssh'
alias tailf='tail -f'
alias tf='terraform'
alias tcommit="git add . ; date +\"%Y-%m-%d\" | xargs git ci -m"
alias tigs='tig status'
alias vs='vim -S Session.vim'
alias ycommit="git add . ; date -v-1d +\"%Y-%m-%d\" | xargs git ci -m"
LESS="-iXRF"; export LESS

if which trash > /dev/null; then
  alias rm='trash'
fi

export RIPGREP_CONFIG_PATH=~/.ripgreprc

if [[ -f "$HOMEBREW_PREFIX/bin/bat" ]]; then
  alias cat='bat'
  export BAT_THEME='Monokai Extended'
fi

# ag() {
#   if which rg > /dev/null; then
#     rg --color always --vimgrep --sort-files "$@" | less
#   elif which ag > /dev/null; then
#     ag "$@"
#   else
#     ack "$@"
#   fi
# }

if which fd > /dev/null; then
  export FZF_DEFAULT_COMMAND="fd --hidden --follow --type f --ignore-file=$HOME/.fdignore"
elif which rg > /dev/null; then
  export FZF_DEFAULT_COMMAND="rg --hidden --glob '!.git/*' --files"
fi

# alias rtags='ripper-tags -R --exclude=.git/ --exclude=log/ --exclude=build/ --exclude=target/ --exclude=node_modules/ --force --fields=+n'
rtags() {
  echo 'running ripper-tags'
  find . \( -name 'build' -o -name 'log' -o -name 'node_modules' -o -name 'target' \) -prune -o -name '*.rb' -print0 | xargs -0 -P 6 -n 3000 ripper-tags -f - | LC_ALL=C sort -u --radixsort >> tmp_tags
  [[ -f ./tags ]] && rm ./tags && echo 'rm ./tags'
  mv tmp_tags tags
}

# syntax highlighting, useful for pasting code to google doc.
# 1. copy the code to your clipboard
# 2. in your terminal do: hlpb rb (where rb is your language)
# 3. paste it into gdocs
# You could get the `Roboto Mono` font here: https://fonts.google.com/specimen/Roboto+Mono
hlpb () {
	pbpaste | highlight -O rtf --font 'Roboto Mono' --font-size 12 --syntax $1 -s 'solarized-dark' | pbcopy
}

set -o emacs

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

## on menu-complete, first display the common prefix, then cycle through the
# options when hitting TAB
bind "set menu-complete-display-prefix on"

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
export EDITOR=nvim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export GIT_EDITOR=nvim

## rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

## goenv
# See https://github.com/syndbg/goenv/issues/72
export GOENV_DISABLE_GOPATH=1
export GOENV_ROOT="$HOME/.goenv"
if which goenv > /dev/null; then export GOROOT="$(goenv prefix)"; fi
export PATH="$GOENV_ROOT/bin:$PATH"
if which goenv > /dev/null; then eval "$(goenv init -)"; fi

if [[ -d "$HOME/code/gopath" ]]; then
  export GOPATH=$HOME/code/gopath
  export PATH=$GOPATH/bin:$PATH
fi

## pyenv
export PATH="/Users/larrylv/.pyenv/bin:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init --path)"; fi

## jEnv
# if which jenv > /dev/null; then eval "$(jenv init -)"; fi

## kiex
# [[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"

## binstubs
# export PATH=.binstubs:$PATH

## history
shopt -s histappend
export HISTSIZE=-1
export HISTFILESIZE=-1
export HISTCONTROL=ignoredups:erasedups
## Use standard ISO 8601 timestamp
## %F equivalent to %Y-%m-%d
## %T equivalent to %H:%M:%S (24-hours format)
# export HISTTIMEFORMAT='%F %T '

if ! echo "$PROMPT_COMMAND" | grep -q history; then
  export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
fi

# source scripts -----------------------------------------------------------

## bash completion
# bash_completion="$(brew --prefix 2>/dev/null)/etc/bash_completion"
# if [ -r "$bash_completion" ]; then
#   source "$bash_completion"
# fi
# unset bash_completion

## git completion
# git_completion="$HOMEBREW_PREFIX/etc/bash_completion.d/git-completion.bash"
# if [ -r "$git_completion" ]; then
#   source "$git_completion"
# fi
# unset git_completion

## autojump script
autojump_script="$HOMEBREW_PREFIX/etc/profile.d/autojump.sh"
if [ -r "$autojump_script" ]; then
  source "$autojump_script"
fi
unset autojump_script

echo_normal='\033[0;00m'
echo_black='\033[0;30m'
echo_bold_black='\033[1;30m'
echo_red='\033[0;31m'
echo_bold_red='\033[1;31m'
echo_green='\033[0;32m'
echo_bold_green='\033[1;32m'
echo_yellow='\033[0;33m'
echo_bold_yellow='\033[1;33m'
echo_blue='\033[0;34m'
echo_bold_blue='\033[1;34m'
echo_purple='\033[0;35m'
echo_bold_purple='\033[1;35m'
echo_cyan='\033[0;36m'
echo_bold_cyan='\033[1;36m'
echo_white='\033[0;37m'
echo_bold_white='\033[1;37m'

reset_color='\[\e[39m\]'
normal='\[\e[0m\]'
black='\[\e[0;30m\]'
bold_black='\[\e[1;30m\]'
red='\[\e[0;31m\]'
bold_red='\[\e[1;31m\]'
green='\[\e[0;32m\]'
bold_green='\[\e[1;32m\]'
yellow='\[\e[0;33m\]'
bold_yellow='\[\e[1;33m\]'
blue='\[\e[0;34m\]'
bold_blue='\[\e[1;34m\]'
purple='\[\e[0;35m\]'
bold_purple='\[\e[1;35m\]'
cyan='\[\e[0;36m\]'
bold_cyan='\[\e[1;36m\]'
white='\[\e[0;37m\]'
bold_white='\[\e[1;37m\]'


# PS1 -------------------------------------------------------------------------

GIT_PROMPT_CLEAN=" ${echo_bold_green}✔"
GIT_PROMPT_DIRTY=" ${echo_bold_red}✗"
GIT_PROMPT_STASH=" ${echo_bold_purple}#"
GIT_PROMPT_NOSTASH=""

function parse_git_dirty () {
  if [[ $PWD =~ .*openai.* ]]; then
    echo ""
  elif [[ $(git diff --stat) != '' ]]; then
    echo -e "$GIT_PROMPT_DIRTY"
  else
    echo -e "$GIT_PROMPT_CLEAN"
  fi
}

function parse_git_stash() {
  if [[ -n $("$HOMEBREW_PREFIX/bin/git" stash list 2> /dev/null) ]]; then
    echo -e "$GIT_PROMPT_STASH"
  else
    echo -e "$GIT_PROMPT_NOSTASH"
  fi
}

function git_prompt_info() {
  local ref="$($HOMEBREW_PREFIX/bin/git symbolic-ref -q HEAD 2>/dev/null)"
  if [ -n "$ref" ]; then
    local git_branch_name="${ref/refs\/heads\/}"
    echo -e " ${echo_bold_purple}\ue725 $git_branch_name$(parse_git_dirty)$(parse_git_stash)"
  fi
}

function rbenv_prompt_info() {
  if which rbenv > /dev/null; then
    echo -e " ${echo_bold_red}\ue21e $(rbenv version-name)${echo_normal}"
  fi
}

function goenv_prompt_info() {
  if which goenv > /dev/null; then
    echo -e " ${echo_bold_cyan}\ufcd1 $(goenv version-name)${echo_normal}"
  fi
}

function pyenv_prompt_info() {
  if which pyenv > /dev/null; then
    echo -e " ${echo_bold_yellow}\uf81f $(pyenv version-name)${echo_normal}"
  fi
}

function kiex_prompt_info() {
  if which kiex > /dev/null; then
    if [ -f "$PWD/mix.exs" ]; then
      echo -e " ${echo_bold_purple}\ue62d $ELIXIR_VERSION${echo_normal}"
    fi
  fi
}

function dir_prompt() {
  echo -e "\uf124"
}

function bash_prompt() {
  echo -e "$"
}

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  PS1="${bold_cyan}\$(dir_prompt)  \u@\H ${bold_blue}\w\$(pyenv_prompt_info)\$(goenv_prompt_info)\$(git_prompt_info)${reset_color}\n${bold_green}\$(bash_prompt) ${normal}"
else
  PS1="${bold_blue}\$(dir_prompt)  ${bold_blue}\w\$(pyenv_prompt_info)\$(goenv_prompt_info)\$(git_prompt_info)${reset_color}\n${bold_green}\$(bash_prompt) ${normal}"
fi


[[ -f "$HOMEBREW_PREFIX/opt/fzf/shell/completion.bash" ]] && source "$HOMEBREW_PREFIX/opt/fzf/shell/completion.bash"
[[ -f "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.bash" ]] && source "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.bash"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#
# export PATH="./node_modules/.bin:$PATH"

if [ -d $HOME/.local/bin ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

[[ -d $HOME/.cargo ]] && [ -s "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# eval "$(ssh-agent -s)" > /dev/null
ssh-add ~/.ssh/id_rsa > /dev/null 2>&1

## autoenv
[[ -f "$HOMEBREW_PREFIX/opt/autoenv/activate.sh" ]] && source "$HOMEBREW_PREFIX/opt/autoenv/activate.sh"
export AUTOENV_ENABLE_LEAVE=true

ulimit -n 4096
