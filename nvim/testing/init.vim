source ~/.config/nvim/testing/myplugins.vim
source ~/.config/nvim/testing/mytheme.vim

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


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set ignorecase

" Copy all file
nnoremap <leader>f :call CopyAll()<CR>

source ~/.config/nvim/testing/cocsettings.vim

"source ~/.config/nvim/hardmode.vim
source ~/.config/nvim/testing/myfunctions.vim
