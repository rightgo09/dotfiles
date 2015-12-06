set columns=264 " 横幅
set lines=75 " 行数
set showtabline=2 " tablineの表示に関わる。0:表示しない 1:２つ以上のタブがあるとき表示 2:常に表示
set antialias " アンチエイリアス
set visualbell t_vb= " ビープ音を鳴らさない

colorscheme molokai

"------------------------------------
" vim-indent-guides
"------------------------------------
"nnoremap <silent> <Space>id :<C-u>IndentGuidesToggle<Enter>
"let g:indent_guides_auto_colors = 0
"let g:indent_guides_start_level = 4
"let g:indent_guides_guide_size = 1
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
"if 'dark' == &background
"    hi IndentGuidesOdd  ctermbg=black
"    hi IndentGuidesEven ctermbg=darkgrey
"else
"    hi IndentGuidesOdd  ctermbg=white
"    hi IndentGuidesEven ctermbg=lightgrey
"endif
"
"let g:indent_guides_enable_on_vim_startup=1
"let g:indent_guides_start_level=2
"let g:indent_guides_auto_colors=0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=234
"let g:indent_guides_color_change_percent = 30
"let g:indent_guides_guide_size = 1
