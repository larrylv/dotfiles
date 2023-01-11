"
" Author:         Larry Lv <larrybayarea@gmail.com>
"

" ╭────────────────────────────────────────────────────────────────────╮
" │                               Plugins                              │
" ╰────────────────────────────────────────────────────────────────────╯

filetype off

call plug#begin('~/.vim/bundle')

" colorscheme & statusline & tabline
Plug 'lifepillar/vim-solarized8'
Plug 'itchyny/lightline.vim'
Plug 'larrylv/lightline-solarized'
Plug 'maximbaz/lightline-ale'

" find & search & tjump
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ivalkeen/vim-ctrlp-tjump'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'mileszs/ack.vim'

" linter & lsp & completion
Plug 'dense-analysis/ale'
Plug 'larrylv/coc.nvim', {'commit': '7c9ecac53f0c2e0363606d0fdce59a41910c330f'} " own fork that suppress error messages
Plug 'larrylv/vim-tagimposter'                 " populate the tagstack when using coc to jump to definitions
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" explorer
Plug 'larrylv/defx.nvim',  { 'do': ':UpdateRemotePlugins' } " own fork to not open chosen file in existing bufnr

" editing
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'majutsushi/tagbar'                " show tagbar with F2
Plug 'tpope/vim-obsession'              " record a session with :Obsession
Plug 'tpope/vim-projectionist'          " alternate files with :AV/:AS
Plug 'tpope/vim-surround'               " cs`' to change `` to '', etc
Plug 'tpope/vim-abolish'                " MixedCase (crm), camelCase (crc), snake_case (crs), UPPER_CASE (cru) and dash-case (cr-).
Plug 'tpope/vim-repeat'                 " enable repeating supported plugin maps with `.`
Plug 'tpope/vim-unimpaired'             " [<Space> and ]<Space> to add newlines. [q and ]q for :cprevious and :cnext
Plug 'tpope/vim-eunuch'                 " shell commands like :Delete, :SudoWrite, etc
Plug 'tpope/vim-speeddating'            " enhance CTRL-A and CTRL-X
Plug 'tpope/vim-sensible'               " a universal set of defaults defined by tpope
Plug 'tpope/vim-endwise'                " add `end` or similar keywords automatically
Plug 'tpope/vim-rsi'                    " readline mapping for insert/command mode like <C-a> to beginning of line.
Plug 'kshenoy/vim-signature'            " show marks in the gutter
Plug 'AndrewRadev/splitjoin.vim'        " split/join single line/multiline
Plug 'tomtom/tcomment_vim'              " comment with `gcc`
Plug 'larrylv/vim-trailing-whitespace'  " show trailing whitespace
Plug 'tyru/open-browser.vim'            " gx to open browser
Plug 'junegunn/vim-easy-align'          " align multiple lines
Plug 'junegunn/rainbow_parentheses.vim' " rainbow parentheses
Plug 'kana/vim-textobj-user'            " create text objects, depended by vim-textobj-rubyblock
Plug 'nelstrom/vim-textobj-rubyblock'   " ar selects all of a ruby block, ir selects the inner portion of a rubyblock
Plug 'Raimondi/delimitMate'             " auto-completion for quotes, parens, brackets, etc.
Plug 'mhinz/vim-startify'               " fancy start screen
Plug 'powerman/vim-plugin-AnsiEsc'      " ansi escape sequences concealed, but highlighted as specified
Plug 'kristijanhusak/vim-carbon-now-sh' " open selected text in https://carbon.now.sh
Plug 'Yggdroot/indentLine'              " display the indention levels with thin vertical lines
Plug 'Einenlum/yaml-revealer'           " A vim plugin to easily navigate through Yaml files
" Plug 'mg979/vim-visual-multi'           " Multiple cursors plugin
" Plug 'puremourning/vimspector'          " A multi-language debugging system for Vim
" Plug 'folke/which-key.nvim'             " displays a popup with possible keybindings of the command you started typing

" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb', { 'commit': '2590324d7fdaf0c6311fad4ee2a2878acaaec42d' } " Gbrowse
Plug 'airblade/vim-gitgutter'  " shows git diff markers in the sign column
Plug 'rhysd/git-messenger.vim' " <leader>gm to reveal the commit messages under the cursor

" test
Plug 'vim-test/vim-test'
Plug 'benmills/vimux' " easily interact with tmux from vim

" ruby
Plug 'larrylv/vim-vroom', { 'for': 'ruby' } " run ruby tests using vimux

" go
Plug 'fatih/vim-go',        " { 'for': ['go', 'vim'], 'do': ':GoUpdateBinaries' }
Plug 'visualfc/gocode',       { 'for': ['go', 'vim'], 'rtp': 'vim', 'do': '~/.vim/bundle/gocode/vim/symlink.sh' }
Plug 'benmills/vimux-golang', { 'for': 'go' } " run go tests using vimux

