let mapleader =" "

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'chrisbra/Colorizer'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-endwise'
Plug 'vim-ruby/vim-ruby'
Plug 'dewyze/vim-ruby-block-helpers'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-rails'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'vim-scripts/AutoComplPop'
Plug 'ervandew/supertab'
Plug 'kien/ctrlp.vim'
Plug 'dense-analysis/ale'
Plug 'luochen1990/rainbow'
Plug 'joshdick/onedark.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'marcopaganini/termschool-vim-theme'
Plug 'NLKNguyen/papercolor-theme'
Plug 'patstockwell/vim-monokai-tasty'

call plug#end()


"== color scheme
set t_Co=256
syntax enable
set background=dark
colorscheme PaperColor
hi Normal guibg=NONE ctermbg=NONE
" -----------------------------------------------------------------------------
" Basic Settings
" -----------------------------------------------------------------------------
"

set timeoutlen=1000 ttimeoutlen=0
set encoding=utf-8
set nu
set ruler
set cursorline
set nospell
set spelllang=en_us
set shortmess+=c
set clipboard=unnamedplus	"paste in system clipper board"
set wildmenu
set splitright splitbelow
set mouse=a
set nohlsearch
set hidden
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Complete
" set complete+=kspell
" set completeopt=menuone,longest
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:SuperTabDefaultCompletionType = "<c-n>"

let g:deoplete#enable_at_startup = 1
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \}

" Display hex color code
let g:colorizer_auto_filetype='css,json,yml'

"== colorful brackets

let g:rainbow_active = 1

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
hi airline_c  ctermbg=NONE guibg=NONE
hi airline_tabfill ctermbg=NONE guibg=NONE

" -----------------------------------------------------------------------------
" Custom Keybindings
" -----------------------------------------------------------------------------
nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>af :ALEFix<CR>
nnoremap <leader>at :ALEToggle<CR>
" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" nnoremap j jzz
" nnoremap k kzz
" nnoremap G Gzz

"== Focus mode
map <leader>f :Goyo<CR>

"== buffers
map <leader>n :bn<cr>
map <leader>p :bp<cr>
map <leader>d :bd<cr>


"== Run Python script with F9
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

"== Run Python script with F9
autocmd FileType ruby map <buffer> <F9> :w<CR>:exec '!ruby' shellescape(@%, 1)<CR>
autocmd FileType ruby imap <buffer> <F9> <esc>:w<CR>:exec '!ruby' shellescape(@%, 1)<CR>

"== Nerd Tree Toggle
map <F2> :NERDTreeToggle<CR>


"== Python stuff
au BufNewFile,BufRead *.py
    \ set expandtab       |" replace tabs with spaces
    \ set autoindent      |" copy indent when starting a new line
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
"Python 3 host program
let g:python3_host_prog='/usr/bin/python3'


let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = 'find %s -type f'

"== goyo
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'transparent_background': 1
  \     }
  \   }
  \ }

let g:ale_fixers = {
\  'ruby':['rubocop'],
\}

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
