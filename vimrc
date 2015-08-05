"
" Author:         Larry Lv <larrylv1990@gmail.com>
" Last Modified:  Jul 31, 2015
"

" Plugins -------------------------------------------------------------

" Load plugins {{{

filetype off " required by vundle

set runtimepath+=~/.gmarik-vundle

call vundle#rc()

Plugin 'vim-ruby/vim-ruby'
Plugin 'elixir-lang/vim-elixir'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'fatih/vim-go'
Plugin 'othree/html5.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'groenewege/vim-less'
Plugin 'guns/vim-clojure-static'
Plugin 'larrylv/ShowMarks'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ivalkeen/vim-ctrlp-tjump'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-endwise'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'skalnik/vim-vroom'
Plugin 'honza/vim-snippets'
Plugin 'janko-m/vim-test'
Plugin 'mileszs/ack.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'godlygeek/tabular'
Plugin 'tudorprodan/html_annoyance.vim'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'ervandew/supertab'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'Raimondi/delimitMate'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'benmills/vimux'
Plugin 'eapache/rainbow_parentheses.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'vim-scripts/matchit.zip'
" }}}

" Settings ------------------------------------------------------------

" Mapleader {{{
let mapleader=","
" }}}

" Make vim more useful {{{
set nocompatible
" }}}

" Syntax highlighting {{{
set t_Co=256
set background=dark
syntax on
let g:solarized_termtrans = 1
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized
" }}}

