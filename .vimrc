"
" author:    Lv Zhandong <larrylv1990@gmail.com>
" modified at:    2012 May 24
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
map <F5> :!/usr/local/bin/ctags -R --exclude=.git --exclude=vendor/bundle --exclude=log --exclude=*.js * --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <F7> :tprevious<CR>
map <F8> :tnext<CR>
set tags=./tags;

" configure a.vim
nnoremap <silent> <F6> :A<CR>

" configure ack.vim
if executable("ack")
    let g:ackprg="ack -H --nocolor --nogroup --column --ignore-dir=vendor/bundle --ignore-dir=tmp/cache --ignore-dir=app/assets/images"
endif

filetype plugin indent on

" vim-javascript plugin configuration
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" configure Omni Completion"{{{
set completeopt=longest,menu
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold
" map <ESC> will get arrow keys not working
" inoremap <expr> <Esc>   pumvisible() ? "\<C-E>" : "\<Esc>"
inoremap <expr> <C-J>   pumvisible() ? "\<C-N>" : "\<C-X><C-O>"
inoremap <expr> <C-K>   pumvisible() ? "\<C-P>" : "\<C-K>"
inoremap <expr> <C-U>   pumvisible() ? "\<C-E>" : "\<C-U>"

" ruby's completion
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
" rails environment can lead to a mess, so disable on rails
" prefer to look up API on apidock.com
" autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_include_object = 1
autocmd FileType ruby,eruby let g:rubycomplete_include_objectspace = 1

" other files' completion
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" again, very annoying
" autocmd FileType javascript inoremap . .<C-X><C-O>
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Automatic omni-completion suggestions
" sometime it's really annoying every dot pops up a menu
" so, disable this, and press tab to pop one when u really need
" inoremap . .<C-X><C-O>
"}}}

" configure SuperTab
let g:SuperTabRetainCompletionType = 2
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

autocmd BufNewFile,BufRead Gemfile set filetype=ruby
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
