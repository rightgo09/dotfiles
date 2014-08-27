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
" Scala
NeoBundle 'derekwyatt/vim-scala'

" Required:
filetype plugin indent on


syntax on
colorscheme default
hi Comment ctermfg=9
hi Comment ctermbg=4
hi LineNr ctermfg=1
hi LineNr ctermbg=235

set number
set cursorline
set expandtab
set tabstop=2
set shiftwidth=2
set smartindent
set cindent
set directory=/tmp
set backupdir=/tmp
set mouse-=a
set hlsearch
nnoremap <ESC><ESC> :nohlsearch<CR>

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
