map <C-u> :source ~/.vimrc<CR>
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
