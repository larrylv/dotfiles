export GOPATH=$HOME/Code/GoPath
export PATH=$PATH:/usr/local/Cellar/go/1.2/libexec/bin:$GOPATH/bin

[[ -s "/usr/local/bin" ]] && export PATH=/usr/local/bin:$PATH
[[ -s "/usr/local/sbin" ]] && export PATH=/usr/local/sbin:$PATH

export PATH=.binstubs:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