" elixir & erlang
Plug 'elixir-lang/vim-elixir',              { 'for': ['elixir', 'eelixir'] }
Plug 'slashmili/alchemist.vim',             { 'for': ['elixir', 'eelixir'] }
Plug 'vim-erlang/vim-erlang-runtime',       { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-compiler',      { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-omnicomplete',  { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-tags',          { 'for': 'erlang' }
Plug 'ten0s/syntaxerl',                     { 'for': 'erlang' }

" rust
Plug 'rust-lang/rust.vim',                  { 'for': 'rust' }

" scala
Plug 'derekwyatt/vim-scala',                { 'for': 'scala' }

" clojure
Plug 'guns/vim-clojure-static',             { 'for': 'clojure' }
Plug 'tpope/vim-fireplace',                 { 'for': 'clojure' }
Plug 'tpope/vim-classpath',                 { 'for': 'clojure' }
Plug 'tpope/vim-salve',                     { 'for': 'clojure' }
Plug 'guns/vim-sexp',                       { 'for': 'clojure' }
Plug 'vim-scripts/paredit.vim',             { 'for': 'clojure' }
Plug 'clojure-vim/async-clj-omni',          { 'for': 'clojure' }

" python
Plug 'davidhalter/jedi-vim',                { 'for': 'python' }
Plug 'fisadev/vim-isort',                   { 'for': 'python' }
Plug 'Vimjas/vim-python-pep8-indent',       { 'for': 'python' }

" frontend & markdown
Plug 'pangloss/vim-javascript',             { 'for': 'javascript' }
Plug 'othree/html5.vim',                    { 'for': ['html', 'eruby'] }
Plug 'mustache/vim-mustache-handlebars',    { 'for': ['html.mustache', 'html.handlebars'] }
Plug 'hail2u/vim-css3-syntax',              { 'for': ['css', 'sass', 'scss'] }
Plug 'ap/vim-css-color',                    { 'for': ['css', 'sass', 'scss'] }
Plug 'groenewege/vim-less',                 { 'for': 'less' }
Plug 'tpope/vim-haml',                      { 'for': 'haml' }
Plug 'cakebaker/scss-syntax.vim',           { 'for': 'scss' }
Plug 'tudorprodan/html_annoyance.vim',      { 'for': ['html', 'eruby'] }
Plug 'godlygeek/tabular',                   { 'for': 'markdown' }
Plug 'preservim/vim-markdown',              { 'for': 'markdown' }
Plug 'tpope/vim-ragtag',                    " A set of mappings for HTML, XML, etc.

" elm
Plug 'elmcast/elm-vim',                     { 'for': 'elm' }

" puppet
Plug 'rodjek/vim-puppet'

" function to source a file if it exists
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction

" load private overlay packages
call SourceIfExists('~/.config/nvim/layers/private/packages.vim')

" Add plugins to &runtimepath
call plug#end()

filetype plugin indent on

" ================================= GENERAL CONFIG =============================

runtime! plugin/sensible.vim

let mapleader=","

" Make vim more useful
if !has('nvim')
  set nocompatible
endif

" Syntax highlighting
set t_Co=256
syntax on

" lifepillar/vim-solarized8
let g:solarized_use16 = 1
let g:solarized_visibility = "high"
let g:solarized_termtrans = 1
let g:solarized_extra_hi_groups = 0
set background=dark
colorscheme solarized8_flat
" dirty patch for CursorLine
hi! CursorLine cterm=NONE gui=NONE ctermfg=NONE guifg=NONE ctermbg=237 guibg=#3c3d3a
hi! CursorLineNr cterm=NONE gui=NONE ctermfg=NONE guifg=NONE ctermbg=NONE guibg=NONE

" set ambiwidth=double
set autoindent                             " Copy indent from last line when starting new line
set autoread                               " Reload files changed outside automatically
set backspace=indent,eol,start             " Allow backspacing over everything in insert mode
set cindent
set complete=.,w,b,u,t,i
set completeopt=noinsert,noselect,menuone
" set colorcolumn=81                       " Highlight line at position 81
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
" set indentkeys=                            " DO NOT INTENT FOR ANY CHARACTERS
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
set redrawtime=10000
set relativenumber
set noruler                                " Don't show the line and column number of the cursor position. lightline has it already.
set scrolloff=3                            " Start scrolling three lines before horizontal border of window
set shiftwidth=2                           " The # of spaces for indenting
set shortmess=atI                          " Don't show the intro message when starting vim
set shortmess+=c                           " This prevents the display of "Pattern not found" & similar messages during completion.
set shortmess+=F                           " Don't give the file info when editing a file, like :silent as used for the command
set showtabline=2                          " Show tab bar all the time
" set showcmd                                " display incomplete commands
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

if !has('nvim')
  function! SetRegexpEngine()
    let filetype = &ft
    if (filetype == 'ruby')
      setlocal regexpengine=1 " https://github.com/vim-ruby/vim-ruby/issues/243
    else
      setlocal regexpengine=0 " https://jameschambers.co.uk/vim-typescript-slow
    endif
  endfunction

  augroup regexpEngine
    autocmd!
    autocmd WinEnter,VimEnter,GUIEnter,BufEnter,TabEnter * call SetRegexpEngine()
  augroup END
else
  set regexpengine=0
endif

if has('nvim')
  " Get cmd+c work
  set mouse=
  " Switch cursor shape when using NeoVim
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1 ""
  " Bring back ctrl-h
  nmap <BS> <C-W>h
endif

augroup general_config
  autocmd!

  " Toggle Tagbar (<F2>)
  nnoremap <F2> :TagbarToggle<cr>

  " Adjust window height
  au FileType qf call AdjustWindowHeight(3, 10)
  function! AdjustWindowHeight(minheight, maxheight)
    exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
  endfunction

  " Insert the current time (InsertTime)
  command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S')<cr>

  " Change SpecialKey color for Tagbar + Golang
  highlight SpecialKey term=bold cterm=bold ctermfg=9 guifg=Cyan

  " Remember last location when open a file
  " http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
  function! ResCur()
    let filetype = &ft
    if (line("'\"") <= line("$") && filetype != 'gitcommit')
      silent! normal! g`"
      return 1
    endif
  endfunction

  augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
  augroup END

  autocmd FileType ruby,eruby setlocal indentkeys=0{,0},0),0],!^F,o,O,e,=end,=else,=elsif,=when,=ensure,=rescue,==begin,==end,=private,=protected,=public

  " Set local omnifunc
  autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown,mkd setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  let g:omni_sql_no_default_maps = 1

  " dirty patch for hiding markdown error highlighting
  autocmd FileType markdown,mkd syn match markdownError "\w\@<=\w\@="
  " don't cindent for markdown files
  autocmd FileType markdown,mkd setlocal nocindent

  " Only use cursorline in all windows and not when being in insert mode
  autocmd WinEnter,VimEnter,GUIEnter,BufEnter,TabEnter * set cursorline
  autocmd InsertEnter                                  * set nocursorline
  autocmd InsertLeave                                  * set cursorline

  " Disable auto comment insertion
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

  augroup HiglightTODO
    autocmd!
    autocmd WinEnter,VimEnter,GUIEnter,BufEnter,TabEnter * :silent! call matchadd('Todo', 'TODO', -1)
    autocmd WinEnter,VimEnter,GUIEnter,BufEnter,TabEnter * :silent! call matchadd('Todo', 'FIXME', -1)
  augroup END

  " Cursor Mode Settings https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
  " SI = INSERT mode
  " SR = REPLACE mode
  " EI = NORMAL mode (ELSE)
  if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif

  highlight Pmenu ctermfg=lightgray ctermbg=black cterm=NONE
  highlight PmenuSbar ctermfg=darkcyan ctermbg=lightgray cterm=NONE
  highlight PmenuThumb ctermfg=lightgray ctermbg=darkcyan cterm=NONE

  " Filetype detection
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
  autocmd BufNewFile,BufRead *.md setlocal textwidth=80
  autocmd Filetype gitcommit setlocal textwidth=78
  autocmd Filetype gitcommit,markdown set colorcolumn=81
  autocmd FileType elixir set foldmethod=syntax
augroup END


" ================================= GENERAL MAPPINGS ===========================

" leader Shortcuts
nnoremap <leader><leader> <c-^>
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l, Ctrl-p)
map <C-k> <C-W>k
map <C-j> <C-W>j
map <C-l> <C-W>l
map <C-h> <C-W>h
map <C-\> <C-W>p

" Go to previous (last accessed) window.
map <C-w>\ <C-w><C-p>
map <C-w><C-\> <C-w><C-p>

" Clear last search (Ctrl-n, ,h)
map <silent> <C-n> <Esc>:nohlsearch<cr>

" Remap keys for auto-completion menu
inoremap <expr><tab>  pumvisible() ? "\<C-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<s-tab>"

" Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Paste toggle (<F3>)
nnoremap <F3> :set invpaste paste?<cr>
set pastetoggle=<F3>

" Open selected text in https://carbon.now.sh
vnoremap <F5> :CarbonNowSh<cr>

" Yank from cursor to end of line
nnoremap Y y$

imap <c-c> <ESC>l

" Remap increase number (Ctrl-p)
" <c-a> is prefix for tmux
" I used to use <c-i>, but that's useful for jumps.
map <c-p> <c-a>

" Quick move under insert mode (Ctrl-f, Ctrl-b)
imap <c-f> <c-o>w
imap <c-b> <c-o>b

" Use Alt + number to swtich tabs
nnoremap <M-1> 1gt
nnoremap <M-2> 2gt
nnoremap <M-3> 3gt
nnoremap <M-4> 4gt
nnoremap <M-5> 5gt
nnoremap <M-6> 6gt
nnoremap <M-7> 7gt
nnoremap <M-8> 8gt
nnoremap <M-9> 9gt

function! FlipBindingPry()
  if getline('.') =~? '^.*binding\.pry.*$'
    normal dd
  else
    normal orequire 'pry'; binding.pry
  endif
  write
endfunction

nnoremap <leader>bp :call FlipBindingPry()<cr>

map <leader>cc :ccl <bar> lcl<cr>
map <leader>cn :cn<cr>
map <leader>cp :cp<cr>

" toggle colorcolumn=81
nnoremap <silent><leader>co :execute "set colorcolumn=" . (&colorcolumn == "" ? "81" : "")<cr>

" strip tailing white spaces
nnoremap <leader>dd :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<cr>

" increase window horizontal size
map <leader>ni <C-W>>
map <leader>n+ <C-W>>
map <leader>+ <C-W>>
map <leader>= <C-W>>
" decrease window horizontal size
map <leader>nd <C-W><
map <leader>n- <C-W><
map <leader>_ <C-W><
map <leader>- <C-W><
" increase a window to its maximum height
map <leader>nh <C-W>_
" increase a window to its maximum width
map <leader>nw <C-W>\|

nnoremap <leader>p :let @* = expand("%")<cr>:echo @%<cr>

" clsoe all buffers except for the current one
command! BufOnly silent! execute "%bd!|e#|bd#"
nmap <leader>q :BufOnly<cr>

" only show marks / bookmarks I care about
nmap <leader>sm :marks abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ<cr>

map <leader>so :source $MYVIMRC<cr>:e<cr>:RainbowParentheses<cr>

function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

nmap <leader>sp :call <SID>SynStack()<cr>

" close all other tabs
nnoremap <leader>to :tabonly<cr>

" open a buffer in a new tab
nnoremap <leader>tt :tabe<cr>

map <leader>vr :tabe ~/.vimrc<cr>

" n,w to qucikly switch vim window
map <leader>w <C-W><C-W>

" delete all upcase marks / bookmarks
nmap <leader>xm :delmarks ABCDEFGHIJKLMNOPQRSTUVWXYZ<cr>:wviminfo!<cr>

" system yank: will copy into the system clipboard on OS X
" vim has to be compiled with +clipboard to support this
vmap <leader>y "*y

" close all hidden buffers
function! DeleteHiddenBuffers()
  let tpbl=[]
  let closed = 0
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
    if getbufvar(buf, '&mod') == 0
      silent execute 'bwipeout' buf
      let closed += 1
    endif
  endfor
  echo "Closed ".closed." hidden buffers"
endfunction

nnoremap <leader>z :call DeleteHiddenBuffers()<cr>

" keep selected text selected when fixing indentation
vnoremap < <gv
vnoremap > >gv

" no Ex mode
map Q <Nop>

" format python code
autocmd FileType python nnoremap <leader>s= :0,$!yapf<cr>

" search and replace word under cursor (,*)
nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>
vnoremap <leader>* "hy:%s/\V<C-r>h//<left>


" ================================= ack ========================================
let g:ack_use_dispatch=0
let g:ackhighlight=1
cnoreabbrev Ack Ack!
nnoremap <leader>ac :Ack!<Space>
nnoremap <silent> <leader>ak :Ack! <C-R><C-W><cr>
xnoremap <silent> <leader>ak y:Ack! <C-R>"<cr>
if executable("rg")
  let g:ackprg="rg --vimgrep --color=never"
elseif executable("ag")
  let g:ackprg="ag --nocolor --nogroup --column"
elseif executable("ack")
  let g:ackprg="ack -H --nocolor --nogroup --column --no-smart-case"
endif


" ================================= ale ========================================
augroup AutoALE
  autocmd!
  autocmd User ALELint call lightline#update()
augroup END

let g:ale_disable_lsp = 1
let g:ale_lint_on_text_changed = 'never' " lint only on save
let g:ale_lint_on_insert_leave = 0 " don't lint when leaving insert mode
let g:ale_lint_on_enter = 0 " don't lint on enter
let g:ale_hover_cursor = 0 " disable ALEHover (ALEPreviewWindow)
let g:ale_set_balloons = 1 " By showing balloons for your mouse cursor
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠ '
let g:ale_statusline_format = ['✗ %d', '⚠ %d', '']
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_set_highlights = 0
let g:ale_sign_priority = 100
let g:ale_linters = {
      \  'coffee': [],
      \  'eruby': [],
      \  'go': ['golangci-lint'],
      \  'rust': ['analyzer'],
      \  'html': ['htmlhint'],
      \  'javascript': ['eslint'],
      \  'javascript.jsx': ['eslint'],
      \  'javascriptreact': ['eslint'],
      \  'ruby': ['rubocop'],
      \  'markdown': [],
      \  'sh': [],
      \  'typescriptreact': ['eslint'],
      \  'typescript': ['eslint'],
      \  'vim': [],
      \  'yaml': [],
      \}
let g:ale_fixers = {
      \  'javascript': ['eslint'],
      \  'javascript.jsx': ['eslint'],
      \  'javascriptreact': ['eslint'],
      \  'typescriptreact': ['eslint'],
      \  'typescript': ['eslint'],
      \}

let g:ale_go_golangci_lint_package = 1
let g:ale_go_golangci_lint_options = ''

let g:ale_fix_on_save = 1
" disable linting for all minified JS files
let g:ale_pattern_options = {
      \ '\.min.js$': {'ale_enabled': 0},
      \}

nmap <silent> <leader>lp <Plug>(ale_previous_wrap)
nmap <silent> <leader>ln <Plug>(ale_next_wrap)


" ================================= coc ========================================
let g:coc_snippet_next = '<tab>'

" Disable transparent cursor when CocList is activated.
let g:coc_disable_transparent_cursor = 1

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-n> coc#refresh()

" coc will install missing extensions after coc.nvim service starts.
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-omni',
  \ 'coc-rust-analyzer',
  \ 'coc-tag',
  \ ]

" this is commented out because vim-go already does this
" autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

function! ToggleOutline() abort
  let winid = coc#window#find('cocViewId', 'OUTLINE')
  if winid == -1
    call CocActionAsync('showOutline')
  else
    call coc#window#close(winid)
  endif
endfunction
autocmd FileType go nnoremap <F2> :call ToggleOutline()<cr>

function! g:CocShowDocumentation()
  " supports jumping to vim documentation as well using built-ins.
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

nnoremap <leader>ci :CocInfo<cr>
nnoremap <leader>cr :CocRestart<cr>

" jump to definition(s) of current symbol
nnoremap <silent> <c-]> :<C-u> TagImposterAnticipateJump <Bar> call CocAction('jumpDefinition', v:false)<cr>
nnoremap <silent> <leader>ld :<C-u> TagImposterAnticipateJump <Bar> call CocAction('jumpDefinition')<cr>
nnoremap <silent> <leader>lv :<C-u> TagImposterAnticipateJump <Bar> call CocAction('jumpDefinition', 'vsplit')<cr>
nnoremap <silent> <leader>ls :<C-u> TagImposterAnticipateJump <Bar> call CocAction('jumpDefinition', 'split')<cr>
nnoremap <silent> <leader>lt :<C-u> TagImposterAnticipateJump <Bar> call CocAction('jumpDefinition', 'tabe')<cr>

" jump to references of current symbol
nmap <silent> <leader>lf <Plug>(coc-references)
" jump to declaration(s) of current symbol
nmap <silent> <leader>lc <Plug>(coc-declaration)
" jump to implementation(s) of current symbol
nmap <silent> <leader>li <Plug>(coc-implementation)
" rename symbol under cursor
nmap <silent> <leader>lr <Plug>(coc-rename)
" show documentation of current symbol
nnoremap <silent> K :call CocShowDocumentation()<cr>

" redraw the status line when coc#status changes
augroup AutoCocStatus
  autocmd!
  autocmd User CocStatusChange call lightline#update()
augroup END


" ================================= ctrlp ======================================
" silent! nnoremap <unique> <silent> <leader>cl :CtrlPClearCache<cr>
" silent! nnoremap <unique> <silent> <leader>tt :CtrlPTag<cr>
" silent! nnoremap <unique> <silent> <leader>d :CtrlP<cr>
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_by_filename = 0
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:20,results:20'
let g:ctrlp_map = '<C-q>'
let g:ctrlp_max_files = 0
let g:ctrlp_max_history = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_extensions = [ 'ctrlp-filetpe' ]
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_switch_buffer = 0
let g:ctrlp_mruf_max = 0
let g:ctrlp_mruf_relative = 1
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("h")': ['<c-d>', '<c-cr>', '<c-e>', '<c-s>'],
    \ 'ToggleByFname()':      ['<c-f>'],
    \ 'PrtHistory(-1)':       [],
    \ 'PrtHistory(1)':        [],
    \ 'PrtSelectMove("j")':   ['<c-j>', '<c-n>', '<down>'],
    \ 'PrtSelectMove("k")':   ['<c-k>', '<c-p>', '<up>'],
    \}
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

" disable c-] mapping with ctrlp-tjump
" prefer using c-] with coc and lsp
" nnoremap <c-]> :CtrlPtjump<cr>
" vnoremap <c-]> :CtrlPtjumpVisual<cr>

nnoremap <leader>tp :CtrlPtjump<cr>
vnoremap <leader>tp :CtrlPtjumpVisual<cr>


" ================================= defx =======================================
autocmd FileType defx call MyDefxSettings()
function! MyDefxSettings() abort
  setlocal nonu
  setlocal norelativenumber

  highlight! default link Defx_filename_root Statement
  highlight! default link Defx_filename_root_marker Statement
  highlight! default link Defx_icon_root_icon Statement
  highlight! default link Defx_filename_directory Directory
  highlight! default link Defx_icon_directory_icon Directory
  highlight! default link Defx_icon_opened_icon Directory

  " Define mappings
  nnoremap <silent><buffer><expr> o
        \ defx#is_directory() ?
        \ defx#do_action('open_tree', 'toggle') :
        \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> <cr>
        \ defx#is_directory() ?
        \ defx#do_action('open_tree', 'toggle') :
        \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> c
        \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> C
        \ defx#do_action('close_tree')
  nnoremap <silent><buffer><expr> P
        \ defx#do_action('search', fnamemodify(defx#get_candidate().action__path, ':h'))
  nnoremap <silent><buffer><expr> m
        \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
        \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> s
        \ defx#do_action('multi', [['drop', 'split']])
  nnoremap <silent><buffer><expr> v
        \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> K
        \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
        \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
        \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> d
        \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
        \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> yy
        \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> q
        \ defx#do_action('quit')
  " nnoremap <silent><buffer><expr> <Space>
  "       \ defx#do_action('toggle_select') . 'j'
  " nnoremap <silent><buffer><expr> *
  "       \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
        \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
        \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> R
        \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> > '10<C-W>>'
  nnoremap <silent><buffer><expr> < '10<C-W><'
  nnoremap <silent><buffer><expr> <leader>p
        \ defx#do_action('print')
  nnoremap <silent><buffer><expr> P
        \ defx#do_action('search', fnamemodify(defx#get_candidate().action__path, ':h'))
endfunction

call defx#custom#option('_', {
      \ 'root_marker': '',
      \ 'columns': 'indent:icon:filename',
      \ 'winwidth': 50,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ })

call defx#custom#column('icon', {
      \ 'directory_icon': '▸ ',
      \ 'file_icon': '  ',
      \ 'opened_icon': '▾ ',
      \ 'root_icon': '  ',
      \ })

call defx#custom#column('indent', {
      \ 'indent': '  ',
      \ })

call defx#custom#column('filename', {
      \ 'min_width': 80,
      \ 'max_width': 120,
      \ })

nnoremap <silent><F1> :Defx `getcwd()` -search_recursive=`expand('%:p')` -toggle -buffer-name=` tabpagenr()`<cr>
" Move the cursor to the already-open Defx, and then switch back to the file
nnoremap <silent><leader>dn :Defx `getcwd()` -search_recursive=`expand('%:p')` -no-focus -buffer-name=` tabpagenr()`<cr>


" ================================= delimitMate ================================
" remove ` and * from the quotes
let delimitMate_quotes = "\" '"
" remove <> from match pairs
let delimitMate_matchpairs = "(:),[:],{:}"


" ================================= easy-align =================================
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
xmap <leader>t" <Plug>(EasyAlign) "
vmap <leader>t" <Plug>(EasyAlign) "
nmap <leader>t" <Plug>(EasyAlign) "


" ================================= elm ========================================
let g:elm_setup_keybindings = 0
let g:elm_format_autosave = 1


" ================================= fugitive & rhubarb =========================
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun

call SetupCommandAlias("GBlame", "Git blame")
call SetupCommandAlias("Gblame", "Git blame")
call SetupCommandAlias("Gbrowse", "GBrowse")
call SetupCommandAlias("Gbrowse!", "GBrowse!")

let g:github_enterprise_urls = ['https://git.corp.stripe.com']

map <leader>gb :Git blame<cr>
" copy github / ghe link
map <leader>gl :GBrowse!<cr>
map <leader>gr :GBrowse!<cr>
vmap <leader>gl :GBrowse!<cr>
vmap <leader>gr :GBrowse!<cr>
" open github / ghe link
nmap <leader>go :GBrowse<cr>
vmap <leader>go :GBrowse<cr>


" ================================= fzf ========================================
set rtp+=/usr/local/opt/fzf " fzf is installed using Homebrew
" - Popup window (center of the screen)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
" hidden by default, ctrl-\ to toggle
" let g:fzf_preview_window = ['right:hidden', 'ctrl-\']

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-d': 'split',
  \ 'ctrl-e': 'split',
  \ 'ctrl-v': 'vsplit' }

" mostly borrowed from fzf-copy-ruby-token, with customized layout
function! FzfCopyRubyTokenFn(token)
  let source_lines = FzfCopyRubyTokenSourceLines(a:token)

  if len(source_lines) == 0
    echohl WarningMsg
    echo 'Token not found in current buffer: ' . a:token
    echohl None
  elseif len(source_lines) == 1
    call FzfCopyRubyTokenCopyToClipboard(source_lines[0])
  else
    " A list of length one is passed to the sink function. This happily
    " matches the arglist for funcrefs.
    call fzf#run({
    \   'source': source_lines,
    \   'sink':   function('FzfCopyRubyTokenCopyToClipboard'),
    \   'options': '--prompt " Copy to clipboard > "',
    \   'window': { 'width': 0.9, 'height': 0.6 },
    \ })
  endif
