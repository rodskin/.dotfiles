call plug#begin('~/.vim/plugged')
Plug 'sjl/gundo.vim'
"Plug 'sjl/badwolf', { 'as': 'badwolf' }
Plug 'kien/ctrlp.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'universal-ctags/ctags'
Plug 'itchyny/lightline.vim'
Plug 'amiorin/vim-project'
Plug 'mhinz/vim-startify'
"Plug 'stephpy/vim-php-cs-fixer'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug '~/.fzf'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'nelsyeung/twig.vim'
Plug 'preservim/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'yegappan/mru'
Plug 'chrisbra/SudoEdit.vim'
Plug 'drmingdrmer/vim-tabbar'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-surround'

" Plug 'ycm-core/YouCompleteMe'
Plug 'ryanoasis/vim-devicons'
Plug 'powerline/fonts'

" PHP Plugins
"Plug 'StanAngeloff/php.vim'
"Plug 'phpactor/phpactor' ,  {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
"Plug 'vim-php/phpctags'
"Plug 'phpactor/ncm2-phpactor'
"Plug 'rayburgemeestre/phpfolding.vim'
Plug 'preservim/tagbar'


" USAGE
"Plug 'frazrepo/vim-rainbow'

" Require ncm2 and this plugin
"Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'

" Whiteroom pour avoir le script en full screen
"Plug 'vim-scripts/DistractFree'
Plug 'junegunn/goyo.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'stephpy/vim-php-cs-fixer'


" DATABASE
" Plug 'lighttiger2505/sqls.vim'
"Plug 'nanotee/sqls.nvim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'neovim/nvim-lspconfig'
"Plug 'williamboman/nvim-lsp-installer'
"Plug 'jobo3208/nvim-mysql'
Plug 'vim-scripts/dbext.vim'
call plug#end()
