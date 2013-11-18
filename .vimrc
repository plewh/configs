syntax on
set showmatch
set number
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set mouse=a
set ttymouse=xterm2

nnoremap i :w<CR>i
inoremap <C-[> <C-[>:w<CR>
nnoremap u u:w<CR>
nnoremap a :w<CR>a
nnoremap I :w<CR>I
nnoremap A :w<CR>d
