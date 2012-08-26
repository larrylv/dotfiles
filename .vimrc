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

" Map ESC
imap jj <ESC>

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Tab triggers buffer-name auto-completion
set wildchar=<Tab> wildmenu wildmode=full

" use comma as <Leader> key instead of backslash
let mapleader=","

" Map shortcuts for rails.vim
map <leader>c :Rcontroller<cr>
map <leader>v :Rview<cr>
map <leader>m :Rmodel<cr>
map <leader>u :Runittest<cr>
map <leader>s :Rfunctionaltest<cr>

" Remove trailing whitespaces
:nnoremap <silent> <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" scrollfix.vim shortcut for open/close scrollfix
" FIXOFF    :let g:scrollfix=-1
" FIXON     :let g:scrollfix=60

" Syntastic settings"{{{
set statusline+=\ %#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'passive_filetypes': ['tex'] }"}}}

" Autocomplete configuration"{{{
set complete=.,w,b,u,t,i
set completeopt=longest,menu
highlight Pmenu ctermbg=238 gui=bold
let g:neocomplcache_enable_at_startup = 1
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
" Enable omni completion.
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
imap <silent><C-l> <Plug>(neocomplcache_snippets_force_expand)
smap <silent><C-l> <Plug>(neocomplcache_snippets_force_expand)
imap <silent><C-j> <Plug>(neocomplcache_snippets_force_jump)
smap <silent><C-j> <Plug>(neocomplcache_snippets_force_jump)
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
inoremap <expr><C-h> neocomplcache#smart_close_popup()
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>""}}}

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
nnoremap <leader><leader> <c-^>
let g:CommandTCancelMap=['<Esc>', '<C-c>']
let g:CommandTAcceptSelectionSplitMap=['<C-f>']
:set wildignore+=*.o,*.log,*.obj,.git,*.jpg,*.png,*.gif,vendor/bundle,vendor/cache,tmp,public/download " exclude files from listings
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
let Tlist_WinWidth = 40
map <F5> :!ctags -R --languages=-javascript --exclude=.git --exclude=log --fields=+iaS --extra=+q .<CR>
map <F7> :tprevious<CR>
map <F8> :tnext<CR>
set tags=./tags;"}}}

" a.vim configuration"{{{
nnoremap <silent> <F6> :A<CR>"}}}

" ack.vim configuration"{{{
if executable("ack")
    " ,a to Ack (search in files)
    nnoremap <leader>a :Ack 
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
