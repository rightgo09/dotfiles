syntax on
colorscheme darkblue
set number
set cursorline
set hlsearch
set expandtab
set tabstop=2
set shiftwidth=2
set smartindent
set cindent
set directory=/tmp
autocmd BufNewFile,BufRead *.psgi set filetype=perl
autocmd BufNewFile,BufRead *.tt set filetype=html
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
