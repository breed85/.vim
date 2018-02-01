" Vim
" The commands in this are executed when the GUI is started.
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.gvimrc
"             for Amiga:  s:.gvimrc
"  for MS-DOS and Win32:  $VIM\_gvimrc
"
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'elzr/vim-json'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'jeffkreeftmeijer/vim-numbertoggle.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



" Pathogen plugin manager
"execute pathogen#infect()




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
set ruler

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

" Manage backspace behaviors
set backspace=indent,eol,start

" Search upstream for a tags file
set tags=./tags;/

set background=dark
"color solarized
"call togglebg#map("<F5>")

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
"au FileType go autocmd BufWritePre <buffer> GoFmt

" Disable the auto install of GO commands
let g:go_disable_autoinstall = 1

" Auto close preview window after insertion
let g:ycm_autoclose_preview_window_after_insertion=1

" YCM overrides to better work with UltiSnips
let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']

" Super tab override to let YCM work better with UltiSnips
let g:SuperTabDefaultCompletionType = '<C-Tab>'

" Add powerline support
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup
" Ensure powerline shows on single buffer
set laststatus=2

" Ctrl-t to toggle nerd tree
map <C-t> :NERDTreeToggle<CR>

" Auto close VIM if nerd tree is the last open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Ctrl-p user command for speed
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files --exclude-standard -co', "find %s -type f | egrep -v '/\.(git|hg|svn)|solr|tmp/"]

" Ctrl-p Keep caches between sessions - f5 to refresh
let g:ctrlp_clear_cache_on_exit = 0

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
"au Filetype go nnoremap <buffer> <leader>i :exe 'GoImport ' . expand('<cword>')<CR>

" Open a horizontal definition/declaration of the ID under the cursor
"au Filetype go nnoremap <buffer> <leader>s :sp <CR>:exe "GoDef"<CR>

" Jump to definition/declaration of the ID under the cursor
"au Filetype go nnoremap <buffer> <leader>d :exe "GoDef"<CR>

" Lint go files
"au Filetype go nnoremap <buffer> <leader>l :GoLint<CR>
