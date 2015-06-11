"
" Author:         Larry Lv <larrylv1990@gmail.com>
" Last Modified:  Jun 04, 2015
"

filetype off " required by vundle

set runtimepath+=~/.gmarik-vundle

call vundle#rc()

" Language Support - syntax, indent, etc.
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
Plugin 'vim-scripts/bufexplorer.zip'
Plugin 'vim-scripts/matchit.zip'


set t_Co=256
set background=dark

" set solarized theme
let g:solarized_termtrans = 1
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

" basic configuration
syntax on
set nocompatible
set nu
set ruler
set nobackup
set fdm=marker
set bs=2
set backspace=indent,eol,start   " Allow backspacing over everything in insert mode
set diffopt+=iwhite              " Ignore whitespaces with vimdiff
set nojoinspaces                 " Prevents inserting two spaces after punctuation on a join (J)
set autoread                     " Reload files changed outside automatically
set scrolloff=3                  " Always shows 5 lines above/below the cursor
set showcmd                      " display incomplete commands
set tags=./tags;
set timeout timeoutlen=1000 ttimeoutlen=50 " Fix slow 0 inserts
set complete=.,w,b,u,t,i
set completeopt=longest,menu
set laststatus=2
set modeline
set relativenumber
set lazyredraw

" Highlight current line
set cursorline

" Sign Column made by solarized color is strange, clear it.
highlight clear SignColumn

" vim-gitgutter will use Sign Column to set its color, reload it.
call gitgutter#highlight#define_highlights()
let g:gitgutter_max_signs = 1024

highlight clear LineNr
highlight LineNr ctermfg=10

" tab/indent configuration
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set cindent
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,chinese
set formatoptions+=mM
set ambiwidth=double
set noshowmode

filetype plugin indent on

" search configuration
set smartcase
set hlsearch
set incsearch
set ignorecase

let g:ruby_path = system('echo $HOME/.rbenv/shims')

" lightline.vim configurations
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


" Tab triggers buffer-name auto-completion
set wildchar=<Tab> wildmenu wildmode=full

" Undo file settings
set undodir=~/.vim/.undo
set undofile
set undolevels=1000
set undoreload=10000

" force write and save
cmap w!! %!sudo tee > /dev/null %

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <F2> :TagbarToggle<CR>
nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>
nnoremap <silent> <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
map <F5> :!ctags -R --languages=-javascript --exclude=.git --exclude=log --exclude=target --fields=+iaS --extra=+q .<CR>

nnoremap <F8> :GundoToggle<CR>
let g:gundo_width = 60

imap <c-c> <ESC>
imap jj <ESC>
" Insert a hash rocket with <c-h>
imap <c-h> =><space>
" Move around splits with <c-hjkl>
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" increase number, <c-a> is prefix for tmux.
map <c-i> <c-a>

map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" quick move under insert mode.
imap <c-f> <c-o>w
imap <c-b> <c-o>b

map <C-n> :nohlsearch<CR>


let mapleader=","

nnoremap <leader><leader> <c-^>
cnoremap %% <C-R>=expand('%:h').'/'<cr>
command! GdiffInTab tabedit %|vsplit|Gdiff

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
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
map <leader>ga :GitGutterStageHunk<cr>
map <leader>gn :GitGutterNextHunk<cr>
map <leader>gp :GitGutterPrevHunk<cr>
map <leader>gr :GitGutterRevertHunk<cr>
map <leader>gv :GitGutterPreviewHunk<cr>
nmap <leader>h :nohlsearch<cr>
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
" map <leader>v :Rview<cr>
map <leader>vr :tabe ~/.vimrc<CR>
" System Yank: will copy into the system clipboard on OS X
vmap <leader>y :w !reattach-to-user-namespace pbcopy<CR><CR>

