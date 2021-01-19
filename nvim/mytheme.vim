colorscheme dracula     " awesome colorscheme
syntax enable           " enable syntax processing
set noswapfile      " no swap file! This is just annoying
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing<Paste>
set expandtab sw=4 ts=4   
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line<Paste>
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set splitbelow
set splitright
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level
let mapleader=","       " leader is comma

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" don't use arrowkeys
" noremap <Up> <NOP>
" noremap <Down> <NOP>
" noremap <Left> <NOP>
" noremap <Right> <NOP>

" really, just don't
" inoremap <Up>    <NOP>
" inoremap <Down>  <NOP>
" inoremap <Left>  <NOP>
" inoremap <Right> <NOP>
" highlight non ascii, suspect characters
au VimEnter,BufWinEnter * syn match ErrorMsg '[^\x00-\x7F€àÀâÂéÉèÈêÊëËîÎïÏôÔöÖûÛùÙüÜçÇœŒæÆ]'
" ====================
" Touche TAB améliorée
" ====================
" decalage en mode visuel
vmap <TAB> >gv
vmap <S-TAB> <gv
