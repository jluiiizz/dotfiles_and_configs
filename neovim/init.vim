call plug#begin('~/.local/share/nvim/plugged')

" Plugins

Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Themes & Style
Plug 'vim-airline/vim-airline-themes'
Plug 'sainnhe/gruvbox-material'
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim'

" Elixir & Erlang
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-compiler'
Plug 'vim-erlang/vim-erlang-omnicomplete'
Plug 'vim-erlang/vim-erlang-tags'
Plug 'vim-erlang/vim-erlang-skeletons'

call plug#end()

" Basics

let mapleader = "\<Space>"

filetype plugin on
set number relativenumber
set noswapfile

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

fun! <SID>StripTW()
    let l = line(".")
    let c = col(".")
    keepp %s/\s\+$//e
    call cursor(l, c)
endfun

set backspace=2
set backspace=indent,eol,start

" Style

if has('termguicolors')
  set termguicolors
endif

set background=dark

let g:gruvbox_material_background = 'soft'
let g:airline_theme='gruvbox_material'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1

colorscheme gruvbox-material

" Bindings

nnoremap <Leader>1 :NERDTreeToggle<CR>

nnoremap <Leader>rvc :vsplit ~/.config/nvim/init.vim<CR>
nnoremap <Leader><CR> :source ~/.config/nvim/init.vim<CR>

inoremap <C-s> <Esc>:w<CR>
nnoremap <C-s> :w<CR>

inoremap <A-BS> <C-W>

inoremap <C-o> <Esc>o
inoremap <C-O> <Esc>O

nnoremap <Leader>t :below new +term<CR> :resize 10<CR>i
tnoremap <ESC> <C-\><C-N>
tnoremap jk <C-\><C-N>
tnoremap <Space><Space> <C-\><C-N>

nnoremap <Leader>f :only<CR>
nnoremap <Leader>b :buffer
nnoremap <Leader>l :Buffers<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>q :bd<CR>
nnoremap <Leader>fq :!bd<CR>
nnoremap <Leader>w :q<CR>
nnoremap <Leader>fw :!q<CR>
nnoremap <Leader>sw :wq<CR>
nnoremap <Leader>oo o<Esc>k
nnoremap <Leader>OO O<Esc>j

nnoremap <C-a> :Files
nnoremap <C-f> :Files<CR>
nnoremap <Leader>zb :BLines<CR>
nnoremap <Leader>zs :Lines<CR>

nnoremap <Leader><Space> :nohlsearch<CR>

" Autos

autocmd BufWritePre * :call <SID>StripTW()

" Plugins Specific

" * FZF
let g:fzf_preview_window = 'right:60%'
let g:fzf_layout = {'down': '50%'}

let g:fzf_colors =
            \ { 'fg':    ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }
