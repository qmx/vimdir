runtime! autoload/pathogen.vim

if exists('g:loaded_pathogen')
  call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundles'))
end

if has("gui_running")
    set guioptions=egmrt
endif


set nocompatible
set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab
set noeol
set binary

set linebreak

set number

syntax on
filetype on
filetype indent on
filetype plugin on
compiler ruby

colorscheme vividchalk

nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>t :TlistToggle<CR>
nmap <leader>w <c-w>w
imap <c-space> <c-n>
