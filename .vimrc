
set rtp+=~/.vim/vundle.git/
call vundle#rc()
set nocompatible
filetype off

" ========== Neo Bundle 設定 ==========
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle'))
endif

" ここにインストールしたいプラグインのリストを書く
NeoBundle 'Shougo/unite.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'Align'

NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'

filetype plugin on
filetype indent on

Bundle 'JavaScript-syntax'
Bundle 'pangloss/vim-javascript'

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }
" Plugin key-mapping
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" 補完候補が表示されている場合は確定。そうでない場合は改行
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"
" " 補完をキャンセル
inoremap <expr><C-e>  neocomplcache#close_popup()

highlight Pmenu ctermbg=8 guibg=#606060
highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
highlight PmenuSbar ctermbg=0 guibg=#d6d6d6



NeoBundle 'git://github.com/jsx/jsx.vim.git'

if !exists("g:neocomplcache_force_omni_patterns")
    let g:neocomplcache_force_omni_patterns = {}
endif

" . を打った時にオムニ補完が呼び出されるようにする
let g:neocomplcache_force_omni_patterns.jsx = '\.'


" ========== 基本設定 ==========
" タイトルをバッファ名に変更しない
set notitle
set shortmess+=I

" ターミナル接続を高速にする
set ttyfast

" ターミナルで 256 色表示を使う
set t_Co=256

" フォールド設定
"set foldmethod=indent
set foldmethod=manual
"set foldopen=all
"set foldclose=all

" VIM 互換にしない
set nocompatible

" 複数ファイルの編集を可能にする
set hidden

" 内容が変更されたら自動的に再読み込み
set autoread

" Swap を作るまでの時間 m 秒
set updatetime=0

" Unicode で行末が変になる問題を解決
set ambiwidth=double

" バックスペースキーで行頭を削除する
set backspace=indent,eol,start

" カッコを閉じたとき対応するカッコに一時的に移動
set nostartofline

" 改行後に Backspace キーを押すと上行末尾の文字を 1 文字消す
set backspace=2

" C-v 矩形選択で行末より後ろもカーソルを置ける
set virtualedit=block

" コマンド、検索パターンを 50 まで保存
set history=50

" バックアップを作成しない
set nobackup


" ========== 検索設定 ==========
" インクリメンタルサーチを有効にする
set incsearch

" 大文字小文字を区別しない
set ignorecase

" 大文字で検索されたら対象を大文字限定にする
set smartcase

" 行末まで検索したら行頭に戻る


" ========== フォーマット設定 ==========
" 自動インデントの有効化
set smartindent
set autoindent

" フォーマットそろえをコメント以外有効にする
set formatoptions-=c

" 括弧の対応をハイライト
set showmatch

" 行頭の余白内で Tab を打ち込むと shiftwidth の数だけインデント
set smarttab

set tabstop=4
set shiftwidth=4
set softtabstop=0
"set noexpandtab
set expandtab


" ========== 表示設定 ==========
" TAB,EOF などを可視化する
"set list

" 検索結果をハイライトする
set hlsearch

" ルーラー、行番号を表示
set ruler
set number

" コマンドラインの高さ
set cmdheight=1

" カーソルラインの表示
set cursorline


"ステータスラインにコマンドを表示
set showcmd
"ステータスラインを常に表示
set laststatus=2
"ファイルナンバー表示
set statusline=[%n]
"ホスト名表示
set statusline+=%{matchstr(hostname(),'\\w\\+')}@
"ファイル名表示
set statusline+=%<%F
"変更のチェック表示
set statusline+=%m
"読み込み専用かどうか表示
set statusline+=%r
"ヘルプページなら[HELP]と表示
set statusline+=%h
"プレビューウインドウなら[Prevew]と表示
set statusline+=%w
"ファイルフォーマット表示
set statusline+=[%{&fileformat}]
"文字コード表示
set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}]
"ファイルタイプ表示
set statusline+=%y
"ここからツールバー右側
set statusline+=%=
"skk.vimの状態
set statusline+=%{exists('*SkkGetModeStr')?SkkGetModeStr():''}
"文字バイト数/カラム番号
set statusline+=[%{col('.')-1}=ASCII=%B,HEX=%c]
"現在文字列/全体列表示
set statusline+=[C=%c/%{col('$')-1}]
"現在文字行/全体行表示
set statusline+=[L=%l/%L]
"現在のファイルの文字数をカウント
set statusline+=[WC=%{exists('*WordCount')?WordCount():[]}]
"現在行が全体行の何%目か表示
set statusline+=[%p%%]
"レジスタの中身を表示
"set statusline+=[RG=\"%{getreg()}\"]

" ========== エンコード設定 ==========
"エンコード設定
if has('unix')
    set fileformat=unix
    set fileformats=unix,dos,mac
    set fileencoding=utf-8
    set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp
    set termencoding=
elseif has('win32')
    set fileformat=dos
    set fileformats=dos,unix,mac
    set fileencoding=utf-8
    set fileencodings=iso-2022-jp,utf-8,euc-jp,cp932
    set termencoding=
endif

"ファイルタイプに応じて挙動,色を変える
syntax on
filetype plugin on
filetype indent on


" ========== GUI ==========
"ワイルドメニューを使う
set wildmenu
set wildmode=longest,list,full

"OSのクリップボードを使用する
set clipboard+=unnamed

"ターミナルでマウスを使用できるようにする
set mouse=a
set guioptions+=a
set ttymouse=xterm2

if has('gui')
    "ツールバーを消す
    set guioptions=egLta
    "既に開いているGVIMがあるときはそのVIMを前面にもってくる
    runtime macros/editexisting.vim
    "gp gyで+レジスタに入出力
    nmap gd "+d
    nmap gy "+y
    nmap gp "+p
    nmap gP "+P
endif