endfunction

function! FzfCopyRubyTokenSourceLines(token)
  " In literal strings (':h literal-string'), two quotes stand for one quote.
  let raw_output = system('ripper-tags --tag-file=- --format=json ' . expand('%') . ' | jq --raw-output ''.[] | select(.name == "' . a:token . '") | .full_name''')
  let matches = split(raw_output)
  return matches
endfunction

" Make tokens REPL friendly. In the highly unlikely case there are multiple
" pound signs, only replace the last one.
"
" https://stackoverflow.com/questions/736120/why-are-methods-in-ruby-documentation-preceded-by-a-hash-sign
" https://stackoverflow.com/questions/11865845/replace-last-occurrence-in-line
function! FzfCopyTubyTokenConvertLastPoundToDot(text)
  return substitute(a:text, '.*\zs#', '.', '')
endfunction

function! FzfCopyRubyTokenCopyToClipboard(text)
  let text_to_copy = FzfCopyTubyTokenConvertLastPoundToDot(a:text)
  execute 'let @+="' . text_to_copy . '"'
  echom('Copied to clipboard: ' . string(text_to_copy))
endfunction

command! -bar FZFCopyRubyToken :call FzfCopyRubyTokenFn(expand('<cword>'))
nnoremap <silent> <leader>ry :FZFCopyRubyToken<Return>

