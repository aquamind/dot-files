"dein Scripts-----------------------------
if &compatible


  set nocompatible               " Be iMproved
endif

  " Required:
  set  runtimepath+=/Users/itouken/.cache/dein/repos/github.com/Shougo/dein.vim

  " Required:
  call dein#begin('/Users/itouken/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('tomasr/molokai')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/unite.vim')
  call dein#add('scrooloose/nerdtree')
    nnoremap <silent><C-\> :NERDTreeToggle<CR>

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })





  " Required:
  call dein#end()

  " Required:
  filetype plugin indent on
  syntax enable

  " If you want to install not installed plugins on startup.
  if dein#check_install()
    call dein#install()
  endif

  "End dein Scripts-------------------------

"バックアップファイルを作成しない
set nobackup
"行番号を表示
set number
"選択行を強調
set cursorline
"選択列を強調
"set cursorcolumn

"行末の1文字先までカーソルを移動できる
set virtualedit=onemore
"タブ、空白、改行の可視化
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%


"ビープ音を可視化
set visualbell

"deleteキーを有効化
set backspace=indent,eol,start


"閉じ括弧が入力されたとき対応する括弧を表示
set showmatch
set matchtime=1
"改行時に前の行のインデントを継続する
set autoindent
"新しい行を作ったときに高度な自動インデントを行う
set smartindent


"タブの代わりに空白文字を挿入
set expandtab
"ファイル内のタブが対応する空白の数
set tabstop=2
"自動インデントに使われる幅
set shiftwidth=2

"クリップボード連携
set clipboard+=unnamed


"検索ハイライトをESC2回で消す
nnoremap <Esc><Esc> :noh<CR
"検索をファイルの先頭へループしない
set nowrapscan
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"インクリメンタルサーチを行う
set incsearch


"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
