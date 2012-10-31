# $1 = type; 0 - both, 1 - tab, 2 - title
# rest = text
setTerminalTitle () {
  # echo works in bash & zsh
  local mode=$1 ; shift
  echo -ne "\033]$mode;$@\007"
}
# set_both_title   () { setTerminalTitle 0 $@; }
set_tab_title    () { setTerminalTitle 1 $@; }
# set_window_title () { setTerminalTitle 2 $@; }
