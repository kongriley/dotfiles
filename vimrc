set nocompatible
filetype plugin on
syntax on
set shortmess+=I
set backspace=indent,eol,start
set hidden
set updatetime=300

set ignorecase
set smartcase

set incsearch
set number
set relativenumber
set laststatus=2
set noerrorbells visualbell t_vb=

" Fix weird default wrapping.
set wrap
set linebreak

set t_u7= " Fix weird behavior with Windows opening replace mode. 

" Mapping leader.
let mapleader=','

" Mapping colon.
noremap ;; ;
map ; :

" Mapping the Escape key for ergonomics.
inoremap jj <Esc>
inoremap kj <Esc>
inoremap jk <Esc>

" Converting tabs to spaces.
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set cindent

" Path to vault.
let s:vault = "/mnt/c/Users/Riley Kong/Documents/riley-vault/"

function DailyNote(cmd)
  let l:time = strftime("%Y-%m-%d")
  let l:formattime = strftime("%-m/%-d")
  let l:partial = s:vault . "00D. Daily Notes/"
  let l:path = l:partial . l:time . ".md"

  if empty(glob(l:path))
    execute a:cmd . " " . l:path
    execute "-1r " . l:partial . "Daily Note.md"
    execute "normal! " . "ggA" . l:formattime . "\<esc>" 
    call AddDailyNav()
  else
    execute a:cmd . " " . l:path
  endif
endfunction

function AddDailyNav()
  let l:yesterday = strftime("%Y-%m-%d", localtime() - 86400) 
  let l:today = strftime("%Y-%m-%d")
  let l:tomorrow = strftime("%Y-%m-%d", localtime() + 86400) 
  execute "normal! " . "ggo[[" . l:yesterday . "|< Yesterday]] - [[" . l:today . "|Today]] - [[" l:tomorrow . "|Tomorrow >]]\<esc>"
endfunction

" Snippets!
" Daily notes.
nnoremap <leader>dw :call DailyNote("vnew")<CR>
nnoremap <leader>da :call DailyNote("e")<CR>6jA 

" Plugins!!
" execute pathogen#infect()
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'vimwiki/vimwiki'
call plug#end()

nnoremap <leader>n :NERDTreeToggle<CR>
let g:airline_powerline_fonts = 1
let g:coc_global_extensions = [
	\ 'coc-clangd',
	\ 'coc-json',
  \ 'coc-python',
	\ 'coc-pairs',
	\ 'coc-snippets',
	\ 'coc-tsserver',
	\ 'coc-vetur'
  \ ] 
let g:vimwiki_list = [{
  \ 'path': s:vault,
  \ 'syntax': 'markdown',
  \ 'ext': '.md',
  \ }]

" confirm completion with `<leader>,`
inoremap <expr> <leader>, pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" navigate the completion list
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
