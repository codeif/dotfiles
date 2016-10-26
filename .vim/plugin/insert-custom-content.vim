" location ~/.vim/plugin/insert-custom-content.vim

function! PyFirstLine()
    " ~/.vim/plugin/in... is the path to the template file
    " r~/.vim/plugin/insert-custom-content.vim
    0
    call append(0, "# -*- coding: utf-8 -*-")
endfunction

nnoremap <C-i> :call PyFirstLine()<CR>
