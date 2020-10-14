call plug#begin()
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'phanviet/vim-monokai-pro'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'dense-analysis/ale'
Plug 'vim-scripts/AutoComplPop'
call plug#end()
" =======

set timeoutlen=1000 ttimeoutlen=0
set encoding=utf-8
inoremap jk <Esc>

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" Enable syntax highlight
syntax on


"== color scheme
colorscheme monokai_pro

" Visual highlight 
highlight Visual cterm=NONE ctermbg=0 ctermfg=NONE guibg=Grey40

" -----------------------------------------------------------------------------
" Status line
" -----------------------------------------------------------------------------

" Heavily inspired by: https://github.com/junegunn/dotfiles/blob/master/vimrc
function! s:statusline_expr()
  let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
  let ro  = "%{&readonly ? '[RO] ' : ''}"
  let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
  let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
  let sep = ' %= '
  let pos = ' %-12(%l : %c%V%) '
  let pct = ' %P'

  return '[%n] %f %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
endfunction

let &statusline = s:statusline_expr()

" -----------------------------------------------------------------------------
" Basic Settings
" -----------------------------------------------------------------------------
"

set nu rnu	
set ruler
filetype plugin on 
set cursorline
set nospell
set spelllang=en_us
set shortmess+=c
set clipboard=unnamedplus	"paste in system clipper board"
set timeoutlen=1000 ttimeoutlen=0
set encoding=utf-8
inoremap jk <Esc>
set wildmenu
set splitbelow splitright
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Complete
set complete+=kspell
set completeopt=menuone,longest

"== colorful brackets
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme,python,vim RainbowParentheses
augroup END
""== display buffers
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'default'
"let g:airline_powerline_fonts = 1


" -----------------------------------------------------------------------------
" Custom Keybindings 
" -----------------------------------------------------------------------------
"== display buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline_theme='simple'
"== Tmux status
" let g:tmuxline_theme = 'zenburn'
let g:tmuxline_preset = 'full'

"== Run Python script with F9
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

"== Run Python script with F9
autocmd FileType ruby map <buffer> <F9> :w<CR>:exec '!ruby' shellescape(@%, 1)<CR>
autocmd FileType ruby imap <buffer> <F9> <esc>:w<CR>:exec '!ruby' shellescape(@%, 1)<CR>

"== Nerd Tree Toggle
map <F2> :NERDTreeToggle<CR>

"== Jump around errors
:nmap ]a :ALENextWrap<CR>
:nmap [a :ALEPreviousWrap<CR>
:nmap ]A :ALELast
:nmap [A :ALEFirst

"== Rename python variables
nmap <silent> <leader>rr :Semshi rename<CR>

"== Linting
let g:ale_linters = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\   'python': ['pylint'],
\}
let g:ale_fixers = {
\   'ruby': ['rubocop'],
\   'python': ['black', 'isort'],
\}
let g:ale_fix_on_save = 1


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
