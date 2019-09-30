"
" Author:         Larry Lv <larrylv1990@gmail.com>
"

" Plugins -------------------------------------------------------------

" Load plugins {{{

filetype off

call plug#begin('~/.vim/bundle')

" Code Complete Engine
if !has('nvim')
  " Plug 'Valloric/YouCompleteMe',   { 'for': ['ruby'], 'do': './install.py --clang-completer --go-completer' }
  Plug 'Shougo/deoplete.nvim', { 'commit': '98566131d5f574ee2896138bdda08afa68bda416' }
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
else
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif

Plug 'vim-ruby/vim-ruby'
Plug 'elixir-lang/vim-elixir',              { 'for': ['elixir', 'eelixir'] }
Plug 'slashmili/alchemist.vim',             { 'for': ['elixir', 'eelixir'] }
Plug 'vim-erlang/vim-erlang-runtime',       { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-compiler',      { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-omnicomplete',  { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-tags',          { 'for': 'erlang' }
Plug 'ten0s/syntaxerl',                     { 'for': 'erlang' }
Plug 'derekwyatt/vim-scala',                { 'for': 'scala' }
Plug 'guns/vim-clojure-static',             { 'for': 'clojure' }
Plug 'tpope/vim-fireplace',                 { 'for': 'clojure' }
Plug 'tpope/vim-classpath',                 { 'for': 'clojure' }
Plug 'tpope/vim-salve',                     { 'for': 'clojure' }
Plug 'guns/vim-sexp',                       { 'for': 'clojure' }
Plug 'vim-scripts/paredit.vim',             { 'for': 'clojure' }
Plug 'clojure-vim/async-clj-omni',          { 'for': 'clojure' }
Plug 'elmcast/elm-vim',                     { 'for': 'elm' }
Plug 'pbogut/deoplete-elm',                 { 'for': 'elm' }
Plug 'fatih/vim-go',                        { 'for': ['go', 'vim'], 'do': ':GoUpdateBinaries' }
Plug 'mdempsky/gocode',                     { 'for': ['go', 'vim'], 'rtp': 'vim', 'do': '~/.vim/bundle/gocode/vim/symlink.sh' }
Plug 'deoplete-plugins/deoplete-go',        { 'for': 'go', 'do': 'make' }
Plug 'davidhalter/jedi-vim',                { 'for': 'python' }
Plug 'zchee/deoplete-jedi',                 { 'for': 'python' }
Plug 'fisadev/vim-isort',                   { 'for': 'python' }
Plug 'Vimjas/vim-python-pep8-indent',       { 'for': 'python' }
Plug 'pangloss/vim-javascript',             { 'for': 'javascript' }
Plug 'kchmck/vim-coffee-script',            { 'for': ['javascript', 'coffee', 'javascript.jsx'] }
Plug 'mxw/vim-jsx',                         { 'for': ['javascript', 'javascript.jsx'] }
Plug 'wokalski/autocomplete-flow',          { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/html5.vim',                    { 'for': ['html', 'eruby'] }
Plug 'mustache/vim-mustache-handlebars',    { 'for': ['html.mustache', 'html.handlebars'] }
Plug 'hail2u/vim-css3-syntax',              { 'for': ['css', 'sass', 'scss'] }
Plug 'ap/vim-css-color',                    { 'for': ['css', 'sass', 'scss'] }
Plug 'groenewege/vim-less',                 { 'for': 'less' }
Plug 'tpope/vim-haml',                      { 'for': 'haml' }
Plug 'cakebaker/scss-syntax.vim',           { 'for': 'scss' }
Plug 'tpope/vim-markdown',                  { 'for': 'markdown' }
Plug 'tudorprodan/html_annoyance.vim',      { 'for': ['html', 'eruby'] }
Plug 'zackhsi/fzf-copy-ruby-token',         { 'for': ['ruby'] }
Plug 'tpope/vim-dispatch',                  { 'commit': '1fe6e005d1e521439354478b26d0b76debc8c973' }
Plug 'lifepillar/vim-solarized8'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'kshenoy/vim-signature'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ivalkeen/vim-ctrlp-tjump'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-rhubarb'
Plug 'deoplete-plugins/deoplete-tag'
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'tomtom/tcomment_vim'
Plug 'larrylv/vim-vroom'
Plug 'honza/vim-snippets'
Plug 'janko-m/vim-test'
Plug 'mileszs/ack.vim'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'Raimondi/delimitMate'
Plug 'benmills/vimux'
Plug 'jlanzarotta/bufexplorer'
Plug 'vim-scripts/matchit.zip'
Plug 'mhinz/vim-startify'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'tyru/open-browser.vim'

" Add plugins to &runtimepath
call plug#end()

filetype plugin indent on

" }}}

" Settings ------------------------------------------------------------

runtime! plugin/sensible.vim

" Mapleader {{{
let mapleader=","
" }}}

" Make vim more useful {{{
if !has('nvim')
  set nocompatible
endif
" }}}

" Syntax highlighting {{{
set t_Co=256
syntax on

" lifepillar/vim-solarized8
let g:solarized_use16 = 1
set background=dark
colorscheme solarized8_flat
" dirty patch for CursorLine
hi! CursorLine cterm=NONE gui=NONE ctermfg=NONE guifg=NONE ctermbg=237 guibg=#3c3d3a
" }}}

" Set some junk"{{{
set ambiwidth=double
set autoindent                             " Copy indent from last line when starting new line
set autoread                               " Reload files changed outside automatically
set backspace=indent,eol,start             " Allow backspacing over everything in insert mode
set cindent
set complete=.,w,b,u,t,i
set completeopt=noselect,menuone,preview
set colorcolumn=80
" set cursorcolumn                           " Highlight current column
" set cursorline                             " Highlight current line
set diffopt+=iwhite                        " Ignore whitespaces with vimdiff
set diffopt=filler                         " Add vertical spaces to keep right and left aligned
if !has('nvim')
  set encoding=utf-8 nobomb                " BOM often causes trouble
endif
set expandtab                              " Expand tabs to spaces
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,chinese
set fillchars+=vert:\                      " Styling vertical split borders
set foldcolumn=0                           " Column to show folds
set foldenable                             " Enable folding
" set foldlevel=0                            " Close all folds by default
set foldlevelstart=99                      " Open all folds by default
set foldmethod=marker                      " Syntax are used to specify folds
set foldminlines=0                         " Allow folding single lines
set foldnestmax=5                          " Set max fold nesting level
set formatoptions=
set formatoptions+=1                       " Break before 1-letter words
set formatoptions+=2                       " Use indent from 2nd line of a paragraph
" set formatoptions+=c                       " Format comments
set formatoptions+=l                       " Don't break lines that are already long
set formatoptions+=n                       " Recognize numbered lists
" set formatoptions+=o                       " Make comment when using o or O from comment line
set formatoptions+=q                       " Format comments with gq
" set formatoptions+=r                       " Continue comments by default
set history=1000                           " Increase history from 20 default to 1000
set hlsearch                               " Highlight searches
set incsearch                              " Highlight dynamically as pattern is typed
" :set indentkeys? - get full list of trigger keys.
set indentkeys=                            " DO NOT INTENT FOR ANY CHARACTERS
set laststatus=2                           " Always show status line
set lazyredraw                             " Don't redraw when we don't have to
set magic                                  " Enable extended regexes
set modeline
set nobackup
set noerrorbells                           " Disable error bells
set noignorecase                           " Don't ignore case of searches
set nojoinspaces                           " Only insert single space after a '.', '?' and '!' with a join command
set noshowmode                             " Don't show the current mode (lightline.vim takes care of us)
set nostartofline                          " Don't reset cursor to start of line when moving around
set notitle
set nu                                     " Enable line numbers
set omnifunc=syntaxcomplete#Complete       " Set omni-completion method
set regexpengine=1
set relativenumber
set ruler                                  " Show the cursor position
set scrolloff=3                            " Start scrolling three lines before horizontal border of window
set shiftwidth=2                           " The # of spaces for indenting
set shortmess=atI                          " Don't show the intro message when starting vim
set showcmd                                " display incomplete commands
set smartcase                              " Ignore 'ignorecase' if search patter contains uppercase characters
set smarttab                               " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces
set softtabstop=2                          " Tab key results in 2 spaces
set splitbelow                             " New window goes below
set splitright                             " New windows goes right
" set synmaxcol=256                          " Syntax coloring lines that are too long just slows down the world
set tabstop=2
set tags=./tags;
set timeout timeoutlen=1000 ttimeoutlen=0  " No delay for entering normal mode
if !has('nvim')
  set ttyfast                                " Send more characters at a given time
  set ttyscroll=3
endif
set undodir=~/.vim/.undo
set undofile                               " Persistent Undo
set undolevels=1000
set undoreload=10000
set wildchar=<Tab>                         " Character for CLI expansion (TAB-completion)
set wildmenu                               " Hitting TAB in command mode will show possible completions above command line
set wildmode=list:longest                  " Complete only until point of ambiguity
set wrap                                   " Wrap lines that are too long
set wrapscan                               " Searches wrap around end of file
set wildignore+=**/*.jpg,*.jpeg,*.gif,**/*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*

if has('nvim')
  " Get cmd+c work
  set mouse=
  " Switch cursor shape when using NeoVim
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 ""
  " Bring back ctrl-h
  nmap <BS> <C-W>h
endif
"}}}

" Configurations ------------------------------------------------------

" Leader Shortcuts"{{{
nnoremap <leader><leader> <c-^>
cnoremap %% <C-R>=expand('%:h').'/'<cr>

function! FlipBindingPry()
  if getline('.') =~? '^.*binding\.pry.*$'
    normal dd
  else
    normal orequire 'pry'; binding.pry
  endif
  write
endfunction

nnoremap <leader>bp :call FlipBindingPry()<CR>

map <leader>cc :ccl <bar> lcl<cr>
map <leader>cn :cn<cr>
map <leader>cp :cp<cr>

" Generate ctags
" nnoremap <leader>dc :Dispatch ctags -R --languages=-javascript --exclude=.git/ --exclude=log/ --exclude=build/ --exclude=target/ --exclude=node_modules/ --fields=+ialS --extras=+q .<CR>
nnoremap <leader>dc :VimuxPromptCommand<CR>ctags -R --languages=-javascript --exclude=.git/ --exclude=log/ --exclude=build/ --exclude=target/ --exclude=node_modules/ --fields=+ialS --extras=+q .<CR>
" Strip tailing white spaces
nnoremap <leader>dd :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" Generate ctags with jsctags, specifically for JavaScript
" nnoremap <leader>dj :Dispatch `find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; \| sed ''/^$/d'' \| LANG=C sort >\| tags`<CR>
nnoremap <leader>dj :VimuxPromptCommand<CR>`find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; \| sed ''/^$/d'' \| LANG=C sort >\| tags`<CR>
" Generate ctags with ripper-tags, specifically for Ruby
" nnoremap <leader>dr :Dispatch ripper-tags -R --exclude=.git/ --exclude=log/ --exclude=build/ --exclude=target/ --exclude=node_modules/ --force --fields=+n<CR>
" nnoremap <leader>dr :VimuxPromptCommand<CR>ripper-tags -R --exclude=.git/ --exclude=log/ --exclude=build/ --exclude=target/ --exclude=node_modules/ --force --fields=+n<CR>
" Generate ctags with custmized but faster ripper-tags function
nnoremap <leader>dr :VimuxPromptCommand<CR>rtags<CR>
" Generate ctags with ripper-tags, specifically for Ruby
" nnoremap <leader>dt :Dispatch ripper-tags -R --exclude=.git/ --exclude=log/ --exclude=build/ --exclude=target/ --exclude=node_modules/ --force --fields=+n<CR>
" nnoremap <leader>dt :VimuxPromptCommand<CR>ripper-tags -R --exclude=.git/ --exclude=log/ --exclude=build/ --exclude=target/ --exclude=node_modules/ --force --fields=+n<CR>
" Generate ctags with custmized but faster ripper-tags function
nnoremap <leader>dt :VimuxPromptCommand<CR>rtags<CR>

" vim-projectionist && vim-rails
map <leader>ec :Econtroller 
map <leader>ed :Eschema<cr>
map <leader>ef :Efixtures 
map <leader>eg :Emigration<cr>
map <leader>eh :Ehelper 
map <leader>ej :Ejavascript 
map <leader>em :Emodel 
map <leader>en :Echannel 
map <leader>ep :Etemplate 
map <leader>es :Espec 
map <leader>et :Etest 
map <leader>eu :Eunittest 
map <leader>ev :Eview 

" gitgutter.vim
map <leader>ga :GitGutterStageHunk<cr>
map <leader>gn :GitGutterNextHunk<cr>
map <leader>gp :GitGutterPrevHunk<cr>
map <leader>gu :GitGutterUndoHunk<cr>
map <leader>gv :GitGutterPreviewHunk<cr>

" vim-go
function! SetupMapForVimGo()
  " run :GoBuild or :GoTestCompile based on the go file
  function! s:build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
      call go#test#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
      call go#cmd#Build(0)
    endif
  endfunction

  nmap <leader>gb :<C-u>call <SID>build_go_files()<CR>
  " nmap <leader>gb  <Plug>(go-build)
  nmap <leader>gi <Plug>(go-info)
  nmap <leader>gr <Plug>(go-run)
  nmap <leader>gt <Plug>(go-test)

  nmap <leader>gs :<C-u>GoSameIds<CR>
  nmap <leader>gc :<C-u>GoSameIdsClear<CR>

  nmap <leader>gd :<C-u>GoDeclsDir<CR>
  nmap <leader>gl :<C-u>GoDecls<CR>
endfunction

autocmd FileType go call SetupMapForVimGo()

let g:go_def_mode = 'gopls'

" ALE
nmap <silent> <leader>lp <Plug>(ale_previous_wrap)
nmap <silent> <leader>ln <Plug>(ale_next_wrap)

" splitjoin.vim
nmap <leader>kj :SplitjoinJoin<cr>
nmap <leader>ks :SplitjoinSplit<cr>

" Delete all upcase marks
nmap mx :delmarks ABCDEFGHIJKLMNOPQRSTUVWXYZ<CR>
" Only show marks I care about
nmap ms :marks abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ<CR>

nnoremap <leader>p :let @* = expand("%")<cr>:echo @%<cr>

function! CloseAllBuffersButCurrent()
  let curr = bufnr("%")
  let last = bufnr("$")

  if curr > 1    | silent! execute "1,".(curr-1)."bd"     | endif
  if curr < last | silent! execute (curr+1).",".last."bd" | endif
endfunction
nmap <leader>q :call CloseAllBuffersButCurrent()<CR>

" Toggle RainbowParentheses
nmap <leader>rp :RainbowParentheses!!<CR>
" fzf-copy-ruby-token
nmap <leader>ry <Plug>(fzf_copy_ruby_token)

map <leader>so :source $MYVIMRC<cr>:e<cr>:RainbowParenthesesActivate<cr>
map <leader>ss :source ./Session.vim<cr>

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap <leader>ta <Plug>(EasyAlign)
" Start interactive EasyAlign in visual and select mode (e.g. gaip)
vmap <leader>ta <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <leader>ta <Plug>(EasyAlign)
xmap <leader>t= <Plug>(EasyAlign) =
vmap <leader>t= <Plug>(EasyAlign) =
nmap <leader>t= <Plug>(EasyAlign) =
xmap <leader>t: <Plug>(EasyAlign) :
vmap <leader>t: <Plug>(EasyAlign) :
nmap <leader>t: <Plug>(EasyAlign) :

map <leader>vr :tabe ~/.vimrc<CR>

" n,w to qucikly switch vim window
map <leader>w <C-W><C-W>

" system yank: will copy into the system clipboard on OS X
" vim has to be compiled with +clipboard to support this
vmap <leader>y "*y

map <leader>z :BufOnly<cr>

" format python code
autocmd FileType python nnoremap <leader>= :0,$!yapf<CR>

" Search and replace word under cursor (,*)
nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>
vnoremap <leader>* "hy:%s/\V<C-r>h//<left>
"}}}

" General"{{{
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun

augroup general_config
  autocmd!

  " Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l, Ctrl-p) {{{
  map <C-k> <C-W>k
  map <C-j> <C-W>j
  map <C-l> <C-W>l
  map <C-h> <C-W>h
  map <C-\> <C-W>p

  " }}}

  " Clear last search (Ctrl-n, ,h) {{{
  map <silent> <C-n> <Esc>:nohlsearch<CR>
  " }}}

  " Remap keys for auto-completion menu {{{
  inoremap <expr><tab>  pumvisible() ? "\<C-n>" : "\<tab>"
  inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<s-tab>"
  " }}}

  " Paste toggle (<F3>) {{{
  nnoremap <F3> :set invpaste paste?<CR>
  set pastetoggle=<F3>
  " }}}

  " Open selected text in https://carbon.now.sh {{{
  vnoremap <F5> :CarbonNowSh<CR>
  " }}}

  " Yank from cursor to end of line {{{
  nnoremap Y y$
  " }}}

  " Close all buffers but this one
  command! BufOnly silent! execute "%bd|e#|bd#"

  " Show git diff in tab"{{{
  command! GdiffInTab tabedit %|vsplit|Gdiff
  "}}}

  " }}}
  imap <c-c> <ESC>l
  "}}}

  " Remap increase number (Ctrl-p)"{{{
  " <c-a> is prefix for tmux
  " I used to use <c-i>, but that's useful for jumps.
  map <c-p> <c-a>
  "}}}

  " Quick move under insert mode (Ctrl-f, Ctrl-b)"{{{
  imap <c-f> <c-o>w
  imap <c-b> <c-o>b
  "}}}

  " Adjust window height"{{{
  au FileType qf call AdjustWindowHeight(3, 10)
  function! AdjustWindowHeight(minheight, maxheight)
    exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
  endfunction
  "}}}

  " Insert the current time (InsertTime)"{{{
  command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S')<cr>
  "}}}

  " Highlight trailing whitespace"{{{
  highlight ExtraWhitespace ctermbg=red guibg=red
  match ExtraWhitespace /\s\+$/
  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()
  "}}}

  " Remember last location when open a file"{{{
  " http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
  function! ResCur()
    let filetype = &ft
    if (line("'\"") <= line("$") && filetype != 'gitcommit')
      normal! g`"
      return 1
    endif
  endfunction

  augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
  augroup END
  "}}}

  " Set local omnifunc"{{{
  autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown,mkd setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  let g:omni_sql_no_default_maps = 1
  "}}}

  " dirty patch for hiding markdown error highlighting
  autocmd FileType markdown,mkd syn match markdownError "\w\@<=\w\@="
  " don't cindent for markdown files
  autocmd FileType markdown,mkd setlocal nocindent

  " Only use cursorline in current window and not when being in insert mode
  autocmd WinEnter    * set cursorline
  autocmd WinLeave    * set nocursorline
  autocmd InsertEnter * set nocursorline
  autocmd InsertLeave * set cursorline

  " Disable auto comment insertion
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

  augroup HiglightTODO
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO', -1)
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'FIXME', -1)
  augroup END

augroup END
"}}}

" Tagbar"{{{
nnoremap <F2> :TagbarToggle<CR>
let g:tagbar_sort = 1
let g:tagbar_iconchars = ['+', '-']
let g:tagbar_show_linenumbers=1
if executable('ripper-tags')
  " Configure Tagbar to user ripper-tags with ruby
  let g:tagbar_type_ruby = {
      \ 'kinds' : [
          \ 'm:modules',
          \ 'c:classes',
          \ 'f:methods',
          \ 'F:singleton methods',
          \ 'C:constants',
          \ 'a:aliases'
      \ ],
      \ 'ctagsbin':  'ripper-tags',
      \ 'ctagsargs': '--fields=+n -f -'
  \ }
endif
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent -R'
\ }
let g:tagbar_type_elixir = {
    \ 'ctagstype': 'elixir',
    \ 'kinds' : [
        \ 'm:modules',
        \ 'f:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'p:protocols',
        \ 'r:records',
    \ ]
\ }
"}}}

" vim-gitgutter"{{{
" vim-gitgutter will use Sign Column to set its color, reload it.
call gitgutter#highlight#define_highlights()

let g:gitgutter_max_signs = 1024
set signcolumn=yes
"}}}

" vim-fugitive"{{{
call SetupCommandAlias("GBlame", "Gblame")
call SetupCommandAlias("GBrowse", "Gbrowse")
"}}}

" vim-projectionist"{{{
let g:projectionist_heuristics = {
      \  "lib/": {
      \    "lib/db/model/*.rb": {
      \      "type": "model",
      \      "alternate": "test/integration/lib/db/model/{}.rb",
      \    },
      \  },
      \  "web/": {
      \    "web/channels/*.ex": {
      \      "type": "channel",
      \      "alternate": "test/channels/{}_test.exs"
      \    },
      \    "web/controllers/*.ex": {
      \      "type": "controller",
      \      "alternate": "test/controllers/{}_test.exs"
      \    },
      \    "web/models/*.ex": {
      \      "type": "model",
      \      "alternate": "test/models/{}_test.exs"
      \    },
      \    "web/views/*.ex": {
      \      "type": "view",
      \      "alternate": "test/views/{}_test.exs"
      \    },
      \    "web/templates/*.html.eex": {
      \      "type": "template",
      \    },
      \    "web/static/css/*": {
      \      "type": "stylesheet",
      \    },
      \    "web/static/js/*": {
      \      "type": "javascript",
      \    },
      \  },
      \  "test/": {
      \    "test/unit/lib/db/model/*.rb": {
      \      "type": "unittest",
      \      "alternate": "lib/db/model/{}.rb",
      \    },
      \    "test/integration/lib/db/model/*.rb": {
      \      "type": "test",
      \      "alternate": "lib/db/model/{}.rb",
      \    },
      \    "test/_lib/helpers/fake_data/*.rb": {
      \      "type": "fixtures",
      \      "alternate": "lib/db/model/{}.rb",
      \    },
      \    "test/channels/*_test.exs": {
      \      "type": "test",
      \      "alternate": "web/channels/{}.ex",
      \      "dispatch": "mix test --color {file}"
      \    },
      \    "test/controllers/*_test.exs": {
      \      "type": "test",
      \      "alternate": "web/controllers/{}.ex",
      \      "dispatch": "mix test --color {file}"
      \    },
      \    "test/models/*_test.exs": {
      \      "type": "test",
      \      "alternate": "web/models/{}.ex",
      \      "dispatch": "mix test --color {file}"
      \    },
      \    "test/views/*_test.exs": {
      \      "type": "test",
      \      "alternate": "web/views/{}.ex",
      \      "dispatch": "mix test --color {file}"
      \    },
      \  },
      \ }
"}}}

" vim-ruby"{{{
let g:ruby_path = system('echo $HOME/.rbenv/shims')
"}}}

" test.vim"{{{
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>
"}}}

" vroom.vim"{{{
let g:vroom_use_vimux=1
let g:vroom_map_keys=0

" Run the current file with vroom
map <leader>vs :VroomRunTestFile<CR>
" Runs the nearest test in the current file
map <leader>vn :VroomRunNearestTest<CR>
" Prompt for a command to run map
map <leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <leader>vl :VroomRunLastTest<CR>
" Inspect runner pane map
map <leader>vi :VimuxInspectRunner<CR>
" Close vim tmux runner opened by VimuxRunCommand
map <leader>vc :VimuxCloseRunner<CR>
" Interrupt any command running in the runner pane map
map <leader>vx :VimuxInterruptRunner<CR>

" when run unit test, also include current directory
" for bettern compatibility
if !exists("g:vroom_test_unit_command")
  let g:vroom_test_unit_command = 'ruby -Itest -I.'
endif
"}}}

" bufexplorer"{{{
let g:bufExplorerShowTabBuffer=1    " BufExplorer: show only buffers relative to this tab
let g:bufExplorerShowRelativePath=1 " BufExplorer: show relative paths
"}}}

" Gist.vim"{{{
let g:gist_post_private = 1
let g:gist_show_privates = 1
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype = 1
"}}}

" ALE {{{
augroup AutoALE
  autocmd!
  autocmd User ALELint call lightline#update()
augroup END

let g:ale_lint_on_text_changed = 'never' " lint only on save
let g:ale_lint_on_insert_leave = 0 " don't lint when leaving insert mode
let g:ale_lint_on_enter = 0 " don't lint on enter
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠ '
let g:ale_statusline_format = ['✗ %d', '⚠ %d', '']
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_set_highlights = 0
let g:ale_linters = {
      \   'coffee': [],
      \   'eruby': [],
      \   'go': ['gometalinter'],
      \   'html': ['htmlhint'],
      \   'javascript': ['eslint'],
      \   'yaml': [],
      \}
let g:ale_go_gometalinter_options = '--aggregate --disable-all --enable=golint --enable=goimports --enable=gosec --enable=ineffassign --enable=structcheck --enable=vet --sort=line -t --vendor --vendored-linters'
let g:ale_ruby_rubocop_executable = '.binstubs/rubocop'
"}}}

" Highlight Pmenu"{{{
highlight Pmenu ctermfg=lightgray ctermbg=black cterm=NONE
highlight PmenuSbar ctermfg=darkcyan ctermbg=lightgray cterm=NONE
highlight PmenuThumb ctermfg=lightgray ctermbg=darkcyan cterm=NONE
"}}}

" pay-server specific configs"{{{
function! SetupConfigForPayServer()
  let g:vroom_test_unit_command = 'pay test'
  let g:vroom_use_bundle_exec = 0
  let g:ale_ruby_rubocop_executable = 'scripts/bin/rubocop'
endfunction

autocmd BufRead,BufNewFile */stripe/pay-server/* call SetupConfigForPayServer()
"}}}

" UltiSnips"{{{
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsUsePythonVersion = 3
"}}}

" fzf.vim{{{
set rtp+=/usr/local/opt/fzf " fzf is installed using Homebrew
silent! nnoremap <unique> <silent> <leader>f :FZF<CR>
nnoremap <leader>aa :Ag<Space>
nnoremap <silent> <leader>ag :Ag <C-R><C-W><CR>
xnoremap <silent> <leader>ag y:Ag <C-R>"<CR>"
nnoremap <silent> <leader>AG :Ag <C-R><C-A><CR>
silent! nnoremap <unique> <silent> <leader>bb :Buffers<CR>
silent! nnoremap <unique> <silent> <leader>bl :BLines<CR>
nnoremap <leader>tj :Tags 
nnoremap <leader>tm :Marks<CR>
nnoremap <leader>ts :Tags 

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-d': 'split',
  \ 'ctrl-e': 'split',
  \ 'ctrl-v': 'vsplit' }
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Statement'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
if &columns >= 160
  let s:horiz_preview_layout = 'right:50%'
else
  let s:horiz_preview_layout = 'right:50%:hidden'
endif
let s:ag_opts = {"options": ["-d:"]}
" command! -bang -nargs=* Ag
"   \ call fzf#vim#ag(<q-args>,
"   \                 <bang>0 ? fzf#vim#with_preview(s:ag_opts, 'down:60%')
"   \                         : fzf#vim#with_preview(s:ag_opts, s:horiz_preview_layout, '?'),
"   \                 <bang>0)
command! -bang -nargs=* Ag
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview(s:ag_opts, 'down:50%')
  \           : fzf#vim#with_preview(s:ag_opts, s:horiz_preview_layout, '?'),
  \   <bang>0)
"}}}

" ctrlp.vim"{{{
silent! nnoremap <unique> <silent> <leader>cl :CtrlPClearCache<CR>
silent! nnoremap <unique> <silent> <leader>tt :CtrlPTag<CR>
silent! nnoremap <unique> <silent> <leader>d :CtrlP<CR>
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_by_filename = 0
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:20,results:20'
let g:ctrlp_map = '<\-t>'
let g:ctrlp_max_files = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_extensions = [ 'ctrlp-filetpe' ]
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_switch_buffer = 0
let g:ctrlp_mruf_max = 0
let g:ctrlp_mruf_relative = 1
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("h")': ['<c-d>', '<c-cr>', '<c-e>', '<c-x>'],
    \ 'ToggleByFname()':      ['<c-f>'],
    \}
nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v(_build|build|bower_components|deps|dist|node_modules|public|tmp|vendor\/bundle|elm-stuff)$',
  \ }
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files . -co --exclude-standard'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }
" let g:ctrlp_tjump_only_silent = 1
"}}}

" rainbow_parentheses.vim"{{{
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
augroup rainbow_activation
  autocmd!
  autocmd FileType clojure,json,lisp,ruby,scheme,yaml RainbowParentheses
augroup END
"}}}

" nerdtree"{{{
let NERDTreeWinSize = 30
let NERDTreeAutoCenter=1
let NERDTreeChDirMode=2
let g:NERDTreeMinimalUI=1
let g:NERDTreeHijackNetrw=1
let g:NERDTreeIgnore=['\~$']
nnoremap <F1> :call NERDTreeToggleInCurDir()<CR>
function! NERDTreeToggleInCurDir()
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  elseif (bufname('%') == '' || bufname('%') =~ 'Startify')
    exe ":NERDTreeToggle"
  else
    exe ":NERDTreeFind"
  endif
endfunction
"}}}

" ack.vim"{{{
let g:ack_use_dispatch=0
let g:ackhighlight=1
cnoreabbrev Ack Ack!
nnoremap <leader>ac :Ack!<Space>
if executable("rg")
  let g:ackprg="rg --vimgrep"
elseif executable("ag")
  let g:ackprg="ag --nocolor --nogroup --column"
elseif executable("ack")
  let g:ackprg="ack -H --nocolor --nogroup --column --no-smart-case"
endif
"}}}

" vim-ragtag"{{{
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1  = "inc"
" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags    = "li\|p"
"}}}

" Filetype detection"{{{
autocmd BufNewFile,BufRead Thorfile set filetype=ruby syntax=ruby
autocmd BufNewFile,BufRead *.thor set filetype=ruby syntax=ruby
autocmd BufNewFile,BufRead Gemfile set filetype=ruby syntax=ruby
autocmd BufNewFile,BufRead Capfile set filetype=ruby syntax=ruby
autocmd BufNewFile,BufRead pryrc set filetype=ruby syntax=ruby
autocmd BufNewFile,BufRead *.god set filetype=ruby syntax=ruby
autocmd BufNewFile,BufRead *.less set filetype=css
autocmd BufNewFile,BufRead *.mkd set ai formatoptions=tcroqn2 comments=n:>
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd BufNewFile,BufRead *.es6 set filetype=javascript
autocmd BufNewFile,BufRead *.go,*.c,*.cpp,*.rust,*.elm setlocal noexpandtab ts=4 sw=4 sts=4
autocmd Filetype gitcommit setlocal textwidth=78
autocmd FileType elixir set foldmethod=syntax
"}}}

" lightline.vim"{{{
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'filename'],
      \     ['ctrlpmark'],
      \   ],
      \   'right': [
      \     [ 'linter_checking', 'linter_errors', 'linter_warnings', 'lineinfo' ],
      \     ['winnr'],
      \     [ 'filetype' ],
      \   ]
      \ },
      \ 'inactive': {
      \   'left': [
      \     [ 'filename' ],
      \   ],
      \   'right': [
      \     [ 'lineinfo' ],
      \     [ 'winnr' ]
      \   ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \   'winnr': 'MyWinnr',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \ },
      \ 'component_type': {
      \   'linter_checking': 'left',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }
function! MyModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! MyWinnr()
  let fname = expand('%:t')
  let nr = winnr()
  return fname == 'ControlP' ? '' : nr
endfunction

function! MyFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ (
        \   fname == '__Tagbar__' ? g:lightline.fname :
        \   fname =~ '__Gundo\|NERD_tree' ? '' :
        \   &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \   &ft == 'unite' ? unite#get_status_string() :
        \   &ft == 'vimshell' ? vimshell#get_status_string() :
        \   ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \   ('' != fname ? fname : '[No Name]') .
        \   ('' != MyModified() ? ' ' . MyModified() : '')
        \ )
endfunction

function! MyFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = '⭠ '  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

" fix statusline after reloading vimrc
call lightline#update()
"}}}

" delimitMate"{{{
" remove ` and * from the quotes
let delimitMate_quotes = "\" '"
imap <silent> <BS> <C-R>=YcmOnDeleteChar()<CR><Plug>delimitMateBS

function! YcmOnDeleteChar()
  if pumvisible()
    return "\<C-y>"
  endif
  return ""
endfunction
"}}}

" startify"{{{
let g:startify_list_order = [
    \ ['   MRU:'],
    \ 'dir',
    \ ['   Bookmarks:'],
    \ 'bookmarks',
    \ ]
let g:startify_bookmarks = [
    \ {'v': '~/.vimrc'},
    \ {'b': '~/.bashrc'},
    \ {'g': '~/.gitconfig'},
    \ {'t': '~/.tmux.conf'}
    \ ]
let g:startify_change_to_dir = 0
"}}}

" deoplete.nvim"{{{
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
    \ 'auto_complete_delay': 100,
    \ 'max_list': 50,
    \ 'on_insert_enter': v:false,
    \ 'skip_chars': ['(', ')', '<', '>'],
    \ 'skip_multibyte': v:true,
    \ 'smart_case': v:true,
    \ })
autocmd FileType css,csv,html,json,tex,txt,yaml
    \ call deoplete#custom#buffer_option('auto_complete', v:false)
"}}}

" YouCompleteMe"{{{
" let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" let g:ycm_show_diagnostics_ui = 0
" let g:ycm_min_num_identifier_candidate_chars = 2
" let g:ycm_collect_identifiers_from_comments_and_strings = 1
" let g:ycm_semantic_triggers =  {
" 	\   'c' : ['->', '.', 're!\w{2}'],
" 	\   'cpp' : ['->', '.', '::', 're!\w{2}'],
" 	\   'java,javascript,typescript,python,scala,elixir,go' : ['.', 're!\w{2}'],
" 	\   'ruby' : ['.', '::', 're!\w{2}'],
" 	\   'lua' : ['.', ':', 're!\w{2}'],
" 	\   'erlang' : [':', 're!\w{2}'],
" 	\ }
"}}}

" elm-vim"{{{
let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 1
"}}}

" splitjoin.vim"{{{
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''
"}}}

" jedi-vim{{{
let g:jedi#goto_command = "<leader>xg"
let g:jedi#goto_assignments_command = ""
let g:jedi#goto_definitions_command = "<leader>xd"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = ""
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>xr"
let g:jedi#use_splits_not_buffers = "left"
"}}}

" vim-go{{{
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_gocode_autobuild = 0
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_list_type = "quickfix"
"}}}

" vim-rhubarb{{{
let g:github_enterprise_urls = ['https://git.corp.stripe.com']
"}}}

" tyru/open-browser.vim
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-open)
vmap gx <Plug>(openbrowser-open)

" starsearch.vim
" https://www.vim.org/scripts/script.php?script_id=4335
function! s:VStarsearch_searchCWord()
  let wordStr = expand("<cword>")
  if strlen(wordStr) == 0
    echohl ErrorMsg
    echo 'E348: No string under cursor'
    echohl NONE
    return
  endif

  if wordStr[0] =~ '\<'
    let @/ = '\<' . wordStr . '\>'
  else
    let @/ = wordStr
  endif

  let savedUnnamed = @"
  let savedS = @s
  normal! "syiw
  if wordStr != @s
    normal! w
  endif
  let @s = savedS
  let @" = savedUnnamed
endfunction

nnoremap <silent> * :call <SID>VStarsearch_searchCWord()<CR>:set hls<CR>
