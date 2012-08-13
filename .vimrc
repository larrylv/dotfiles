"
" author:    Lv Zhandong <larrylv1990@gmail.com>
" modified at:    2012 Aug 13
"

set nocompatible

set t_Co=256
:colorscheme wombat256mod

" basic configuration
syntax on
set nu
set ruler
set nobackup
set fdm=marker
set bs=2

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" configure indent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set cindent

" configure search
set ignorecase
set smartcase
set hlsearch

" display status line
set laststatus=2
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%)

" Highlight trailing whitespace in red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" configure NERDTree plugin
let NERDTreeWinSize = 22
map <F1> :NERDTree<CR>

" configure Tlist plugin
let Tlist_Show_One_File=1
let Tlist_Use_Right_Window=1
let Tlist_Exit_OnlyWindow=1
map <F2> :Tlist<CR>

" Remove trailing whitespaces
:nnoremap <silent> <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" configure ctags
map <F5> :!ctags -R --exclude=.git --exclude=vendor/bundle --exclude=log --exclude=*.js * --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <F7> :tprevious<CR>
map <F8> :tnext<CR>
set tags=./tags;

" configure a.vim
nnoremap <silent> <F6> :A<CR>

" configure ack.vim
if executable("ack")
    let g:ackprg="ack -H --nocolor --nogroup --column --ignore-dir=vendor/bundle --ignore-dir=tmp --ignore-dir=app/assets/images"
endif

filetype plugin indent on

" vim-javascript plugin configuration
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

set completeopt=longest,menu
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" configure SuperTab
let g:SuperTabRetainCompletionType = 2
let g:SuperTabDefaultCompletionType = "<C-X><C-P>"

autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead Capfile set filetype=ruby
" autocmd BufRead *.erb set filetype=html
augroup mkd
    autocmd BufNewFile,BufRead *.mkd set ai formatoptions=tcroqn2 comments=n:>
    "autocmd BufNewFile,BufRead *.mkd set wrap nonumber
augroup END

" use comma as <Leader> key instead of backslash
let mapleader=","

" configure CommandT plugin {{{
" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>
nnoremap <leader><leader> <c-^>
let g:CommandTCancelMap=['<Esc>', '<C-c>']
let g:CommandTAcceptSelectionSplitMap=['<C-f>']
:set wildignore+=*.o,*.obj,.git,vendor/bundle/**,app/assets/images/**,tmp/cache/** " exclude files from listings
" }}}

" configure encoding {{{
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,chinese
set formatoptions+=mM
set ambiwidth=double
"}}}

" configure encoding for baidu... {{{
"set encoding=gb2312
"set fileencoding=chinese
"set fileencodings=chinese,ucs-bom,utf-8
"set formatoptions+=mM
"set ambiwidth=double
"}}}
