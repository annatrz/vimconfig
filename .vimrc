" SHORTCUTS
"
" :e                    reload file
"
" ‘.                    jump to last edited line
" g;                    jump to last edited position
" :ll                   jump to error
"
" *                     search for occurrences under cursor
"
" :%                    mark whole file
" yy                    copy whole line
"
" >                     to fix indent
" ==                    indent current line
"
" Ctrl-Z                to go to terminal
" fg                    to go back
"
" CTRL-o                go back to last location
" CTRL-r                replace variable name
"
" CTRL-x                split tab
" CTRL-v                vertical split tab
"
"""""""""""""""""""""""""
" Closetag
"
"<tag>>                  use extra > when closing tag to move to the next line
"
"""""""""""""""""""""""""
" Surroundings
"
" ds"                   delete surroundings "
" dst                   delete surrounding tag
" cs"'                  change surroundings from " to '
" cs'<q>                change surroundings from ' to <q> tag
" cst"                  change surroundings tag to "
" ysiw[                 yank surrounding [ in word
" yss[                  yank surrounding [ for sentence (line)
" VS<p class="cls">     insert surrounding using viusal mode
"
"""""""""""""""""""""""""
" Jedi
"
" for python completion|definitions|refs
" needs python-language-server for python
"
"
" <C-Space>             completion
" <leader>g             goto function
" <leader>d             goto definition
" <leader>r             rename
" <leader>n             show all usages of a name
" K                     show documentation
"
"""""""""""""""""""""""""
" DelimitMate
"
" close brackets
"
"""""""""""""""""""""""""
" ALE
"
" for linting and fixing
"
"""""""""""""""""""""""""
" Airline
"
" powerline for vim
"
"""""""""""""""""""""""""

packadd! nord-vim
colorscheme nord

filetype off

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

" higlight all search results
set hlsearch

" for brackets (will jump for a moment to the ending bracket)
set showmatch

" tell Vim to always put a status line in, even if there is only one
" window
set laststatus=2

" hide the mouse pointer while typing
set mousehide

" disable mouse
set mouse=

" hide toolbars and menus in gvim
set guioptions=ac

set history=100

" allow the cursor to go in to "invalid" places
set virtualedit=all

" get rid of flashing when you reached the end of the file
set visualbell
set t_vb=

" set space as a leader key, make sure wasnt used before
nnoremap <SPACE> <Nop>
let mapleader=" "

" some useful shortcuts
nmap <leader>ev :e $MYVIMRC<cr>
nmap <leader>b :buffers<cr>
nmap <leader>bb :b#<cr>
nmap <leader>bn :bnext<cr>

" indent al lines
nmap <leader>i gg=G

" ctrl p
nnoremap <leader>p :FZF<CR>

" automatically compile tex files
autocmd BufWritePost *.tex !pdflatex main.tex <afile>

" share default vim register with system one
set clipboard=unnamed

"""""""""""""""""""""""""
" vim-airline handle powerline fonts
"""""""""""""""""""""""""
let g:airline_powerline_fonts = 1

"""""""""""""""""""""""""
" ALE
"""""""""""""""""""""""""
let g:ale_linters = {
\   'python': ['flake8', 'pydocstyle'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'python': ['yapf','isort']
\}
let g:ale_fix_on_save = 1
let g:ale_completion_autoimport = 1

"""""""""""""""""""""""""
" DelimitMate handle triple quotes in python
"""""""""""""""""""""""""
autocmd FileType python let b:delimitMate_nesting_quotes = ['"']

"""""""""""""""""""""""""
" Vim-closetag which files types
"""""""""""""""""""""""""
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.php,*.js,*.jsx"
