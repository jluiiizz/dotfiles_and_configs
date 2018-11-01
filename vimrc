set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

" Install NERDTree
Plug 'scrooloose/nerdtree'

" Install vim-airline
Plug 'vim-airline/vim-airline'

" Install Auto-Pair
Plug 'jiangmiao/auto-pairs'

" Install CtrlP
Plug 'ctrlpvim/ctrlp.vim'

" Install Nord Theme
Plug 'arcticicestudio/nord-vim'

call plug#end()

filetype plugin indent on

syntax enable

set noswapfile

set number relativenumber

let g:airline_powerline_fonts = 1
let g:airline_extensions = []

colorscheme nord

set tabstop=4
set shiftwidth=4
set expandtab
