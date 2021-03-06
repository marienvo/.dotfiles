map <C-u> :source ~/.vimrc<CR>
imap ,, <Esc>

let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1

set tabstop=4
set shiftwidth=4
set expandtab
set nu rnu
set nocompatible
filetype plugin on
syntax on

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'tbabej/taskwiki'

call plug#end()

imap <Tab> <C-t>
imap <S-Tab> <C-d>
let g:vimwiki_table_mappings=0 "makes sure tabs work as expected in insert mode for vimwiki
