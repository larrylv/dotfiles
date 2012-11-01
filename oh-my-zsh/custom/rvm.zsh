[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

if [ $(rvm current) = 'system' ]; then
  rvm 1.9.3 --default
fi
