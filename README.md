## Larry Lv Dot Files

These are config files to set up a system the way I like it.

### Installation

```
git clone git://github.com/LarryLv/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
rake install
```

Also, you could use *thor* instead of *rake*:`thor dotfiles:install`.

Now all plugins are managed by Vundle, so we should set `Vundle` first, then install plugins.

`git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle`

Launch `vim`, run `:BundleInstall`.

### Environment

I am running on Mac OS X, but it will likely work on Linux as well.

* vim (7.3) built with Ruby 1.8.7 support
* ack (1.9.6)
* ack-grep (1.9.2)
* ctags (5.9)
* zsh

### Vim Plugins

* [Command-T](https://github.com/wincent/Command-T): Vim should be compiled with Ruby support
* [NERDTree](https://github.com/scrooloose/nerdtree): A tree explorer plugin for vim
* [tabular](https://github.com/godlygeek/tabular): A script for text filtering and alignment
* [ack.vim](https://github.com/mileszs/ack.vim): Ack can be used as a replacement for 99% of the uses of grep
* [rails.vim](https://github.com/tpope/vim-rails): Ruby on Rails power tools
* [snipMate.vim](https://github.com/msanders/snipmate.vim): A concise vim script that implements some of TextMate's snippets features in Vim
* [neocomplcache.vim](https://github.com/Shougo/neocomplcache): A **real** auto complete vim plugin
* [syntastic](https://github.com/scrooloose/syntastic): Syntax checking hacks for vim
* [showmarks.vim](http://www.vim.org/scripts/script.php?script_id=152): ShowMarks provides a visual representation of the location marks.
* etc.