" Vim-Ruby-Refactoring CONFIGURATIONS
nnoremap <leader>rap  :RAddParameter<cr>
" nnoremap <leader>rcpc :RConvertPostConditional<cr>
vnoremap <leader>rec  :RExtractConstant<cr>
nnoremap <leader>rel  :RExtractLet<cr>
vnoremap <leader>rem  :RExtractMethod<cr>
vnoremap <leader>relv :RExtractLocalVariable<cr>
nnoremap <leader>rit  :RInlineTemp<cr>
vnoremap <leader>rrlv :RRenameLocalVariable<cr>
vnoremap <leader>rriv :RRenameInstanceVariable<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Test-running stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>ts :TestFile<CR>
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tl :TestLast<CR>

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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-multiple-cursors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:multi_cursor_use_default_mapping=0
" let g:multi_cursor_next_key='<C-m>'
" let g:multi_cursor_prev_key='<C-p>'
" let g:multi_cursor_skip_key='<C-x>'
" let g:multi_cursor_quit_key='<C-c>'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ADJUST QUICKFIX WINDOW HEIGHT
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" Insert the current time
command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S')<cr>

let g:SuperTabDefaultCompletionType = "<c-n>"


" tagbar configurations for Go support.
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


" bufExplorer configurations
let g:bufExplorerShowTabBuffer=1    " BufExplorer: show only buffers relative to this tab
let g:bufExplorerShowRelativePath=1 " BufExplorer: show relative paths


" gist-vim configurations
let g:gist_post_private = 1
let g:gist_show_privates = 1
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ShowMarks.vim CONFIGURATIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let showmarks_enable = 1
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1
hi ShowMarksHLl ctermbg=Yellow  ctermfg=Black guibg=#FFDB72 guifg=Black
hi ShowMarksHLu ctermbg=Magenta ctermfg=Black guibg=#FFB3FF guifg=Black


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic.vim CONFIGURATIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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



highlight Pmenu guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
highlight PmenuSbar guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
highlight PmenuThumb guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,mkd setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe & UltiSnips CONFIGURATIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"


" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " NEOCOMPLCACHE & NEOSNIPPET CONFIGURATIONS
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"
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


" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set wildignore=*.o,*.obj,*.git
set wildignore+=*.jpg,*.png,*.gif
set wildignore+=**/vendor/bundle,**/vendor/ruby,**/tmp/cache,**/vendor/cache,**/public/**


inoremap <C-e>  <esc>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTRLP.vim CONFIGURATIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
let g:ctrlp_tjump_only_silent = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Selecta CONFIGURATIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>sc :call SelectaCommand("git ls-files", "", ":e")<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Better Rainbow Parentheses
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" NERDTree plugin configuration
let NERDTreeWinSize = 30
let NERDTreeAutoCenter=1
let NERDTreeChDirMode=2
let g:NERDTreeMinimalUI=1
let g:NERDTreeHijackNetrw=1
map <F1> :NERDTreeToggle<CR>


" ack.vim configuration
if executable("ack")
    " ,a to Ack (search in files)
    nnoremap <leader>a :Ack 
    let g:ackprg="ack -H --smart-case --nocolor --nogroup --column --nojs --nocss --ignore-dir=.binstubs --ignore-dir=vendor --ignore-dir=log --ignore-dir=tmp --ignore-file=is:Session.vim --ignore-file=is:tags"
    let g:ackhighlight=1
endif


let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1  = "inc"
" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags    = "li\|p"

" Remember last location when open a file
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


" filetype detection
autocmd BufNewFile,BufRead Thorfile set filetype=ruby
autocmd BufNewFile,BufRead *.thor set filetype=ruby
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead Capfile set filetype=ruby
autocmd BufNewFile,BufRead pryrc set filetype=ruby
autocmd BufNewFile,BufRead *.less set filetype=css
autocmd BufNewFile,BufRead *.god set filetype=ruby
autocmd BufNewFile,BufRead *.mkd set ai formatoptions=tcroqn2 comments=n:>
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd BufNewFile,BufRead *.es6 set filetype=javascript
autocmd Filetype gitcommit setlocal textwidth=78
autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd FileType go,c,cpp,rust set ts=4 sw=4 sts=4 et

