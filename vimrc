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

" ディレクトリ構造表示 http://alligatorswamp.hatenablog.com/entry/2012/09/09/163538
" :NERDTree
NeoBundle 'scrooloose/nerdtree'
" %対応の拡張
NeoBundle 'matchit.zip'
" インデントに色づけ
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1
" 縦列整形
NeoBundle 'Align'
let g:Align_xstrlen = 3     " for japanese string
let g:DrChipTopLvlMenu = '' " remove 'DrChip' menu
" 対象テキストオブジェクトを囲む
" s" でダブルクオートで囲める
" cst\<div>で<div></div>で囲める
NeoBundle 'tpope/vim-surround'

" Ruby
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'bbommarito/vim-slim'
NeoBundle 'tpope/vim-haml'
NeoBundle 'kchmck/vim-coffee-script'

" Send Gist
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'

filetype plugin indent on     " required!
filetype indent on

syntax on
colorscheme darkblue
set number
set cursorline
set expandtab
set tabstop=2
set shiftwidth=2
set smartindent
set cindent
set directory=/tmp
set hlsearch
nnoremap <ESC><ESC> :nohlsearch<CR>

autocmd BufNewFile,BufRead *.psgi set filetype=perl
autocmd BufNewFile,BufRead *.tt set filetype=html
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" 行末のスペース、タブをハイライト表示
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" ステータスライン表示
set laststatus=2
" ステータスラインをノーマル、編集モードで色づけ
au InsertEnter * hi StatusLine ctermfg=Blue ctermbg=DarkMagenta cterm=none
au InsertLeave * hi StatusLine ctermfg=DarkGray ctermbg=White cterm=none
