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
"set ch=1

" Expand Tabs to 4 Spaces
set et ts=4 sw=4 sts=4

" Show current mode
"set noshowmode

" Search as I type
set incsearch

" Display cursor position
"set ruler

" Don't Maintain a Backup File
set nobackup

" Show line numbers
set nu

" I like highlighting strings inside C comments
"let c_comment_strings=1

" Switch on syntax highlighting.
syntax on

" UTF-8 support
set enc=UTF-8

" Switch on search pattern highlighting.
set hlsearch

" Hide the mouse pointer while typing
set mousehide

" Allow hidden files that have not been saved
set hidden

set background=dark
color solarized
call togglebg#map("<F5>")

" Save marks for 100 files, f1 = save global marks
set viminfo='20,f1

" GO related configuration
" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to
" reload them.
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on

" Run go fmt on file save
au FileType go autocmd BufWritePre <buffer> GoFmt

" Auto close preview window after insertion
let g:ycm_autoclose_preview_window_after_insertion=1

" UltiSnips overrides to work better with YCM
let g:UltiSnipsExpandTrigger='<CR>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" Add powerline support
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
" Ensure powerline shows on single buffer
set laststatus=2

" Ctrl-t to toggle nerd tree
map <C-t> :NERDTreeToggle<CR>

" Auto close VIM if nerd tree is the last open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Change map leader from \ to ,
let mapleader=","
" Leader Shortcuts
"
"
" Remove whitespace
nnoremap <leader>w :%s/\s\+$//<CR>:let @/=''<CR>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Tabularize for pipes using <leader>ap in normal or visual mode
nmap <silent> <leader>ap :Tabularize /\|<CR>
vmap <silent> <leader>ap :Tabularize /\|<CR>

" Map <leader>r to run recorded macros
nmap <silent> <leader>r @r

" Import the package under the cursor
au Filetype go nnoremap <buffer> <leader>i :exe 'GoImport ' . expand('<cword>')<CR>

" Open a horizontal definition/declaration of the ID under the cursor
au Filetype go nnoremap <buffer> <leader>s :sp <CR>:exe "GoDef"<CR>

" Lint go files
au Filetype go nnoremap <buffer> <leader>l :GoLint<CR>
