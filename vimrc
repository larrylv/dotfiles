"
" Author:         Larry Lv <larrylv1990@gmail.com>
"

" Plugins -------------------------------------------------------------

" Load plugins {{{

filetype off

call plug#begin('~/.vim/bundle')

" Code Complete Engine
if !has('nvim')
  Plug 'Valloric/YouCompleteMe' ", { 'do': './install.py --clang-completer' }
else
  function! DoRemote(arg)
    UpdateRemotePlugins
  endfunction

  Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

  let g:deoplete#enable_at_startup = 1
endif

Plug 'vim-ruby/vim-ruby'
Plug 'elixir-lang/vim-elixir',              { 'for': ['elixir', 'eelixir'] }
Plug 'slashmili/alchemist.vim',             { 'for': ['elixir', 'eelixir'] }
Plug 'vim-erlang/vim-erlang-runtime',       { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-compiler',      { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-omnicomplete',  { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-tags',          { 'for': 'erlang' }
Plug 'ten0s/syntaxerl',                     { 'for': 'erlang' }
Plug 'guns/vim-clojure-static',             { 'for': 'clojure' }
Plug 'tpope/vim-fireplace',                 { 'for': 'clojure' }
Plug 'tpope/vim-classpath',                 { 'for': 'clojure' }
Plug 'tpope/vim-salve',                     { 'for': 'clojure' }
Plug 'guns/vim-sexp',                       { 'for': 'clojure' }
Plug 'vim-scripts/paredit.vim',             { 'for': 'clojure' }
Plug 'elmcast/elm-vim',                     { 'for': 'elm' }
Plug 'fatih/vim-go',                        { 'for': 'go' }
Plug 'davidhalter/jedi-vim',                { 'for': 'python' }
Plug 'fisadev/vim-isort',                   { 'for': 'python' }
Plug 'Vimjas/vim-python-pep8-indent',       { 'for': 'python' }
Plug 'pangloss/vim-javascript',             { 'for': 'javascript' }
Plug 'kchmck/vim-coffee-script',            { 'for': ['javascript', 'coffee', 'javascript.jsx'] }
Plug 'mxw/vim-jsx',                         { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/html5.vim',                    { 'for': ['html', 'eruby'] }
Plug 'mustache/vim-mustache-handlebars',    { 'for': ['html.mustache', 'html.handlebars'] }
Plug 'hail2u/vim-css3-syntax',              { 'for': ['css', 'sass', 'scss'] }
Plug 'ap/vim-css-color',                    { 'for': ['css', 'sass', 'scss'] }
Plug 'groenewege/vim-less',                 { 'for': 'less' }
Plug 'tpope/vim-haml',                      { 'for': 'haml' }
Plug 'cakebaker/scss-syntax.vim',           { 'for': 'scss' }
Plug 'tpope/vim-markdown',                  { 'for': 'markdown' }
Plug 'tudorprodan/html_annoyance.vim',      { 'for': ['html', 'eruby'] }
Plug 'lifepillar/vim-solarized8',           { 'commit': 'fe944794264d83d14fea120c70f9ed549bf7912e' }
Plug 'junegunn/fzf'
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
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-rhubarb'
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'tomtom/tcomment_vim'
Plug 'larrylv/vim-vroom'
Plug 'honza/vim-snippets'
Plug 'janko-m/vim-test'
Plug 'mileszs/ack.vim'
Plug 'itchyny/lightline.vim'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'Raimondi/delimitMate'
Plug 'benmills/vimux'
Plug 'eapache/rainbow_parentheses.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'vim-scripts/matchit.zip'
Plug 'mhinz/vim-startify'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'

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
set background=dark
colorscheme solarized8_dark_flat
" dirty patch
hi! CursorLine cterm=NONE gui=NONE ctermfg=NONE guifg=NONE ctermbg=237 guibg=#3c3d3a
" }}}

" Set some junk"{{{
set ambiwidth=double
set autoindent                             " Copy indent from last line when starting new line
set autoread                               " Reload files changed outside automatically
set backspace=indent,eol,start             " Allow backspacing over everything in insert mode
set cindent
set complete=.,w,b,u,t,i
set completeopt=longest,menu
" set cursorline                             " Highlight current line
set diffopt+=iwhite                        " Ignore whitespaces with vimdiff
set diffopt=filler                         " Add vertical spaces to keep right and left aligned
if !has('nvim')
  set encoding=utf-8 nobomb                " BOM often causes trouble
endif
set expandtab                              " Expand tabs to spaces
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,chinese
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
set tabstop=2
set tags=./tags;
set timeout timeoutlen=1000 ttimeoutlen=0  " No delay for entering normal mode
if !has('nvim')
  set ttyfast                                " Send more characters at a given time
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
map <leader>cc :ccl<cr>
map <leader>cn :cn<cr>
map <leader>cp :cp<cr>

" Generate ctags
nnoremap <leader>dc :Dispatch ctags -R --languages=-javascript --exclude=.git --exclude=log --exclude=target --fields=+ialS --extra=+q .<CR>
" Strip tailing white spaces
nnoremap <leader>dd :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
" Generate ctags with ripper-tags, specifically for Ruby
nnoremap <leader>dr :Dispatch ripper-tags -R --force --fields=+n<CR>
" Generate ctags with jsctags, specifically for JavaScript
nnoremap <leader>dj :Dispatch `find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; \| sed ''/^$/d'' \| LANG=C sort >\| tags`<CR>

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

" ALE
nmap <silent> <leader>lp <Plug>(ale_previous_wrap)
nmap <silent> <leader>ln <Plug>(ale_next_wrap)

" splitjoin.vim
nmap <leader>kj :SplitjoinJoin<cr>
nmap <leader>ks :SplitjoinSplit<cr>

map <leader>p :echo @%<cr>

function! CloseAllBuffersButCurrent()
  let curr = bufnr("%")
  let last = bufnr("$")

  if curr > 1    | silent! execute "1,".(curr-1)."bd"     | endif
  if curr < last | silent! execute (curr+1).",".last."bd" | endif
endfunction
nmap <Leader>q :call CloseAllBuffersButCurrent()<CR>

" CtrlP
map <leader>rc :CtrlP app/controllers<cr>
map <leader>rh :CtrlP app/helpers<cr>
map <leader>rm :CtrlP app/models<cr>
map <leader>rs :CtrlP spec<cr>
map <leader>rt :CtrlP test<cr>
map <leader>rv :CtrlP app/views<cr>

" provided by vim-rails
map <leader>sd :Sschema<cr>

map <leader>sg :sp Gemfile<cr>
map <leader>so :source $MYVIMRC<cr>
map <leader>sr :sp config/routes.rb<cr>
map <leader>ss :source ./Session.vim<cr>

map  <leader>sj :stjump 
map  <leader>st :stselect 

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

map  <leader>tj :tjump 
map  <leader>ts :tselect 

map <leader>vr :tabe ~/.vimrc<CR>

" n,w to qucikly switch vim window
map <leader>w <C-W><C-W>

" system yank: will copy into the system clipboard on OS X
vmap <leader>y :w !reattach-to-user-namespace pbcopy<CR><CR>

map <leader>z :CtrlPClearCache<cr>

" format python code
autocmd FileType python nnoremap <leader>= :0,$!yapf<CR>

" Search and replace word under cursor (,*)
nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>
vnoremap <leader>* "hy:%s/\V<C-r>h//<left>
"}}}

" General"{{{
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
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
  " }}}

  " Paste toggle (<F3>) {{{
  nnoremap <F3> :set invpaste paste?<CR>
  set pastetoggle=<F3>
  " }}}

  " Yank from cursor to end of line {{{
  nnoremap Y y$
  " }}}

  " Show git diff in tab"{{{
  command! GdiffInTab tabedit %|vsplit|Gdiff
  "}}}

  " }}}
  imap <c-c> <ESC>l
  "}}}

  " Remap increase number (Ctrl-i)"{{{
  " <c-a> is prefix for tmux
  map <c-i> <c-a>
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

  " Only use cursorline in current window and not when being in insert mode
  autocmd WinEnter    * set cursorline
  autocmd WinLeave    * set nocursorline
  autocmd InsertEnter * set nocursorline
  autocmd InsertLeave * set cursorline

  " Disable auto comment insertion
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

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

function! SetupVroomForPayServer()
  let g:vroom_test_unit_command = 'pay test'
  let g:vroom_use_bundle_exec = 0
endfunction

autocmd BufRead,BufNewFile */stripe/pay-server/* call SetupVroomForPayServer()
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

" ShowMarks.vim"{{{
let showmarks_enable = 1
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1
hi ShowMarksHLl ctermbg=Yellow  ctermfg=Black guibg=#FFDB72 guifg=Black
hi ShowMarksHLu ctermbg=Magenta ctermfg=Black guibg=#FFB3FF guifg=Black
"}}}

" ALE {{{
augroup AutoALE
  autocmd!
  autocmd User ALELint call lightline#update()
augroup END

let g:ale_lint_on_text_changed = 'never' " lint only on save
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
      \}
let g:ale_go_gometalinter_options = '
  \ --aggregate
  \ --fast
  \ --sort=line
  \ --vendor
  \ --vendored-linters
  \ --disable=gas
  \ --disable=goconst
  \ --disable=gocyclo
  \ '
"}}}

" Highlight Pmenu"{{{
highlight Pmenu guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
highlight PmenuSbar guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
highlight PmenuThumb guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE
"}}}

" UltiSnips"{{{
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsUsePythonVersion = 2
"}}}

" fzf.vim{{{
set rtp+=/usr/local/opt/fzf " fzf is installed using Homebrew
silent! nnoremap <unique> <silent> <leader>f :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-d': 'split',
  \ 'ctrl-e': 'split',
  \ 'ctrl-v': 'vsplit' }
"}}}

" ctrlp.vim"{{{
silent! nnoremap <unique> <silent> <leader>bb :CtrlPBuffer<CR>
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
" let g:ctrlp_tjump_only_silent = 1
"}}}

" rainbow_parentheses.vim"{{{
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
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
" ,a to Ack (search in files)
let g:ack_use_dispatch=0
let g:ackhighlight=1
cnoreabbrev Ack Ack!
nnoremap <leader>a :Ack!<Space>
if executable("ag")
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
autocmd Filetype gitcommit setlocal textwidth=78
autocmd FileType go,c,cpp,rust,elm set ts=4 sw=4 sts=4 et
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
      \     [ 'ale', 'lineinfo' ],
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
      \   'ale': 'ALEGetStatusLine',
      \ },
      \ 'component_type': {
      \   'ale': 'error',
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

" YouCompleteMe"{{{
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
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
let g:go_fmt_fail_silently = 1
let g:go_gocode_autobuild = 0
"}}}

" vim-rhubarb{{{
let g:github_enterprise_urls = ['https://git.corp.stripe.com']
"}}}