function! CacheListCmd()
  let ref = system('git symbolic-ref -q HEAD 2>/dev/null')
  if ref == ''
    return $FZF_DEFAULT_COMMAND
  endif

  " trim the newline output from rev-parse
  let head_commit = system('git rev-parse HEAD | tr -d "\n"')
  let cache_file = '/tmp/'.head_commit.'.files'
  if !filereadable(expand(cache_file))
    execute 'silent !' . $FZF_DEFAULT_COMMAND . ' > '.cache_file
  endif

  let base = fnamemodify(expand('%'), ':h:.:S')
  return base == '.' ?
    \ printf('cat %s', cache_file) :
    \ printf('cat %s | proximity-sort %s', cache_file, expand('%'))
endfunction

command! -bang -nargs=? -complete=dir MyFiles
  \ call fzf#vim#files(<q-args>, {'source': CacheListCmd(),
  \                               'options': ['--tiebreak=index', '--preview', '~/.vim/bundle/fzf.vim/bin/preview.sh {}']}, <bang>0)

silent! nnoremap <unique> <silent> <leader>f :MyFiles<cr>

" list bookmarks
nnoremap <leader>m :Marks<cr>

" list maps
nnoremap <leader>am :Maps<cr>

" list commands
nnoremap <leader>an :Commands<cr>

