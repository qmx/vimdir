set nocompatible               " be iMproved
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'adrianoalmeida7/vim-afc'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kien/ctrlp.vim'
Bundle 'lukaszb/vim-web-indent'
Bundle 'jamessan/vim-gnupg'
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'mattn/zencoding-vim'
Bundle 'qmx/vim-json'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-surround'
Bundle 'tsaleh/vim-align'
Bundle 'tsaleh/vim-matchit'
Bundle 'vim-scripts/asciidoc.vim'
Bundle 'vim-scripts/c.vim'
Bundle 'vim-scripts/VimClojure'
Bundle 'vim-scripts/cscope_macros.vim'
Bundle 'vim-scripts/trailing-whitespace'

let g:vundle_default_git_proto = 'git'

filetype plugin indent on

let g:GPGDefaultRecipients = ["qmx@qmx.me"]
let g:user_zen_expandabbr_key = '<c-y>' 
let g:use_zen_complete_tag = 1

if has("autocmd")
	" File type detection
	filetype on
	filetype plugin indent on

	"default settings"
	set ts=2 sts=2 sw=2 expandtab

	" Styles depending on file type
	autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
	autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType markdown setlocal ts=4 sts=4 sw=4 expandtab

	" Treat different file types as one we know:
	autocmd BufNewFile,BufRead *.rss,*.atom setfiletype xml
	autocmd BufNewFile,BufRead Thorfile,Rakefile,*.watchr setfiletype ruby
	autocmd BufNewFile,BufRead *.clj setfiletype clojure
endif

set guifont=Menlo:h14

set smarttab
set autoindent
set noeol
set binary

""" ignore list
set wildignore+=*.o,*.obj,*.class,.git,bin,target

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

" set listchars=tab:▹\ ,eol:¬
" set list
""" syntax colors
syntax on
filetype on
filetype indent on
filetype plugin on

colorscheme desert
set background=dark

""" cursor line
set cursorline

""" line numbers
set number

""" folding settings
set nofoldenable
augroup vimrc
	au BufReadPre * setlocal foldmethod=indent
	au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

""" remapping leader to comma key
let mapleader = ","
let maplocalleader = ","

""" reload .vimrc
nmap <leader>v :source $MYVIMRC<CR>
nmap <leader>V :tabnew $MYVIMRC<CR>

nmap <leader>f :set foldmethod=indent<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>w :set wrap<CR>
nmap <leader>W :set nowrap<CR>


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

" Settings for VimClojure
let vimclojure#HighlightBuiltins =1
let vimclojure#ParenRainbow =1
let vimclojure#FuzzyIndent=0
let vimclojure#WantNailgun=1