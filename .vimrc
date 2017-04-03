" README - plugins
"
" PATHOGEN 
" just git clone a repository with plugin in ~/.vim/bundle/
"
" NERDTREE
" Ctrl-N  to open a file browser
"
" CLOSETAG
" when typing e tag, hit > two times to get ending tag in the separated line
"
" VIM-DISTINGUISHED
" color theme for vim
"
" DELIMITMATE
" automatically closes brackets and other delimiters (not tags!)
"
" SUPERTAB
" autcompletion using tab key
"
" SYNTASTIC
" for syntax checking
" hit :ll to jump to the next error
" :Error to see all errors
"
" VIM-SURROUND
" cs"’ change surr. of cursor
" ysiw<html> add tag 
" VS<body> add tag around selected lines
" ds( delete surround.
" yss( add ()for whole line
"
" BROWSERLINK
" track your changes in html files online
" grease monkey is need also with following script added to every page on
" http://localhost*:
" var src = document.createElement("script");
" src.src = "http://127.0.0.1:9001/js/socket.js";
" src.async = true;
" document.head.appendChild(src);


filetype off

execute pathogen#infect()
call pathogen#helptags()

" filetype on enables filetype detection by vim
filetype plugin indent on 

" Turn on that syntax highlighting
syntax enable

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
	set t_Co=256
endif

" Forget being compatible with good ol' vi
set nocompatible

set fileencoding=utf-8

" let delete everything
set backspace=indent,eol,start

" higlight current line
set cursorline

" show line's number
set number

" set size of tab
set tabstop=4
" set default shiftwidth (number of spaces used to indent)
set shiftwidth=4
" set the number of columns for a TAB
set softtabstop=4
" expand TABs to spaces
set expandtab

" grammar nazi
set spelllang=pl,en

" we dont want a backup files
set nobackup
set noswapfile

" Don't update the display while executing macros
set lazyredraw

" At least let yourself know what mode you're in
set showmode

" Show cmd when is executing
set showcmd

" Enable enhanced command-line completion. Presumes you have compiled
" with +wildmenu.  See :help 'wildmenu'
set wildmenu

" Set auto indent
set autoindent

" Higlight all search results
set hlsearch

" for brackets (will jump for a moment to the ending bracket)
set showmatch

" Set the status line the way I like it
set stl=%f\ %m\ %r\ Line:\ %l/%L[%p%%]\ Col:\ %c\ Buf:\ #%n\ [%b][0x%B]

" tell Vim to always put a status line in, even if there is only one
" window
set laststatus=2

" Hide the mouse pointer while typing
set mousehide

" disable mouse
set mouse= 

" vim-distinguished
colorscheme distinguished

" Hide toolbars and menus in gvim
set guioptions=ac

set history=100

" Allow the cursor to go in to "invalid" places
set virtualedit=all

" get rid of flashing when you reached the end of the file
set visualbell
set t_vb=

nmap <silent> ,ev :e $MYVIMRC<cr>
nmap <silent> ,b :buffers<cr>
nmap <silent> ,bb :b#<cr>
nmap <silent> ,bn :bnext<cr>
nmap <C-I> gg=G

" automatically compile tex files
:autocmd BufWritePost *.tex !pdflatex main.tex <afile>

let g:syntastic_python_checkers=['flake8', 'pep8'] 

" for closetag plugin
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

" open nerdtree automatically, when vim starts up
" autocmd vimenter * NERDTree
" hit ctrl-N to open the nerdtree window
map <C-n> :NERDTreeToggle<CR>

" syntastic errors will be populated in the loclist
" to jump to the nex error on the list hit :ll
let g:syntastic_always_populate_loc_list=1

:autocmd BufWritePost *.py !isort <afile>

" 
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=50
