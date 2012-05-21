" File:         scrollfix.vim
" Author:       Yakov Lerner <iler.ml@gmail.com>
" Last changed: 2006-09-10
"
" This plugin, scrollfix, maintains cursor at fixed visual line of window
" (except when near beginning of file and near end of file. The
" latter is configurable. You can choose whether to fix cursor
" near en of file or not, see g:fixeof below). This is enhancement
" to the 'set scrolloff=999' setting, that allows any visual of
" window to keep cursor at, not only middle line of window.
"
" You choose the visual line of screen in percentages from top of
" screen. For example, setting 100 mean lock cursor a bottom
" line of screen, setting 0 mean keep cursor at top line of 
" screen, setting 50 means middle line of screen, setting 60
" (default) is about two-third from top of screen.
" As shipped, cursor is at 60% (let g:scrollfix=60)
" You control persentage of scrollfix in following ways:
" - :set g:scrollfix=NNN   " in vimrc. -1 disables plugin
" - edit file ~/.vim/plugin/scrollfix.vim, change number in line
"         :let g:scrollfix=NNN
" - command :FIX NNN
"
" CONTROL VARIABLES:
" g:scrollfix - percentage from top of screen where to lock cursor
"               -1 - disables. Default: 60
" g:fixeof    - 1=>fix cursor also near end-of-file; 0=>no. Default:0
" g:scrollinfo - 1=>inform when scrollfix is turned on, 0=>no. Default: 1
"
" NB:
" - You need vim version at least 7.0.91 or later (vim6 won't work).
"   If you have vim7 before 7.0.91, you can use script#1473 to build 
"   & install the latest vim7 executable.
" - this is beta version of the scrollfix plugin. 
"   Your feedback is welcome. Please send your feedback to iler at gmail dot com.
"................................................................


if exists("g:scrollfix_plugin") | finish | endif
let g:scrollfix_plugin = 1

"------------------- Parameterization Variables -----------------------
if !exists("g:scrollfix")
  let g:scrollfix=60  " percentable of screen height to keep visual cursor on
  " let g:scrollfix=-1 " -1=>disable scrollfix
endif
if !exists("g:fixeof")
                "let g:fixeof=1 => fix cursor also near end-of-file
                "let g:fixeof=0 => do not fix cursor near end-of-file
  let g:fixeof=0  " 1=>fix cursor also near end-of-file; 0=>no.
endif
if !exists("g:scrollinfo")
  let g:scrollinfo=1 " 1=>inform when scrollfix is turned on, 0=>no
endif
"---------------- End of Parameterization Variables -------------------

" version check
if v:version < 700 | finish | endif
" if vim6, disable silently.
" if version > 700, it will work. 
" if version == 700, we need the specific patch, explain and disable.
if v:version == 700 && ! has('patch91')
    echohl ToDo
    echo "Warning: scrollfix plugin needs newer vim version (>=7.0.91)"
    echohl
    finish
endif

command!          FIXOFF    :let g:scrollfix=-1
command!          FIXON     :let g:scrollfix=60
command! -nargs=1 FIX       :let g:scrollfix=<args>
command! -nargs=1 SCROLLFIX :let g:scrollfix=<args>

aug scrollfix
    au!
    au CursorMoved,CursorMovedI * :call ScrollFix()
aug END

function! ScrollFix()
    if g:scrollfix<0 | return | endif
    if &so!=0 | set so=0 | endif

    " keep cursor on fixed visual line of the window

    let fixline = ( winheight(0) * g:scrollfix ) / 100

    let dict = winsaveview()
    if dict['lnum'] <= fixline | return | endif
    if dict['lnum'] - dict['topline'] + 1 == fixline | return | endif

    " if eof line is visible and visual-line is >= fixline, don't fix cursor
    if g:fixeof
        if line('$') < dict['topline'] + winheight(0) && dict['lnum'] >= fixline
            return
        endif
    endif

    let dict['topline'] = dict['lnum'] - fixline + 1
    " let g:last = dict
    call winrestview(dict)

    if g:scrollinfo 
        if !exists('b:fixline') || b:fixline != fixline
            let b:fixline = fixline
            let save_lz = &lazyredraw
            set nolazyredraw
            redraw
            echo "scroll fixed at line " . b:fixline . " of " . winheight(0)." (". g:scrollfix "%)"
            let &lazyredraw = save_lz
        endif
    endif
endfunction

" WISH:
" XXX allow per-buffer setting , b:scrollfix 
" XXX how to handle window-resize event

" Changes
" 060910 lerner  initial (beta) version
