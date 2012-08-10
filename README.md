## Larry Lv Dot Files

These are config files to set up a system the way I like it.

### Installation

```
git clone git://github.com/LarryLv/dotfiles.git
cd dotfiles
cp -r .bashrc .git-completion.bash .gitconfig .tmux.conf .vim .vimrc ~/
source ~/.bashrc
```

### Environment

I am running on Mac OS X, but it will likely work on Linux as well.

* vim (7.3) built with Ruby 1.8.7 support
* ack (1.9.6)
* ack-grep (1.9.2)
* ctags (5.9)

### Vim Plugins

* [Command-T](https://github.com/wincent/Command-T): Vim should be compiled with Ruby support
* [NERDTree](https://github.com/scrooloose/nerdtree): A tree explorer plugin for vim
* [tabular](https://github.com/godlygeek/tabular): A script for text filtering and alignment
* [ack.vim](https://github.com/mileszs/ack.vim): Ack can be used as a replacement for 99% of the uses of grep.
* [rails.vim](https://github.com/tpope/vim-rails): Ruby on Rails power tools
* [snipMate.vim](https://github.com/msanders/snipmate.vim): a concise vim script that implements some of TextMate's snippets features in Vim.
* etc.
