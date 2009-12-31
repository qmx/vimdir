
runtime! autoload/pathogen.vim

if exists('g:loaded_pathogen')
  call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundles'))
end

set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab

syntax on
colorscheme vividchalk

nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>t :TlistToggle<CR>
