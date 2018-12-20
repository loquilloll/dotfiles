" TODO current problems: * end key not working undef tmux+fish ============================================================================
" Vim-plug initialization
" Avoid modify this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.config/nvim/autoload
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Obscure hacks done, you can now modify the rest of the .vimrc as you wish :)

" ============================================================================
" Active plugins
" You can disable or add new ones here:

" this needs to be here, so vim-plug knows we are declaring the plugins we
" want to use
call plug#begin('~/.config/nvim/plugged')

" Now the actual plugins:

" Code commenter
Plug 'scrooloose/nerdcommenter'

" Better file browser
Plug 'scrooloose/nerdtree'

" Search results counter
Plug 'vim-scripts/IndexedSearch'

"Syntax highlighting Javascript
Plug 'pangloss/vim-javascript'

"Dockerfile syntax highlighting
Plug 'ekalinin/Dockerfile.vim'

"json helper, syntax highlighting
Plug 'elzr/vim-json'

"Syntax highlighting JSX
Plug 'mxw/vim-jsx'

" Highlight matching html tags when cursor is on it
Plug 'valloric/MatchTagAlways'

" Automatically close parenthesis, etc
Plug 'jiangmiao/auto-pairs'

" Mark indents blocks
Plug 'Yggdroot/indentLine'

"auto complete html tag
Plug 'alvan/vim-closetag'

" es2015 code snippets (optional)
Plug 'epilande/vim-es2015-snippets'

" react code snippets
Plug 'epilande/vim-react-snippets'

" ultisnips
Plug 'sirver/ultisnips'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"multi-syntax context-sensitive color name highlighter
"Plug 'ap/vim-css-color'
Plug 'lilydjwg/colorizer'

"============Auto Completion==============
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'wokalski/autocomplete-flow'
  " For func argument completion
  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'
  " Deoplete autocompletion for Python
  Plug 'zchee/deoplete-jedi'
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif


"Select autocompletion menu with tab
Plug 'ervandew/supertab'

" Tell vim-plug we finished declaring plugins, so it can load them
:z
call plug#end()

" ============================================================================
" Install plugins the first time vim runs

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

"===============Themes\Colors==========================

let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1
set t_Co=256
syntax on
set background=dark
colorscheme escuro

"lilydjwg/colorizer This plugin is still inefficient for large files
let g:colorizer_maxlines = 1000

"vim-scripts/IndexedSearch
let g:indexed_search_colors=0

"Split bar colors


"====================NERDTree===========================

" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
" Show hidden files
let NERDTreeShowHidden = 1

"=================Folding========================
"Folding based on indentation:
autocmd FileType python set foldmethod=indent
set foldmethod=indent
"use space to open folds
nnoremap <space> za
"Exit Insert mode quickly
inoremap jj <ESC>

"==============Navigations============
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" tab navigation mappings
map tt :tabnew 
map <M-Right> :tabn<CR>
imap <M-Right> <ESC>:tabn<CR>
map <M-Left> :tabp<CR>
imap <M-Left> <ESC>:tabp<CR>

"===========Auto Completion Settings===========
set completeopt+=noinsert "select first item automatically

let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#show_call_signatures = 0
let g:SuperTabDefaultCompletionType = "<c-n>" "Tab goes down the menu

" Deoplete -----------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:context_filetype#same_filetypes = {} " complete with words from any opened file
let g:context_filetype#same_filetypes._ = '_'
" select soures based on file type
		call deoplete#custom#option('sources', {
		\ '_': ['buffer'],
		\ 'cpp': ['buffer', 'tag'],
    \ 'python' : ['jedi'],
\})

"--------------- Jedi-vim ------------------------------
"" Disable autocompletion (using deoplete instead)
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#show_call_signatures = 0

"=======================================================

" tabs and spaces handling
set expandtab " expand tabs by default (overloadable per file type)
set shiftwidth=2 " number of spaces to use for autoindenting
set softtabstop=2 " when hitting <BS>, pretend like a tab is removed, even if spaces
set tabstop=2 " tabs are n spaces

" turn hybrid line numbers on
set number relativenumber

"Increment Live Feedback
set inccommand=split

"Highlight match tag
"let g:mta_use_matchparen_group = 1

"valloric/MatchTagAlways
let g:mta_filetypes = {
  \ 'html' : 1,
  \ 'xhtml' : 1,
  \ 'xml' : 1,
  \ 'jinja' : 1,
  \ 'javascript.jsx' : 1}

"Enable mount input
set mouse=n

"Open split down and Right
set splitbelow
set splitright


