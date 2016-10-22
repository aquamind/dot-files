"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

"reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

let s:cache_home = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' .shellescape(s:dein_repo_dir))
endif

" Required:
execute  'set  runtimepath^=' . s:dein_repo_dir

  " Required:
  call dein#begin(s:dein_dir)

  " Let dein manage dein
  " Required:
  call dein#add('Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
" Plugin key-mappings.
 imap <C-k>     <Plug>(neosnippet_expand_or_jump)
 smap <C-k>     <Plug>(neosnippet_expand_or_jump)
 xmap <C-k>     <Plug>(neosnippet_expand_target)

 " SuperTab like snippets behavior.
 "imap <expr><TAB>
 " \ pumvisible() ? "\<C-n>" :
 " \ neosnippet#expandable_or_jumpable() ?
 " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
 smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

 " For conceal markers.
 if has('conceal')
   set conceallevel=2 concealcursor=niv
 endif
  
  call dein#add('tomasr/molokai')
  call dein#add('Shougo/neocomplete.vim')
let g:neocomplcache_enable_at_startup = 1
  call dein#add('Shougo/unite.vim')
  call dein#add('scrooloose/nerdtree')
    nnoremap <silent><C-\> :NERDTreeToggle<CR>
"    let g:NERDTreeDirArrows = 1
"    let g:NERDTreeDirArrowExpandable = '▸'
"    let g:NERDTreeDirArrowCollapsible = '▾'
  call dein#add('scrooloose/syntastic')
  call dein#add('othree/html5.vim')
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('jelera/vim-javascript-syntax')
  call dein#add('mattn/jscomplete-vim')
    autocmd FileType javascript
      \ :setl omnifunc=jscomplete#CompleteJS
  call dein#add('mattn/emmet-vim')
  call dein#add('open-browser.vim')
  call dein#add('mattn/webapi-vim')
  call dein#add('tell-k/vim-browsereload-mac')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('kana/vim-smartchr')
  call dein#add('itchyny/lightline.vim')
  call dein#add('tmhedberg/matchit')
  call dein#add('kana/vim-smartinput')
  call dein#add('tyru/caw.vim')
    nmap <C-k> <Plug>(caw:i:toggle)
    vmap <C-k> <Plug>(caw:i:toggle)

"カラースキーム
  call dein#add('w0ng/vim-hybrid')
  call dein#add('altercation/vim-colors-solarized')


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
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'



set laststatus=2
set t_Co=256

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
