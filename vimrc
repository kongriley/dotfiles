set nocompatible
syntax on
set shortmess+=I
set number
set relativenumber
set laststatus=2
set backspace=indent,eol,start
set hidden
set updatetime=300

set ignorecase
set smartcase

set incsearch

set noerrorbells visualbell t_vb=
set t_u7= " Fix weird behavior with Windows opening replace mode. 

let mapleader=','

" Mapping the Escape key for ergonomics.
imap jj <Esc>
imap kj <Esc>
imap jk <Esc>

" Converting tabs to spaces.
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set cindent

" Plugins!!
" execute pathogen#infect()
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'

call plug#end()

nnoremap <leader>n :NERDTreeToggle<CR>
let g:airline_powerline_fonts = 1
let g:coc_global_extensions = [
	\ 'coc-clangd',
	\ 'coc-json',
	\ 'coc-pairs',
	\ 'coc-snippets',
	\ 'coc-tsserver',
	\ 'coc-vetur'
  \ ] 
" confirm completion with `<leader>,`
inoremap <expr> <leader>, pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" navigate the completion list
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