" Set some junk"{{{
set ambiwidth=double
set autoindent                             " Copy indent from last line when starting new line
set autoread                               " Reload files changed outside automatically
set backspace=indent,eol,start             " Allow backspacing over everything in insert mode
set cindent
set complete=.,w,b,u,t,i
set completeopt=longest,menu
set cursorline                             " Highlight current line
set diffopt+=iwhite                        " Ignore whitespaces with vimdiff
set diffopt=filler                         " Add vertical spaces to keep right and left aligned
set encoding=utf-8 nobomb                  " BOM often causes trouble
set expandtab                              " Expand tabs to spaces
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,chinese
set foldcolumn=0                           " Column to show folds
set foldenable                             " Enable folding
set foldlevel=0                            " Close all folds by default
set foldmethod=marker                      " Syntax are used to specify folds
set foldminlines=0                         " Allow folding single lines
set foldnestmax=5                          " Set max fold nesting level
set formatoptions=
set formatoptions+=1                       " Break before 1-letter words
set formatoptions+=2                       " Use indent from 2nd line of a paragraph
set formatoptions+=c                       " Format comments
set formatoptions+=l                       " Don't break lines that are already long
set formatoptions+=n                       " Recognize numbered lists
set formatoptions+=o                       " Make comment when using o or O from comment line
set formatoptions+=q                       " Format comments with gq
set formatoptions+=r                       " Continue comments by default
set gdefault                               " By default add g flag to search/replace. Add g to toggle
set hidden                                 " When a buffer is brought to foreground, remember undo history and marks
set history=1000                           " Increase history from 20 default to 1000
set hlsearch                               " Highlight searches
set ignorecase                             " Ignore case of searches
set incsearch                              " Highlight dynamically as pattern is typed
set laststatus=2                           " Always show status line
set lazyredraw                             " Don't redraw when we don't have to
set magic                                  " Enable extended regexes
set modeline
set nobackup
set noerrorbells                           " Disable error bells
set nojoinspaces                           " Only insert single space after a '.', '?' and '!' with a join command
set noshowmode                             " Don't show the current mode (airline.vim takes care of us)
set nostartofline                          " Don't reset cursor to start of line when moving around
set wrap                                   " Wrap lines that are too long
set nu                                     " Enable line numbers
set omnifunc=syntaxcomplete#Complete       " Set omni-completion method
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
set timeout timeoutlen=1000 ttimeoutlen=50 " Fix slow 0 inserts
set title                                  " Show the filename in the window titlebar
set ttyfast                                " Send more characters at a given time
set undodir=~/.vim/.undo
set undofile                               " Persistent Undo
set undolevels=1000
set undoreload=10000
set wildchar=<Tab>                         " Character for CLI expansion (TAB-completion)
set wildmenu                               " Hitting TAB in command mode will show possible completions above command line
set wildmode=list:longest                  " Complete only until point of ambiguity
set wrapscan                               " Searches wrap around end of file

set wildignore+=**/vendor/bundle,**/vendor/ruby,**/tmp/cache,**/vendor/cache,**/public/**,_build,deps
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*
"}}}

" Configurations ------------------------------------------------------

" Leader Shortcuts"{{{
nnoremap <leader><leader> <c-^>
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>cc :ccl<cr>
map <leader>cn :cn<cr>
map <leader>cp :cp<cr>
map <leader>da :CtrlP app/assets<cr>
map <leader>dc :CtrlP app/controllers<cr>
map <leader>dh :CtrlP app/helpers<cr>
map <leader>dm :CtrlP app/models<cr>
map <leader>dv :CtrlP app/views<cr>
map <leader>df :CtrlP config<cr>
map <leader>dl :CtrlP lib<cr>
map <leader>ds :CtrlP spec<cr>
map <leader>dt :CtrlP test<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
map <leader>ga :GitGutterStageHunk<cr>
map <leader>gn :GitGutterNextHunk<cr>
map <leader>gp :GitGutterPrevHunk<cr>
map <leader>gr :GitGutterRevertHunk<cr>
map <leader>gv :GitGutterPreviewHunk<cr>
map <leader>n :call RenameFile()<cr>
map <leader>p :echo @%<cr>
map <leader>rc :Econtroller<cr>
map <leader>rf :Efixtures<cr>
map <leader>rh :Ehelper<cr>
map <leader>rl :Elayout<cr>
map <leader>rj :Ejavascript<cr>
map <leader>rm :Emodel<cr>
map <leader>rs :Eschema<cr>
map <leader>rt :A<cr>
map <leader>ru :Eunittest<CR>
map <leader>rv :Eview<cr>
map <leader>sc :sp db/schema.rb<cr>
map <leader>sg :sp Gemfile<cr>
map <leader>so :source $MYVIMRC<cr>
map <leader>sr :sp config/routes.rb<cr>
map <leader>ss :source ./Session.vim<cr>
map  <leader>sj :stjump 
map  <leader>st :stselect 
nmap <leader>ta :Tabularize /
vmap <leader>ta :Tabularize /
nmap <leader>t= :Tabularize /=<CR>
vmap <leader>t= :Tabularize /=<CR>
nmap <leader>t# :Tabularize /#<CR>
vmap <leader>t# :Tabularize /#<CR>
map <leader>vr :tabe ~/.vimrc<CR>
" system yank: will copy into the system clipboard on OS X
vmap <leader>y :w !reattach-to-user-namespace pbcopy<CR><CR>
" vim-ruby-refactoring
nnoremap <leader>rap  :RAddParameter<cr>
vnoremap <leader>rec  :RExtractConstant<cr>
nnoremap <leader>rel  :RExtractLet<cr>
vnoremap <leader>rem  :RExtractMethod<cr>
vnoremap <leader>relv :RExtractLocalVariable<cr>
nnoremap <leader>rit  :RInlineTemp<cr>
vnoremap <leader>rrlv :RRenameLocalVariable<cr>
vnoremap <leader>rriv :RRenameInstanceVariable<cr>
" Search and replace word under cursor (,*)
nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>
vnoremap <leader>* "hy:%s/\V<C-r>h//<left>
"}}}

" General"{{{
augroup general_config
  autocmd!

  " Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l) {{{
  map <C-k> <C-w><Up>
  map <C-j> <C-w><Down>
  map <C-l> <C-w><Right>
  map <C-h> <C-w><Left>
  " }}}

  " Sudo write (w!!) {{{
  cmap w!! %!sudo tee > /dev/null %
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

  " Strip trailing whitespace (<F4>) {{{
  nnoremap <silent> <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
  " }}}

  " Show git diff in tab"{{{
  command! GdiffInTab tabedit %|vsplit|Gdiff
  "}}}

  " Generate ctags (<F5>)"{{{
  map <F5> :!ctags -R --languages=-javascript --exclude=.git --exclude=log --exclude=target --fields=+iaS --extra=+q .<CR>
  "}}}

  " Remap <ESC> (jj) (Ctrl-c)"{{{
  imap <c-c> <ESC>l
  imap jj <ESC>l
  "}}}

  " Insert hash rocket (Ctrl-h)"{{{
  imap <c-h> =><space>
  "}}}

  " Remap increase number (Ctrl-i)"{{{
  " <c-a> is prefix for tmux
  map <c-i> <c-a>
  "}}}

  " Quick move under insert mode (Ctrl-f, Ctrl-b)"{{{
  imap <c-f> <c-o>w
  imap <c-b> <c-o>b
  "}}}

  " Rename File (,n)"{{{
  function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
      exec ':saveas ' . new_name
      exec ':silent !rm ' . old_name
      redraw!
    endif
  endfunction
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
  "}}}

augroup END
"}}}

" Tagbar"{{{
nmap <F2> :TagbarToggle<CR>
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
"}}}

" Supertab"{{{
let g:SuperTabDefaultCompletionType = "<c-n>"
" <C-e>: stop completion and go back to the originally typed text
"}}}

" vim-gitgutter"{{{
" Sign Column made by solarized color is strange, clear it.
highlight clear SignColumn

" vim-gitgutter will use Sign Column to set its color, reload it.
call gitgutter#highlight#define_highlights()
let g:gitgutter_max_signs = 1024

highlight clear LineNr
highlight LineNr ctermfg=10
"}}}

" vim-ruby"{{{
let g:ruby_path = system('echo $HOME/.rbenv/shims')
"}}}

" lightline.vim"{{{
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'filename' ],
      \     ['ctrlpmark']
      \   ],
      \   'right': [
      \     [ 'syntastic', 'lineinfo' ], ['percent'],
      \     [ 'filetype' ],
      \   ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
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

function! MyFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
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

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost * call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

command! LightlineRefresh call lightline#update()
"}}}

" test.vim"{{{
nmap <silent> <leader>ts :TestFile<CR>
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tl :TestLast<CR>
"}}}

" vroom.vim"{{{
let g:vroom_use_vimux=1
let g:vroom_map_keys=0

" Run the current file with vroom
map <leader>vs :VroomRunTestFile<CR>
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

" Syntastic.vim"{{{
set statusline+=\ %#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" let g:syntastic_ruby_checkers       = [ 'rubocop', 'mri' ]
let g:syntastic_ruby_checkers       = [ 'mri' ]
let g:syntastic_ruby_exec           = "~/.rbenv/versions/2.2.2/bin/ruby"
let g:syntastic_ruby_mri_exec       = "~/.rbenv/versions/2.2.2/bin/ruby"
" let g:syntastic_debug = 1
let g:syntastic_javascript_checkers = [ 'jshint' ]
let g:syntastic_coffee_checkers     = [ 'coffeelint' ]
let g:syntastic_html_checkers       = [ 'jshint' ]
let g:syntastic_haml_checkers       = [ 'haml_lint' ]
let g:syntastic_css_checkers        = [ 'csslint' ]
let g:syntastic_json_checkers       = [ 'jsonlint' ]
let g:syntastic_elixir_checkers     = [ '' ]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_cursor_column = 0
let g:syntastic_enable_highlighting = 0
let g:syntastic_enable_signs = 1
let g:syntastic_auto_jump = 0
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'passive_filetypes': ['tex', 'scss', 'slim'] }
let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = '✠'
let g:syntastic_warning_symbol = '∆'
" let g:syntastic_style_warning_symbol = '≈'
let g:syntastic_style_warning_symbol = '∆'
let g:syntastic_html_tidy_ignore_errors = [
                        \ 'trimming empty <i>',
                        \ 'trimming empty <span>',
                        \ '<input> proprietary attribute \"autocomplete\"',
                        \ 'proprietary attribute \"role\"',
                        \ 'proprietary attribute \"hidden\"',
                        \ 'proprietary attribute \"ng-',
                        \ '<svg> is not recognized!',
                        \ 'discarding unexpected <svg>',
                        \ 'discarding unexpected </svg>',
                        \ '<rect> is not recognized!',
                        \ 'discarding unexpected <rect>'
                        \ ]
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
"}}}

" neocomplcache.vim (abandoned now)"{{{
" let g:neocomplcache_enable_at_startup = 1
" let g:neocomplcache_enable_camel_case_completion = 1
" let g:neocomplcache_enable_smart_case = 1
" let g:neocomplcache_min_syntax_length = 3
" let g:neocomplcache_enable_underbar_completion = 1
" let g:neocomplcache_enable_auto_delimiter = 1
" let g:neocomplcache_force_overwrite_completefunc = 1
" let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"
" " Enable omni completion.
" if !exists('g:neocomplcache_omni_patterns')
"   let g:neocomplcache_omni_patterns = {}
" endif
" let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"
" " <C-e>: Close popup and switch to normal mode
" inoremap <C-e>  <esc>l
" inoremap <expr><C-g>  neocomplcache#undo_completion()
" inoremap <expr><C-l>  neocomplcache#complete_common_string()
" inoremap <expr><C-y>  neocomplcache#close_popup()
" inoremap <expr><C-c>  neocomplcache#cancel_popup()
" inoremap <expr><BS>   neocomplcache#smart_close_popup()."\<C-h>"
"
" " Enable snipMate compatibility feature.
" let g:neosnippet#enable_snipmate_compatibility = 1
" " Tell Neosnippet about the other snippets
" let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
" " Set snips_author & snips_email for snipMate.vim
" let g:snips_author="Larry Lv"
" let g:snips_email="larrylv1990@gmail.com""
" " Mapping Keys
" imap <silent><C-l> <Plug>(neosnippet_expand_or_jump)
" smap <silent><C-l> <Plug>(neosnippet_expand_or_jump)
" imap <silent><C-j> <Plug>(neosnippet_jump_or_expand)
" smap <silent><C-j> <Plug>(neosnippet_jump_or_expand)
"}}}

" ctrlp.vim"{{{
silent! nnoremap <unique> <silent> <leader>bb :CtrlPBuffer<CR>
silent! nnoremap <unique> <silent> <leader>cl :CtrlPClearCache<CR>
silent! nnoremap <unique> <silent> <leader>dt :CtrlPTag<CR>
silent! nnoremap <unique> <silent> <leader>f :CtrlP<CR>
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
    \ 'AcceptSelection("h")': ['<c-d>', '<c-cr>', '<c-e>'],
    \ 'ToggleByFname()':      ['<c-f>'],
    \}
nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>
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
map <F1> :NERDTreeToggle<CR>
"}}}

" ack.vim"{{{
if executable("ack")
  " ,a to Ack (search in files)
  nnoremap <leader>a :Ack 
  let g:ackprg="ack -H --smart-case --nocolor --nogroup --column --nojs --nocss --ignore-dir=.binstubs --ignore-dir=vendor --ignore-dir=_build --ignore-dir=deps --ignore-dir=log --ignore-dir=tmp --ignore-file=is:Session.vim --ignore-file=is:tags"
  let g:ackhighlight=1
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
autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd FileType go,c,cpp,rust set ts=4 sw=4 sts=4 et
"}}}
