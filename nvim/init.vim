source ~/.config/nvim/myplugins.vim
source ~/.config/nvim/mytheme.vim

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" highlight last inserted text
nnoremap gV `[v`]
" open ag.vim
nnoremap <leader>a :Ag
" nnoremap <leader>T :call ToggleNumber()
" nnoremap <leader>N :call NoNumbers()

set colorcolumn=82
hi cursorline guibg=#3a3a3a " highlight bg color of current line
hi cursorcolumn guibg=#3a3a3a " highlight cursor
hi ColorColumn guibg=#2e2e2e
hi ExtraWhitespace guibg=#550000
hi SpecialKey term=bold ctermfg=DarkCyan guifg=#555555
set backspace=indent,eol,start " backspace for dummys
set showmatch " show matching brackets/parenthesis

" NerdTree
map <C-n> :NERDTreeToggle<CR>
nmap <silent> <F2> :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1

" Tagbar
nmap <F8> :TagbarToggle<CR>

" TABS
" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>


" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect


""""""""""""""
" PHPACTOR
""""""""""""""
" Include use statement
nmap <Leader>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap <Leader>mm :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
nmap <Leader>nn :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
nmap <Leader>oo :call phpactor#GotoDefinition()<CR>
nmap <Leader>oh :call phpactor#GotoDefinitionHsplit()<CR>
nmap <Leader>ov :call phpactor#GotoDefinitionVsplit()<CR>
nmap <Leader>ot :call phpactor#GotoDefinitionTab()<CR>

" Show brief information about the symbol under the cursor
nmap <Leader>K :call phpactor#Hover()<CR>
autocmd FileType php setlocal omnifunc=phpactor#Complete

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set ignorecase

let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
au BufWritePost *.php silent! !eval '[ -f ".git/hooks/ctags" ] && .git/hooks/ctags' &

" Copy all file
nnoremap <leader>f :call CopyAll()<CR>

" Disable aerrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

source ~/.config/nvim/myfunctions.vim
