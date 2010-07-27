runtime! autoload/pathogen.vim

if exists('g:loaded_pathogen')
  call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundles'))
end

if has("gui_running")
    set guioptions=egmrt
    set showtabline=2
endif


set nocompatible
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set autoindent
set noeol
set binary

set linebreak

set listchars=tab:▹\ ,eol:¬
set list
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

let g:tex_flavor='latex'

match Todo /\s\+$/

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d :",
        \ &tabstop, &shiftwidth, &textwidth)
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>