" silent! nnoremap <unique> <silent> <leader>f :Files<cr>

" Show search results from files and directories that would otherwise be ignored
" by '.gitignore', '.ignore', '.fdignore', or the global ignore file.
command! -bang -nargs=* FilesNoIgnore
  \ call fzf#run(fzf#wrap({'source': 'fd --hidden --follow --no-ignore --type f', 'width': '90%', 'height': '60%', 'options': '--expect=ctrl-t,ctrl-x,ctrl-v --multi' }))
" Show search results from files and directories that would otherwise be ignored
" by '.gitignore' files.
command! -bang -nargs=* FilesNoIgnoreVcs
  \ call fzf#run(fzf#wrap({'source': 'fd --hidden --follow --no-ignore-vcs --type f', 'width': '90%', 'height': '60%', 'options': '--expect=ctrl-t,ctrl-x,ctrl-v --multi' }))
silent! nnoremap <unique> <silent> <leader>F :FilesNoIgnore<cr>

function! ClearFzfCache()
  let ref = system('git symbolic-ref -q HEAD 2>/dev/null')
  if ref != ''
    " trim the newline output from rev-parse
    let head_commit = system('git rev-parse HEAD | tr -d "\n"')
    let cache_file = '/tmp/'.head_commit.'.files'
    if filereadable(expand(cache_file))
      execute 'silent !rm ' . cache_file
    endif
  endif
