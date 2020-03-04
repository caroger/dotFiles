" source current vimrc file by `:so %`
" install plug-ins by `:PlugInstall`
" Plug-ins Management using the vim-plug manager
" plug-ins are saved here '~/.vim/plugged'
"============================================================================="
call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes'                   " collection of color schemes 
Plug 'jiangmiao/auto-pairs'                     " Inser to delete brackets,
                                                " parens, quotes in pair
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'                                                
Plug 'tell-k/vim-autopep8'			"Autopep8
Plug 'tpope/vim-surround'           "Auto surronding
call plug#end()


"""========================================================================="""


"Space & Tabs"
set tabstop=4            " number of visual spaces per TAB
set expandtab            " tabs are spaces
set softtabstop=4        " number of spaces in tab when editing
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
set laststatus=2        " always show status bar
set scrolloff=2         " always show 1 line after cursor"
"Searching"
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
"turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>        

"Shortcuts"
"============================================================================="
" jk is escape
inoremap jk <esc>
" F8 is autopep8
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

"Colors"
"============================================================================="
colorscheme gruvbox     " awesome colorscheme
let g:airline_theme='badwolf'
set background=dark
syntax enable            " enable syntax processing
