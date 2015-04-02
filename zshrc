# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="larrylv"

setopt prompt_subst
setopt no_nomatch

zstyle ':completion:*' path-completion false
zstyle ':completion:*' accept-exact-dirs true
zstyle ':completion:*' special-dirs true

stty -ixon

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rbenv autojump brew bundler gem git go history-substring-search lein node npm osx pow postgres rails ruby tmux tmuxinator)

fpath=(/usr/local/share/zsh-completions $fpath)

source $ZSH/oh-my-zsh.sh

# Configure golang
export GOPATH=$HOME/Code/Other/go-path
export PATH=$PATH:$GOPATH/bin

[[ -s "/usr/local/bin" ]] && export PATH=/usr/local/bin:$PATH
[[ -s "/usr/local/sbin" ]] && export PATH=/usr/local/sbin:$PATH

export PATH=.binstubs:$PATH

$(boot2docker shellinit 2> /dev/null)
export DOCKER_CERT_PATH=$HOME/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376
