## Larry Lv Dot Files

These are config files to set up a system the way I like it.

### Installation

```
git clone git://github.com/larrylv/dotfiles.git ~/.dotfiles
```

Now all vim plugins are managed by Vundle, so we should install `Vundle` first.

```
cd ~/.dotfiles
git submodule init
git submodule update
rake install
vim +BundleInstall +qall
```

### Environment

I am running on Mac OS X, but it will likely work on Linux as well.

### Vim Plugins

* [Powerline](https://github.com/Lokaltog/vim-powerline): The ultimate vim statusline utility.
* [ctrlp.vim](https://github.com/kien/ctrlp.vim): I only use this for tag matcher.
* [NERDTree](https://github.com/scrooloose/nerdtree): A tree explorer plugin for vim.
* [tabular](https://github.com/godlygeek/tabular): A script for text filtering and alignment.
* [ack.vim](https://github.com/mileszs/ack.vim): Ack can be used as a replacement for 99% of the uses of grep.
* [rails.vim](https://github.com/tpope/vim-rails): Ruby on Rails power tools.
* [vim-surround](https://github.com/tpope/vim-surround): Provides mappings to easily delete, change and add surroundings in pairs.
* [vim-obsession](https://github.com/tpope/vim-obsession): Continuously updated session files.
* [YouCompleteMe](https://github.com/Valloric/YouCompleteMe): A code-completion engine for Vim
* [syntastic](https://github.com/scrooloose/syntastic): Syntax checking hacks for vim.
* [showmarks.vim](http://www.vim.org/scripts/script.php?script_id=152): ShowMarks provides a visual representation of the location marks.
* etc.