endfunction

silent! nnoremap <unique> <silent> <leader>cf :call ClearFzfCache()<cr>

nnoremap <leader>aa :Rg<Space>
nnoremap <leader>ag :Rg <C-R><C-W><cr>
xnoremap <leader>ag y:Rg <C-R>"<cr>
nnoremap <leader>AG :Rg <C-R><C-A><cr>

silent! nnoremap <unique> <silent> <leader>bb :Buffers<cr>
silent! nnoremap <unique> <silent> <leader>bl :BLines<cr>

nnoremap <leader>tj :Tags<cr>
nnoremap <leader>ts :Tags<Space>
nnoremap <silent> <leader>tg :Tags <C-R><C-W><cr>
xnoremap <silent> <leader>tg y:Tags <C-R>"<cr>"


" ================================= gitgutter ==================================
call gitgutter#highlight#define_highlights()
let g:gitgutter_max_signs = 1024
set signcolumn=yes

map <leader>ga :GitGutterStageHunk<cr>
map <leader>gn :GitGutterNextHunk<cr>
map <leader>gp :GitGutterPrevHunk<cr>
map <leader>gu :GitGutterUndoHunk<cr>
map <leader>gv :GitGutterPreviewHunk<cr>


" ================================= git-messenger ==============================
nmap <leader>gm <Plug>(git-messenger)


" ================================= indentLine =================================
let g:indentLine_enabled = 0
let g:indentLine_char = "\ue621"

nnoremap <leader>cm :IndentLinesToggle<cr>


" ================================= jedi =======================================
let g:jedi#goto_command = "<leader>xg"
let g:jedi#goto_assignments_command = ""
let g:jedi#goto_definitions_command = "<leader>xd"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = ""
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>xr"
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#show_call_signatures = "0"


" ================================= lightline ==================================
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "

