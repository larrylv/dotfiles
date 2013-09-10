"
" Author:         Larry Lv <larrylv1990@gmail.com>
" Last Modified:  August 25, 2013
"

filetype off " required by vundle

set rtp+=~/.gmarik-vundle
call vundle#rc()

" vim-scripts repos
Bundle 'bufexplorer.zip'
Bundle 'genutils'
Bundle 'matchit.zip'
Bundle 'scratch.vim'
Bundle 'sudo.vim'
Bundle 'taglist.vim'
Bundle 'tComment'

" original repos on GitHub
Bundle 'larrylv/ShowMarks'
Bundle 'larrylv/vim-snippets'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-obsession'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'mileszs/ack.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'flazz/vim-colorschemes'
Bundle 'vim-ruby/vim-ruby'
Bundle 'depuracao/vim-rdoc'
Bundle 'pangloss/vim-javascript'
Bundle 'docunext/closetag.vim'
Bundle 'godlygeek/tabular'
Bundle 'Townk/vim-autoclose'
Bundle 'tudorprodan/html_annoyance.vim'
Bundle 'majutsushi/tagbar'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'airblade/vim-gitgutter'
Bundle 'ervandew/supertab'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'

set t_Co=256
set background=dark

" set wombat256 colorscheme
" colorscheme wombat256mod

" " set solarized theme
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
set cursorline                   " Highlight current line
highlight clear SignColumn       " SignColumn should match background for things
                                 " like vim-gitgutter
" highlight clear LineNr           " Current line number row will have same
                                 " background color in relative mode.
set nojoinspaces                 " Prevents inserting two spaces after punctuation on a join (J)
set autoread                     " Reload files changed outside automatically
set scrolloff=3                  " Always shows 5 lines above/below the cursor
set showcmd                      " display incomplete commands
set tags=./tags;
set timeout timeoutlen=1000 ttimeoutlen=100 " Fix slow 0 inserts
set complete=.,w,b,u,t,i
set completeopt=longest,menu
set laststatus=2
set splitright                   " Puts new vsplit windows to the right of the current

" tab/indent configuration
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set autoindent
set cindent
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,chinese
set formatoptions+=mM
" set ambiwidth=double
autocmd FileType c setlocal tabstop=8 shiftwidth=4 softtabstop=4

filetype plugin indent on

" search configuration
set smartcase
set hlsearch
set incsearch
set ignorecase

" status line configuration
let g:Powerline_symbols = 'fancy'
let g:Powerline_stl_path_style = 'filename'

" Tab triggers buffer-name auto-completion
set wildchar=<Tab> wildmenu wildmode=full

" Undo file settings
set undodir=~/.vim/.undo
set undofile
set undolevels=1000
set undoreload=10000


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <c-c> <ESC>
imap jj <ESC>
" Insert a hash rocket with <c-l>
imap <c-h> <space>=><space>
" Move around splits with <c-hjkl>
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <c-n> :nohlsearch<cr>
endfunction
call MapCR()

nmap <F2> :TagbarToggle<CR>
nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>
nnoremap <silent> <F4> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
map <F5> :!ctags -R --languages=-javascript --exclude=.git --exclude=log --fields=+iaS --extra=+q .<CR>
map <F7> :tprevious<CR>
map <F8> :tnext<CR>

" increase number, <c-a> is prefix for tmux.
map <c-i> <c-a>

map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" quick move under insert mode.
imap <c-f> <c-o>w
imap <c-b> <c-o>b

" force write and save
cmap w!! %!sudo tee > /dev/null %

let mapleader=","
nnoremap <leader><leader> <c-^>
map <leader>y "*y
map <leader>w :wq<cr>
map <leader>p :echo @%<cr>

" Open .vimrc for quick-edit.
map <Leader>ev :edit $MYVIMRC<CR>
map <leader>so :source $MYVIMRC<cr>

" remember last location when open a file
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal g'\"" | endif

command! GdiffInTab tabedit %|vsplit|Gdiff
nnoremap <leader>d :GdiffInTab<cr>
nnoremap <leader>D :tabclose<cr>


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
map <leader>n :call RenameFile()<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CLOSE QUICKFIX WINDOW
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>cc :ccl<cr>
au FileType qf call AdjustWindowHeight(3, 10)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

