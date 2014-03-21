" Vim
" An example for a gvimrc file.
" The commands in this are executed when the GUI is started.
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.gvimrc
"             for Amiga:  s:.gvimrc
"  for MS-DOS and Win32:  $VIM\_gvimrc
"
" Pathogen plugin manager
execute pathogen#infect()

" Add extra way to exit from insert mode
inoremap jk <ESC>

" Allow dot command in visual mode
vnoremap . :norm.<CR>

" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" set the X11 font to use
" set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1

" Make command line two lines high
set ch=1

" Expand Tabs to Spaces
set et

" Show current mode
set noshowmode

" Search as I type
set incsearch

" Tabs are 4 spaces
set ts=4

" Shift width is 4 spaces set sw=4
set sw=4

" Display cursor position
set ruler

" Don't Maintain a Backup File
set nobackup

" Show line numbers
set nu

" Change map leader from \ to ,
let mapleader=","


" I like highlighting strings inside C comments
let c_comment_strings=1

" Switch on syntax highlighting.
syntax on

" UTF-8 support
set enc=UTF-8

" Switch on search pattern highlighting.
set hlsearch

" Hide the mouse pointer while typing
set mousehide

set background=dark
color solarized
call togglebg#map("<F5>")

" Save marks for 100 files, f1 = save global marks
set viminfo='20,f1

" Map <F2> to run recorded macros
map <F2> @r

" Tabularize for pipes using ,ap in normal or visual mode
nmap ,ap :Tabularize /\|<CR>
vmap ,ap :Tabularize /\|<CR>

" GO related configuration
" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to
" reload them.
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on

" Run go fmt on file save
autocmd FileType go autocmd BufWritePre <buffer> Fmt

let g:SuperTabDefaultCompletionType = "context"

" Add powerline support
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2

" Leader Shortcuts
"
"
" Remove whitespace
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
