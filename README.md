## Larry Lv Dot Files

These are config files to set up a system the way I like it.

### Installation

If you don't want to compile YouCompleteMe manually, you should uncomment the do block for line `Plug 'Valloric/YouCompleteMe' ", { 'do': './install.py --clang-completer' }` by simply removing the `"` mark.

```
git clone git://github.com/larrylv/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
rake install
vim +PlugInstall +qall
```

If you would like to use zsh and on-my-zsh, then you should run this:

```
git checkout with_zsh_config
git submodule init
git submodule update
rake install
```

#### Install tmux plugins

https://github.com/tmux-plugins/tpm#installation

### Environment

It will work on Mac OS X and Linux.

### Vim Plugins

https://github.com/larrylv/dotfiles/blob/master/vimrc#L27
