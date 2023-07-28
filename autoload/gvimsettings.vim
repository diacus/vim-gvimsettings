" ===========================================================================
" FILE        : autoload/gvimsettings.vim
" DESCRIPTION : Helper functions for GVim settings
" CREATED BY  : @diacus (diacus.magnuz@gmail.com)
" CREATION    : Fri Jul 28 01:16:09 AM CST 2023
" ===========================================================================
function! gvimsettings#resize_window()
  let txt_width = &textwidth > 0 ? &textwidth : 80
  let num_width = &number == 1 ? &numberwidth : 0
  let &columns = num_width + txt_width
  let &lines = 50
endfunction