" Insert the current time
command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S')<cr>

let g:SuperTabDefaultCompletionType = "<c-n>"


" vim-gitgutter configurations
map <leader>ggn :GitGutterNextHunk<cr>
map <leader>ggp :GitGutterPrevHunk<cr>


" bufExplorer configurations
let g:bufExplorerShowTabBuffer=1    " BufExplorer: show only buffers relative to this tab
let g:bufExplorerShowRelativePath=1 " BufExplorer: show relative paths


" rails.vim configurations
map <leader>c :Rcontroller<cr>
map <leader>v :Rview<cr>
map <leader>m :Rmodel<cr>
map <leader>h :Rhelper<cr>

" gist-vim configurations
let g:gist_post_private = 1
let g:gist_show_privates = 1
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SWITCH BETWEEN TEST AND PRODUCTION CODE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenTestAlternate()
  let new_file = AlternateForCurrentFile()
  exec ':e ' . new_file
endfunction
function! AlternateForCurrentFile()
  let current_file = expand("%")
  let new_file = current_file
  let in_spec = match(current_file, '^spec/') != -1
  let going_to_spec = !in_spec
  let in_app = match(current_file, '\<controllers\>') != -1 || match(current_file, '\<models\>') != -1 || match(current_file, '\<views\>') || match(current_file, '\<helpers\>') != -1
  if going_to_spec
    if in_app
      let new_file = substitute(new_file, '^app/', '', '')
    end
    let new_file = substitute(new_file, '\.rb$', '_spec.rb', '')
    let new_file = 'spec/' . new_file
  else
    let new_file = substitute(new_file, '_spec\.rb$', '.rb', '')
    let new_file = substitute(new_file, '^spec/', '', '')
    if in_app
      let new_file = 'app/' . new_file
    end
  endif
  return new_file
endfunction
nnoremap <leader>. :call OpenTestAlternate()<cr>
nnoremap <leader>s :call OpenTestAlternate()<cr>


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
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'passive_filetypes': ['tex'] }
let g:syntastic_error_symbol = '✗'
let g:syntastic_style_error_symbol = '✠'
let g:syntastic_warning_symbol = '∆'
let g:syntastic_style_warning_symbol = '≈'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabularize.vim CONFIGURATIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>a& :Tabularize /&<CR>
vmap <Leader>a& :Tabularize /&<CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NEOCOMPLCACHE CONFIGURATIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" highlight Pmenu ctermbg=238 gui=bold
highlight Pmenu guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
highlight PmenuSbar guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
highlight PmenuThumb guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_auto_delimiter = 1
let g:neocomplcache_force_overwrite_completefunc = 1

if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
" Enable omni completion.
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,mkd setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
" Set snips_author & snips_email for snipMate.vim
let g:snips_author="Larry Lv"
let g:snips_email="larrylv1990@gmail.com""
" Mapping Keys
imap <silent><C-l> <Plug>(neosnippet_expand)
smap <silent><C-l> <Plug>(neosnippet_expand)
imap <silent><C-j> <Plug>(neosnippet_jump)
smap <silent><C-j> <Plug>(neosnippet_jump)
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
inoremap <expr><C-e>  neocomplcache#close_popup()
inoremap <expr><C-y>  neocomplcache#cancel_popup()
inoremap <expr><C-c>  neocomplcache#cancel_popup()
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"


" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

set wildignore+=*.o,*.log,*.obj,.git,*.jpg,*.png,*.gif,*/vendor/bundle,*/vendor/cache,*/tmp/*,*/public/download " exclude files from listings


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rails Development CONFIGURATIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>gg :topleft :vsplit Gemfile<cr>
map <leader>gr :topleft :vsplit config/routes.rb<cr>
function! ShowRoutes()
" Requires 'scratch' plugin
  :topleft 100 :split __Routes__
" Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
" Delete everything
  :normal 1GdG
" Put routes output in buffer
  :0r! zeus rake -s routes
" Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . "_ "
" Move cursor to bottom
  :normal 1GG
