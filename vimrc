" source current vimrc file by `:so %`
" install plug-ins by `:PlugInstall`
" Plug-ins Management using the vim-plug manager
" plug-ins are saved here '~/.vim/plugged'
"============================================================================="
call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes'                   " collection of color schemes 
Plug 'tpope/vim-sensible'                       " Vim beginner set-ups
Plug 'jiangmiao/auto-pairs'                     " Inser to delete brackets,
                                                " parens, quotes in pair
Plug 'vim-airline/vim-airline'
call plug#end()

"""========================================================================="""

"Colors"
colorscheme badwolf     " awesome colorscheme
syntax enable           " enable syntax processing

"Space & Tabs"
set tabstop=4           " number of visual spaces per TAB
set expandtab           " tabs are spaces
set softtabstop=4       " number of spaces in tab when editing
set shiftwidth=4
" verticle line at 80 char
set colorcolumn=80

"UI Config"
set number              " show line number
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]

"Searching"
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
"turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>        

"Shortcuts"
" jk is escape
inoremap jk <esc>

"python configuration"
"" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime
set cmdheight=1     "Height of command bar"
set lazyredraw      "Don't redraw while executing macros"
set laststatus=2    "Always show status line"
