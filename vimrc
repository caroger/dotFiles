" install plug-ins by `:PlugInstall`
" Plug-ins Management using the vim-plug manager
" plug-ins are saved here '~/.vim/plugged'
"============================================================================="
call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'                " Grve box theme
Plug 'jiangmiao/auto-pairs'                     " Inser to delete brackets,
                                                " parens, quotes in pair
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'                                                
Plug 'tpope/vim-surround'           "Auto surronding
Plug 'tpope/vim-fugitive'           "Git
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
" For markdowns
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Code formatting
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

call plug#end()
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"

"""========================================================================="""

"Space & Tabs"
set tabstop=4            " number of visual spaces per TAB
set expandtab            " tabs are spaces
set softtabstop=4        " number of spaces in tab when editing
set shiftwidth=4

"UI Config"
set nu rnu              " show relative line number
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set laststatus=2        " always show status bar
set scrolloff=1         " always show 1 line after cursor"
"Searching"
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

"Shortcuts"
"============================================================================="
" jk is escape
inoremap jk <esc>

" F2 is toggle nerdTree
map <F2> :NERDTreeToggle<CR>
"turn off search highlight with \space
nnoremap <leader><space> :nohlsearch<CR>        

" F5 is save file and run python script
autocmd FileType python map <buffer> <F5> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F5> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>
"Colors"
"============================================================================="
syntax enable            " enable syntax processing
colorscheme gruvbox     " awesome colorscheme
set background=dark

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='dark'
"Plugin Config"
"============================================================================="
"Markdown
let g:vim_markdown_folding_disabled = 1

"Markdown Preview

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 1

" google code formatter
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer black
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END
