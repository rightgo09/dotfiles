if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Interactive command execution in Vim.
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" My Bundles here:
" 保存するとsyntax checkしてくれる
NeoBundle 'scrooloose/syntastic'
" ディレクトリ構造表示
NeoBundle 'scrooloose/nerdtree'
" %対応の拡張
NeoBundle 'matchit.zip'
" Send Gist
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'
" HTML5の新しいタグに色をつける
NeoBundle 'othree/html5.vim'
" Perl
NeoBundle 'petdance/vim-perl'
NeoBundle 'hotchpotch/perldoc-vim'
" Ruby
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'slim-template/vim-slim'
" Scala
NeoBundle 'derekwyatt/vim-scala'

" Git
NeoBundle 'tpope/vim-fugitive'

" Quick Run
NeoBundle 'thinca/vim-quickrun'

" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'

" コメントON/OFFを手軽に実行
" Ctrl + - を2回
NeoBundle 'tomtom/tcomment_vim'


" before setting colorschema
autocmd ColorScheme * highlight rubyDefine ctermfg=22
autocmd ColorScheme * highlight rubyClass ctermfg=22
autocmd ColorScheme * highlight rubyModule ctermfg=22

" Required:
filetype plugin indent on

syntax on
colorscheme default
hi Comment ctermfg=blue
hi Comment ctermbg=white
hi CursorLineNr term=bold ctermfg=black ctermbg=yellow

set number
set cursorline
set expandtab
set tabstop=2
set shiftwidth=2
set smartindent
set cindent
set directory=/tmp
set backupdir=/tmp
set undodir=/tmp
set mouse-=a
set hlsearch
"左右のカーソル移動で行間移動可能にする。
set whichwrap=b,s,h,l,<,>,[,]
nnoremap <ESC><ESC> :nohlsearch<CR>

" 最後に開いていた場所をカレント行にする
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

"#####検索設定#####
set ignorecase " 大文字/小文字の区別なく検索する
set smartcase " 検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan " 検索時に最後まで行ったら最初に戻る
set incsearch " インクリメンタルサーチを行う

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

" 全角記号を全角で表示する
set ambiwidth=double

" F12で次のバッファに切り替え
map <silent> <F12> :bn!<CR>
" F11で前のバッファに切り替え
map <silent> <F11> :bp!<CR>

" 空行挿入
nnoremap O :<C-u>call append(expand('.'), '')<Cr>j

" タブを便利に
nnoremap tt :<C-u>tabnew<Space>
nnoremap <C-n> gt
nnoremap <C-p> gT

" タブ番号をつける
" http://qiita.com/wadako111/items/755e753677dd72d8036d
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
" Tab jump
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor


let g:quickrun_config = {}
let g:quickrun_config._ = {'*': {'split': ''}, 'runner' : 'vimproc'}
let g:quickrun_config['rspec/bundle'] = {
  \ 'type': 'rspec/bundle',
  \ 'command': 'rspec',
  \ 'exec': 'bundle exec %c %s'
  \}
let g:quickrun_config['rspec/normal'] = {
  \ 'type': 'rspec/normal',
  \ 'command': 'rspec',
  \ 'exec': '%c %s'
  \}
function! RSpecQuickrun()
  let b:quickrun_config = {'type' : 'rspec/bundle'}
endfunction
autocmd BufReadPost *_spec.rb call RSpecQuickrun()


" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-c> :Unite buffer<CR>
" ファイル一覧
noremap <C-s> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-x> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""

" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow
