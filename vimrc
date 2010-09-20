runtime! autoload/pathogen.vim

if exists('g:loaded_pathogen')
  call pathogen#runtime_prepend_subdirectories(expand('~/.vim/bundles'))
end

if has("gui_running")
    set guioptions=egmrt
    set showtabline=2
endif

""" fix for some stupid terms
if &term == "screen"
	let term = "xterm"
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

""" autocomplete config
set wildmode=list:longest,full

""" show mode in use (insert, visual, ...)
set showmode
set showcmd

""" mouse behavior like in terminal (without X)
set mouse=c

""" no wrap lines (duh!)
set nowrap

""" indent control
set autoindent
set smartindent

""" show match parentesis
set showmatch

""" statusline config
""" %y = file type
""" %t = file name
""" %l = current line
""" %c = current column
""" %V = current virtual column
""" %P = position into file
set laststatus=2
set statusline=%y\ %t\ %=\ %(%-l,%-c%-V\ %-P%)

""" show reduced msgs
set shm=filmnrwxt

set linebreak

set listchars=tab:▹\ ,eol:¬
set list
""" syntax colors
syntax on
filetype on
filetype indent on
filetype plugin on
compiler ruby

colorscheme desert
set background=dark

""" folding settings
set nofoldenable
augroup vimrc
	au BufReadPre * setlocal foldmethod=indent
	au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

""" remapping leader to comma key
let mapleader = ","

nmap <leader>f :set foldmethod=indent<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>t :TlistToggle<CR>
nmap <leader>w <c-w>w
nmap <leader>j :JavaSearchContext<CR>

let g:tex_flavor='latex'

""" some sanite mappings
cab WQ wq | cab Wq wq | cab W w | cab Q q

" Indent XML readably
function! DoPrettyXML()
	1,$!xmllint --format --recover -
endfunction
command! PrettyXML call DoPrettyXML()
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
