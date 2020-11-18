call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'phanviet/vim-monokai-pro'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'chrisbra/Colorizer'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'vim-scripts/AutoComplPop'
call plug#end()
" =======


"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" Enable syntax highlight
syntax on


"== color scheme
colorscheme gruvbox

" Visual highlight
highlight Visual cterm=NONE ctermbg=0 ctermfg=NONE guibg=Grey40
" highlight Normal ctermbg=NONE ctermfg=NONE guibg=NONE
" highlight NonText ctermbg=NONE guibg=NONE
" highlight LineNr ctermbg=NONE guibg=NONE

" -----------------------------------------------------------------------------
" Basic Settings
" -----------------------------------------------------------------------------
"

set timeoutlen=1000 ttimeoutlen=0
set encoding=utf-8
inoremap jk <Esc>
set nu rnu
set ruler
filetype plugin on
set cursorline
set nospell
set spelllang=en_us
set shortmess+=c
set clipboard=unnamedplus	"paste in system clipper board"
set wildmenu
set splitbelow splitright
set mouse=a
set nohlsearch

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Complete
set complete+=kspell
set completeopt=menuone,longest

" Display hex color code
let g:colorizer_auto_filetype='css,html,json'

"== colorful brackets
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme,python,vim RainbowParentheses
augroup END

" Automatically deletes all trailing whitespace and newlines at end of file on save.
  autocmd BufWritePre * %s/\s\+$//e
  autocmd BufWritepre * %s/\n\+\%$//e

"== display buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_powerline_fonts = 1
" let g:airline_theme='simple'


" -----------------------------------------------------------------------------
" Custom Keybindings
" -----------------------------------------------------------------------------

"== Run Python script with F9
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

"== Run Python script with F9
autocmd FileType ruby map <buffer> <F9> :w<CR>:exec '!ruby' shellescape(@%, 1)<CR>
autocmd FileType ruby imap <buffer> <F9> <esc>:w<CR>:exec '!ruby' shellescape(@%, 1)<CR>

"== Nerd Tree Toggle
map <F2> :NERDTreeToggle<CR>

"== Rename python variables
nmap <silent> <leader>rr :Semshi rename<CR>

"== Python stuff
" au BufNewFile,BufRead *.py
"     \ set expandtab       |" replace tabs with spaces
"     \ set autoindent      |" copy indent when starting a new line
"     \ set tabstop=4
"     \ set softtabstop=4
"     \ set shiftwidth=4
"Python 3 host program
let g:python3_host_prog='/usr/bin/python3'

function MyCustomHighlights()
    hi semshiGlobal      ctermfg=red guifg=#ff0000
endfunction
autocmd FileType python call MyCustomHighlights()
autocmd ColorScheme * call MyCustomHighlights()
