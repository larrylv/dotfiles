# vim: set ft=sh :

if [ -f /etc/profile ] && [ "$(uname)" == "Darwin" ]; then
  PATH=""
  source /etc/profile
fi

export GPG_TTY=$(tty)
[[ -s $HOME/.bashrc ]] && source $HOME/.bashrc
[[ -s "$HOME/.bash_profile.local" ]] && source "$HOME/.bash_profile.local"

# OpenAI shprofile (if customising, comment out to prevent it getting readded)
for file in "/Users/larrylv/.openai/shprofile"/*; do
    source "$file"
done