" Delete empty trailing line
  :normal dd
endfunction
map <leader>gR :call ShowRoutes()<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command-T CONFIGURATIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:CommandTCancelMap=['<Esc>', '<C-c>']
" let g:CommandTAcceptSelectionSplitMap=['<C-e>', '<C-f>']
" let g:CommandTMaxHeight = 16
" silent! nnoremap <unique> <silent> <Leader>bb :CommandTBuffer<CR>
" map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
" map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>
" map <leader>ga :CommandTFlush<cr>\|:CommandT app/assets<cr>
" map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
" map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
" map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
" map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
" map <leader>gf :CommandTFlush<cr>\|:CommandT config<cr>
" map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
" map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
" map <leader>gj :CommandTFlush<cr>\|:CommandT public/javascripts<cr>
" map <leader>gs :CommandTFlush<cr>\|:CommandT spec<cr>


" Some helpers to edit mode
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTRLP.vim CONFIGURATIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
silent! nnoremap <unique> <silent> <Leader>t :CtrlPTag<CR>
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:16,results:16'
let g:ctrlp_map = '<\-t>'
let g:ctrlp_max_files = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_extensions = [ 'ctrlp-filetpe' ]
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_switch_buffer = 0
let g:ctrlp_mruf_max = 0
let g:ctrlp_mruf_relative = 1
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-e>']
    \}
silent! nnoremap <unique> <silent> <Leader>f :CtrlP<CR>
silent! nnoremap <unique> <silent> <Leader>bb :CtrlPBuffer<CR>
map <leader>ga :CtrlP app/assets<cr>
map <leader>gc :CtrlP app/controllers<cr>
map <leader>gh :CtrlP app/helpers<cr>
map <leader>gm :CtrlP app/models<cr>
map <leader>gv :CtrlP app/views<cr>
map <leader>gf :CtrlP config<cr>
map <leader>gl :CtrlP lib<cr>
map <leader>gp :CtrlP public<cr>
map <leader>gs :CtrlP spec<cr>
map <leader>gg :topleft :vsplit Gemfile<cr>
map <leader>gr :topleft :vsplit config/routes.rb<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Ruby-Refactoring CONFIGURATIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>rap  :RAddParameter<cr>
nnoremap <leader>rcpc :RConvertPostConditional<cr>
nnoremap <leader>rel  :RExtractLet<cr>
vnoremap <leader>rec  :RExtractConstant<cr>
vnoremap <leader>relv :RExtractLocalVariable<cr>
nnoremap <leader>rit  :RInlineTemp<cr>
vnoremap <leader>rrlv :RRenameLocalVariable<cr>
vnoremap <leader>rriv :RRenameInstanceVariable<cr>
vnoremap <leader>rem  :RExtractMethod<cr>


" NERDTree plugin configuration
let NERDTreeWinSize = 26
let NERDTreeAutoCenter=1
let NERDTreeChDirMode=2
let g:NERDTreeMinimalUI=1
map <F1> :NERDTreeToggle<CR>


" ack.vim configuration
if executable("ack")
    " ,a to Ack (search in files)
    nnoremap <leader>A :Ack 
    let g:ackprg="ack -H --smart-case --nocolor --nogroup --column --nojs --nocss --ignore-dir=.binstubs --ignore-dir=vendor --ignore-dir=log --ignore-dir=tmp"
    let g:ackhighlight=1
endif
map <leader>cn :cn<cr>
map <leader>cp :cp<cr>


" vim-javascript configuration
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"


" filetype detection
autocmd BufNewFile,BufRead Thorfile set filetype=ruby
autocmd BufNewFile,BufRead *.thor set filetype=ruby
autocmd BufNewFile,BufRead Gemfile set filetype=ruby
autocmd BufNewFile,BufRead Capfile set filetype=ruby
autocmd BufNewFile,BufRead pryrc set filetype=ruby
autocmd BufNewFile,BufRead *.less set filetype=css
autocmd BufNewFile,BufRead *.god set filetype=ruby
autocmd BufNewFile,BufRead *.mkd set ai formatoptions=tcroqn2 comments=n:>
autocmd Filetype gitcommit setlocal textwidth=78
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

