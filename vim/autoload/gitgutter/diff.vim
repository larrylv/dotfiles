" Keep GitGutter's line diff and commands, but prepare its rename cache asynchronously.
execute 'source' fnameescape(g:plugs['vim-gitgutter'].dir . '/autoload/gitgutter/diff.vim')

if !has('nvim') || !has('unix')
  finish
endif

let s:RunDiff = funcref('gitgutter#diff#run_diff')

function! gitgutter#diff#run_diff(bufnr, from) abort
  if g:gitgutter_async && a:from ==# 'index'
        \ && luaeval("require('gitgutter_async').prepare_base_path(_A)", a:bufnr)
    return 'async'
  endif
  return s:RunDiff(a:bufnr, a:from)
endfunction
