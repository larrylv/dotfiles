#!/usr/bin/env zsh

setopt prompt_subst
autoload colors
colors
autoload -U add-zsh-hook

cyan="$fg_bold[cyan]"
yellow="$fg_bold[yellow]"
magenta="$fg_bold[magenta]"
red="$fg_bold[red]"
green="$fg_bold[green]"
blue="$fg_bold[blue]"

ZSH_THEME_GIT_PROMPT_PREFIX="$green("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔ "
ZSH_THEME_GIT_PROMPT_DIRTY=" $red✗$green "
ZSH_THEME_GIT_PROMPT_STASH="$magenta#$green "
ZSH_THEME_GIT_PROMPT_NOSTASH=""

function parse_git_stash() {
  if [[ -n $(git stash list 2> /dev/null) ]]; then
echo "$ZSH_THEME_GIT_PROMPT_STASH"
  else
echo "$ZSH_THEME_GIT_PROMPT_NOSTASH"
  fi
}

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$(parse_git_stash)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

PROMPT='$red%n@%m $blue➜ [ $red%~ $green$(git_prompt_info)$yellow$(rvm_prompt_info)$blue ]$reset_color
$ '
