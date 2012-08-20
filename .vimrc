"
" author:    Lv Zhandong <larrylv1990@gmail.com>
" modified at:    2012 Aug 15
"

set t_Co=256
:colorscheme wombat256mod

" basic configuration
syntax on
set nocompatible
set nu
set ruler
set nobackup
set fdm=marker
set bs=2
set backspace=indent,eol,start " allow backspacing over everything in insert mode

" tab/indent configuration
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set cindent
filetype plugin indent on

" search configuration
set ignorecase
set smartcase
set hlsearch

" status line configuration
set laststatus=2
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%)

" Autocomplete configuration
set completeopt=longest,menu
highlight Pmenu ctermbg=238 gui=bold

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Tab triggers buffer-name auto-completion
set wildchar=<Tab> wildmenu wildmode=full

" use comma as <Leader> key instead of backslash
let mapleader=","

" Remove trailing whitespaces
:nnoremap <silent> <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Highlight trailing whitespace"{{{
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()"}}}

" CommandT plugin configuration {{{
" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>
map <Leader>a :bprev<Return>
map <Leader>s :bnext<Return>
nnoremap <leader><leader> <c-^>
let g:CommandTCancelMap=['<Esc>', '<C-c>']
let g:CommandTAcceptSelectionSplitMap=['<C-f>']
:set wildignore+=*.o,*.obj,.git,app/assets/images,vendor/bundle,vendor/cache,tmp,public/download,public/images " exclude files from listings
" }}}

" NERDTree plugin configuration"{{{
let NERDTreeWinSize = 26
let NERDTreeAutoCenter=1
map <F1> :NERDTreeToggle<CR>"}}}

" ctags/Tlist plugin configuration"{{{
map <F2> :Tlist<CR>
let Tlist_Show_One_File=1
let Tlist_Use_Right_Window=1
let Tlist_Exit_OnlyWindow=1
map <F5> :!ctags -R --exclude=.git --exclude=vendor/bundle --exclude=log --exclude=*.js --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <F7> :tprevious<CR>
map <F8> :tnext<CR>
set tags=./tags;"}}}

" a.vim configuration"{{{
nnoremap <silent> <F6> :A<CR>"}}}

" ack.vim configuration"{{{
if executable("ack")
    let g:ackprg="ack -H --nocolor --nogroup --column --nojs --nocss --ignore-dir=vendor/bundle --ignore-dir=bundler_stubs --ignore-dir=bin --ignore-dir=tmp"
endif"}}}

" vim-javascript plugin configuration"{{{
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc""}}}

" SuperTab plugin configuration"{{{
let g:SuperTabRetainCompletionType = 2
let g:SuperTabDefaultCompletionType = "<C-X><C-P>""}}}

" filetype detection"{{{
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead Capfile set filetype=ruby
" autocmd BufRead *.erb set filetype=html
autocmd BufNewFile,BufRead *.mkd set ai formatoptions=tcroqn2 comments=n:>
"autocmd BufNewFile,BufRead *.mkd set wrap nonumber"}}}

" encoding configuration {{{
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,chinese
set formatoptions+=mM
set ambiwidth=double
"}}}

" gb2312 encoding configuration {{{
"set encoding=gb2312
"set fileencoding=chinese
"set fileencodings=chinese,ucs-bom,utf-8
"set formatoptions+=mM
"set ambiwidth=double
"}}}
