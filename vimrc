set nocompatible
syntax on
set shortmess+=I
set number
set relativenumber
set laststatus=2
set backspace=indent,eol,start
set hidden

set ignorecase
set smartcase

set incsearch

nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

set noerrorbells visualbell t_vb=

" Mapping the Escape key for ergonomics.
imap jj <Esc>
imap kj <Esc>
imap jk <Esc>

" Converting tabs to spaces.
set tabstop=2
set shiftwidth=2
set expandtab

" Plugins!!
execute pathogen#infect()

let g:airline_powerline_fonts = 1