let g:lightline = {
      \ 'colorscheme': 'lightline_solarized',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'filename' ],
      \     [ 'cocstatus', 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
      \     [ 'ctrlpmark' ],
      \   ],
      \   'right': [
      \     [ 'percent', 'lineinfo' ],
      \     [ 'winnr' ],
      \     [ 'filetype' ],
      \   ]
      \ },
      \ 'inactive': {
      \   'left': [
      \     [ 'filename' ],
      \   ],
      \   'right': [
      \     [ 'winnr' ],
      \   ]
      \ },
      \ 'component': {
      \   'lineinfo': "\ue0a1".'%3l'." \ue0a3".'%-2v',
      \   'percent': "\uf110".'%3p%%',
      \   'vim_logo': " \ue62b",
      \ },
      \ 'tabline': {
      \   'left': [ [ 'vim_logo', 'tabs' ] ]
      \ },
      \ 'tab': {
      \   'active': [ 'tabnum', 'filename' ],
      \   'inactive': [ 'tabnum', 'filename' ],
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
      \ 'tab_component_function': {
      \   'filename': 'MyTabname',
      \ },
      \ 'component_expand': {
      \   'tabs': 'lightline#tabs',
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
      \   'cocstatus': 'MyCocStatus',
      \ },
      \ 'component_type': {
      \   'linter_checking': 'left',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'left',
      \   'cocstatus': 'left',
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }

function! MyModified()
  " currently this function doesn't distinguish between modifiable and
  " non-modifiable files.
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : ''
endfunction

function! MyReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! MyWinnr()
  let fname = expand('%:t')
  let nr = winnr()
  return fname == 'ControlP' ? '' : "\uf77a " . nr
endfunction

function! GetFilename(fname)
  let fname = a:fname
  let ufname = fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ (
        \   fname =~ 'Tagbar' ? 'Tagbar' :
        \   fname =~ 'CocTree' ? 'CocTree' :
        \   fname =~ '__Gundo\|NERD_tree\|\[defx\]' ? 'Explorer' :
        \   fname =~ ';#FZF' ? '[FZF]' :
        \   fname =~ '!sh' ? '[FZF]' :
        \   &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \   &ft == 'unite' ? unite#get_status_string() :
        \   &ft == 'vimshell' ? vimshell#get_status_string() :
        \   ('' != fname ? "\uf0f6 " . fname : '[No Name]')
        \ )
  return ufname
endfunction

function! CurrentLspStatus(cocstatus)
  if len(a:cocstatus) == 0
    return a:cocstatus
  endif

  " find the lsp for current file
  let lsp = &ft == 'ruby' ? 'sorbet' :
      \ (
      \   &ft == 'go' ? 'gopls' :
      \   &ft == 'rust' ? 'rust-analyzer' :
      \   &ft == 'scala' ? 'metals' :
      \   &ft =~ 'typescript\|typescriptreact\|typescript.tsx\|typescript.jsx\|javascript\|javascriptreact\|javascript.jsx' ? 'tsserver' :
      \   &ft == 'json' ? 'json' : ''
      \ )

  if len(lsp) == 0
    return ''
  endif

  " replace json lsp with a shorter name
  let cocstatus = substitute(a:cocstatus, 'Json language server', 'json', '')
  let cocstatus = substitute(cocstatus, 'Initializing tsserver [^\s]*', 'tsserver:starting', '')
  let cocstatus = substitute(cocstatus, 'TSC [^\s]*', 'tsserver:running', '')
  let cocstatus = substitute(cocstatus, 'Metals', 'metals:running', '')
  let cocstatus = substitute(cocstatus, 'Rust Analyzer Language Server:running rust-analyzer', 'rust-analyzer:running', '')
  let cocstatus = substitute(cocstatus, 'golang', 'gopls', '')

  " get a list of lsp status
  let statuslist = split(cocstatus)

  " return the lsp status
  for status in statuslist
    if status =~ lsp
      return status
    endif
  endfor

  " don't return anything if the file doesn't use lsp
  return ''
endfunction

function! MyCocStatus()
  let fname = GetFilename(expand('%:t'))
  let cocstatus = coc#status()
  return fname == 'ControlP' ? '' :
      \ (
      \   fname =~ 'Tagbar' ? '' :
      \   fname =~ 'CocTree' ? '' :
      \   fname =~ 'Explorer' ? '' :
      \   fname =~ '\[FZF\]' ? '' :
      \   fname =~ '\[No Name\]' ? '' :
      \   CurrentLspStatus(cocstatus)
      \ )
endfunction

function! MyFilename()
  let fname = expand('%:t')
  return GetFilename(fname) .
        \  ('' != MyReadonly() ? ' ' . MyReadonly() : '') .
        \  ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyTabname(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let fname = GetFilename(expand('#'.buflist[winnr - 1].':t'))

  if fname =~ '[FZF]'
    let buflist = fzf#vim#_buflisted_sorted()
    if len(buflist) > 0
      let lastfile = buflist[0]
      return GetFilename(fnamemodify(bufname(lastfile), ':t'))
    endif
  endif

  return fname
endfunction

function! MyFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD\|\[defx\]' && &ft !~? 'vimfiler' && exists('*fugitive#head')
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
  if winwidth(0) <= 60
    return ''
  endif

  return fname =~ 'Tagbar' ? 'Outline' :
        \ fname =~ 'CocTree' ? 'Outline' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ fname =~ '\[defx\]' ? 'Defx' : lightline#mode()
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


" ================================= markdown ===================================
let g:vim_markdown_folding_disabled = 1
" Don't auto indent for new list item
let g:vim_markdown_new_list_item_indent = 0
" Don't map gx etc
let g:vim_markdown_no_default_key_mappings = 1


" ================================= open-browser ===============================
let g:netrw_nogx = 1 " disable netrw's gx mapping.

nmap gx <Plug>(openbrowser-open)
vmap gx <Plug>(openbrowser-open)


" ================================= projectionist ==============================
" heuristics for Elixir projects
let g:projectionist_heuristics = {
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


" ================================= ragtag =====================================
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1  = "inc"
" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags    = "li\|p"


" ================================= rainbow_parentheses ========================
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
augroup rainbow_activation
  autocmd!
  autocmd FileType clojure,json,lisp,ruby,scheme,yaml RainbowParentheses
augroup END


" ================================= rust =======================================
let g:rustfmt_autosave = 1


" ================================= splitjoin ==================================
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''

nmap <leader>sj :SplitjoinJoin<cr>
nmap <leader>ss :SplitjoinSplit<cr>


" ================================= starsearch =================================
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

nnoremap <silent> * :call <SID>VStarsearch_searchCWord()<cr>:set hls<cr>


" ================================= startify ===================================
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


" ================================= tagbar =====================================
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


" ================================= trailing-whitespace ========================
let g:extra_whitespace_ignored_filetypes = ['defx', 'unite']
let g:extra_whitespace_ignored_filenames = ['defx', 'unite', '']


" ================================= UltiSnips ==================================
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsUsePythonVersion = 3


" ================================= vim-go =====================================
let g:go_def_mapping_enabled = 0 " disable c-] mapping
let g:go_doc_keywordprg_enabled = 0 " disable K mapping
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_gocode_autobuild = 0
let g:go_gocode_propose_source = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_list_type = "quickfix"

let g:go_decls_mode = 'fzf'
let g:go_gopls_enabled = 1
let g:go_def_mode = 'godef'
let g:go_info_mode = 'guru'
let g:go_referrers_mode = 'guru'

function! s:go_guru_scope_from_git_root()
  let gitroot = system("git rev-parse --show-toplevel | tr -d '\n'")
  let pattern = escape(go#util#gopath() . "/src/", '\ /')
  return substitute(gitroot, pattern, "", "") . "/... -vendor/"
endfunction

au FileType go silent exe "GoGuruScope " . s:go_guru_scope_from_git_root()

function! SetupMapForVimGo()
  function! s:build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
      call go#test#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
      call go#cmd#Build(0)
    endif
  endfunction
  " run :GoBuild or :GoTestCompile based on the go file
  nmap <leader>bg :<C-u>call <SID>build_go_files()<cr>

  " `go run` the current package
  nmap <leader>rg <Plug>(go-run)

  " shows the set of possible sends/receives on the channel operand of the
  " selected send or receive operation
  nmap <leader>gc :<C-u>GoChannelPeers<cr>
  " show all function and type declarations for the current directory
  nmap <leader>gdd :<C-u>GoDeclsDir<cr>
  " show all function and type declarations for the current file
  nmap <leader>gdc :<C-u>GoDecls<cr>
endfunction
autocmd FileType go call SetupMapForVimGo()
autocmd Filetype go
  \  command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  \| command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  \| command! -bang AS call go#alternate#Switch(<bang>0, 'split')


" ================================= vim-test ===================================
nmap <silent> <leader>tf :TestFile<cr>
nmap <silent> <leader>tn :TestNearest<cr>
nmap <silent> <leader>tl :TestLast<cr>
nmap <silent> <leader>tv :TestVisit<cr>


" ================================= vimux ======================================
" generate ctags in tmux
nnoremap <leader>dc :VimuxPromptCommand<cr>ctags -R --languages=-javascript --exclude=.git/ --exclude=log/ --exclude=build/ --exclude=target/ --exclude=node_modules/ --fields=+ialS --extras=+q .<cr>

" generate tags for ruby with ripper-tags in tmux
function! SetupMapForRipperTags()
  " Generate ctags with ripper-tags, specifically for Ruby
  " nnoremap <leader>dr :Dispatch ripper-tags -R --exclude=.git/ --exclude=log/ --exclude=build/ --exclude=target/ --exclude=node_modules/ --force --fields=+n<cr>
  " nnoremap <leader>dr :VimuxPromptCommand<cr>ripper-tags -R --exclude=.git/ --exclude=log/ --exclude=build/ --exclude=target/ --exclude=node_modules/ --force --fields=+n<cr>
  " Generate ctags with custmized but faster ripper-tags function
  nnoremap <leader>dr :VimuxPromptCommand<cr>rtags<cr>
  " Generate ctags with ripper-tags, specifically for Ruby
  " nnoremap <leader>dt :Dispatch ripper-tags -R --exclude=.git/ --exclude=log/ --exclude=build/ --exclude=target/ --exclude=node_modules/ --force --fields=+n<cr>
  " nnoremap <leader>dt :VimuxPromptCommand<cr>ripper-tags -R --exclude=.git/ --exclude=log/ --exclude=build/ --exclude=target/ --exclude=node_modules/ --force --fields=+n<cr>
  " Generate ctags with custmized but faster ripper-tags function
  nnoremap <leader>dt :VimuxPromptCommand<cr>rtags<cr>
endfunction
autocmd FileType ruby call SetupMapForRipperTags()

" prompt for a command to run in tmux
map <leader>vp :VimuxPromptCommand<cr>
" inspect runner pane
map <leader>vi :VimuxInspectRunner<cr>
" close vim tmux runner
map <leader>vc :VimuxCloseRunner<cr>
" interrupt any command running in the runner pane
map <leader>vx :VimuxInterruptRunner<cr>


" ================================= vimux-golang ===============================
function! SetupMapForVimuxGolang()
  " test the current package in tmux
  map <leader>vs :GolangTestCurrentPackage<cr>
  " run the nearest test in the current file
  map <leader>vn :GolangTestFocused<cr>
endfunction
autocmd FileType go call SetupMapForVimuxGolang()


" ================================= visual-multi ===============================
" let g:VM_leader = ','
" let g:VM_maps   = {}
"
" let g:VM_maps['Find Under']         = '<C-s>'    " replace C-n
" let g:VM_maps['Find Subword Under'] = '<C-s>'    " replace visual C-n
" let g:VM_maps["Select All"]         = ',A'
" let g:VM_maps["Add Cursor Down"]    = '<C-Down>' " iTerm2: Send Escape Sequence + [1;5B
" let g:VM_maps["Add Cursor Up"]      = '<C-Up>'   " iTerm2: Send Escape Sequence + [1;5A
" let g:VM_maps['Motion ,']           = ',,'


" ================================= vroom ======================================
let g:vroom_use_vimux=1
let g:vroom_map_keys=0

" when run unit test, also include current directory
" for bettern compatibility
if !exists("g:vroom_test_unit_command")
  let g:vroom_test_unit_command = 'ruby -Itest -I.'
endif

" test the current file with vroom
map <leader>vs :VroomRunTestFile<cr>
" run the nearest test in the current file
map <leader>vn :VroomRunNearestTest<cr>
" run last test executed by vroom
map <leader>vl :VroomRunLastTest<cr>


" ================================= private config =============================
" load private overlay packages
call SourceIfExists('~/.config/nvim/layers/private/config.vim')
