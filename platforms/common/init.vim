filetype off

set rtp+=$HOME/.config/nvim/bundle/Vundle.vim

set nocompatible
set number
"set term=xterm-256color
set background=dark
set laststatus=2
set nowrap

set tags=./tags;$HOME

set expandtab
set tabstop=2
set shiftwidth=2

call plug#begin('$HOME/.config/nvim/bundle')

Plug 'kien/ctrlp.vim'
"Removing solarized in favor of zenburn
"Plugin 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'flazz/vim-colorschemes'
"comment out the following line if in arch. Need to use aur setup or upstream installation
"Plugin 'valloric/youcompleteme'
Plug 'Shougo/deoplete.nvim'
Plug 'w0rp/ale'
Plug 'rrrene/credo'
Plug 'sheerun/vim-polyglot'

call plug#end()

let g:ale_linters = {
\    'elixir': ['credo']
\}

"set autoindent
"syntax enable
colorscheme zenburn 
