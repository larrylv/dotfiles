# zsh
unsetopt correct_all

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=HISTSIZE

[[ -s "/opt/local/bin" ]] && export PATH=/opt/local/bin:$PATH
[[ -s "/usr/local/bin" ]] && export PATH=/usr/local/bin:$PATH

if [[ `uname` == Darwin ]]; then
  alias pt='pstree'
fi

# I dropped rvm a few days ago, so shell won't add append BUNDLE_BIN path to the
# PATH when changing directories. And I always use `--binstubs=.binstubs`
# option for bundler. So it will be great to add `.binstubs` to the PATH.
# Thank god I won't type `bundle exec` or its alias `be` any more.
export PATH=.binstubs:$PATH

export EDITOR=vim

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
