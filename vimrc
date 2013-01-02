" http://qiita.com/items/1c32d3f24cc2919203eb
" http://qiita.com/items/ac3843ceccd0b685501f

set nocompatible               " be iMproved
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

filetype plugin indent on     " required!
filetype indent on

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
set paste

autocmd BufNewFile,BufRead *.psgi set filetype=perl
autocmd BufNewFile,BufRead *.tt set filetype=html
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
" 行末のスペース、タブをハイライト表示
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END
