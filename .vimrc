" ------- dein.vim設定 ここから -------- "
" 以下はdein.vimを入れるための記述
if &compatible
    set nocompatible
endif

" dein.vimディレクトリをruntimepathに追加する
set runtimepath+=~/bundles/repos/github.com/Shougo/dein.vim

" dein.vimで管理
if dein#load_state('~/bundles')
    call dein#begin('~/bundles')
    call dein#add('~/bundles/repos/github.com/Shougo/dein.vim')

    " --- プラグイン追加 ここから ---- "
    " 好きなプラグインを dein#add() 追加していく
    "call dein#add('好きなプラグイン')

    " カラースキーム
    call dein#add('tomasr/molokai')
    call dein#add('w0ng/vim-hybrid')

    " vimステータスバーのデザイン
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')

    " markdown形式用プラグイン
    call dein#add('plasticboy/vim-markdown')
    call dein#add('kannokanno/previm')
    call dein#add('tyru/open-browser.vim')

    " NERDTree
    call dein#add('preservim/nerdtree')

    " ale
    call dein#add('dense-analysis/ale')

    " flake8
    call dein#add('scrooloose/syntastic')

    " --- プラグイン追加 ここまで ---- "
    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
" ------- dein.vim設定 ここまで -------- "

" ------- vim-airline用プラグイン設定 ------- "
" タブON
let g:airline#extensions#tabline#enabled = 1
" タブ移動
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab
" ステータスのフォントとテーマ
let g:airline_powerline_fonts = 1
let g:airline_theme='luna'

" ------- markdown用プラグイン設定 ここから ------- "
" --- plasticboy/vim-markdown --- "
" 折りたたみの禁止
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0

" --- kannokanno/previm --- "
autocmd BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'C:\\PROGRA~1\\MOZILL~1\\firefox.exe'
"let g:previm_open_cmd = 'C:\\PROGRA~2\\Google\\Chrome\\Application\\chrome.exe'
" ctrl pでプレビュー
"nnoremap <silent> <C-p> :PrevimOpen<CR>

" --- tyru/open-browser.vim --- "
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
" ------- markdown用プラグイン設定 ここまで ------- "

" ------- 以下詳細設定 ------- "
" --- Encode ---"
" 下記の指定は環境によって文字化けする可能性があるので適宜変更する
set encoding=UTF-8      " 文字コードをUTF-8にする
set fileencoding=UTF-8  " 文字コードをUTF-8にする
set termencoding=UTF-8  " 文字コードをUTF-8にする

" --- File --- "
set hidden      " ファイル変更中でも他のファイルを開けるようにする
set autoread    " ファイル内容が変更されると自動読み込みする

" --- Backup --- "
" バックアップを使用するときは下記3行を適宜編集
"set backupdir=$HOME/.vim/backup    " バックアップディレクトリを指定する
"set browsedir=buffer   " ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
"set directory=$HOME/.vim/backup,c:\temp    " スワップファイルディレクトリを指定する
" バックアップを使用しない設定
set history=1000    " 履歴保存数
set noswapfile      " .swpファイル作成無効
set nobackup        " ~ファイル作成無効
set noundofile      " .un~ファイル作成無効

" --- Search --- "
set incsearch   " インクリメンタルサーチをする
set hlsearch    " 検索結果をハイライトする
set ignorecase  " 検索時に文字の大小を区別しない
set smartcase   " 検索時に大文字を含んでいたら大小を区別する
set wrapscan    " 検索をファイルの先頭へループする

" --- Input --- "
set cindent         " C言語のインデントに従って自動インデントをする
set shiftwidth=4    " 行頭での<Tab>の幅
set paste           " コピーアンドペーストでインデントずれを防ぐ
set expandtab       " <Tab>の代わりに<Space>を挿入する
set tabstop=4       " 行頭以外での<Tab>の幅
set softtabstop=4   " expandtabで<Tab>が対応する<Space>の数
set backspace=indent,eol,start  " BackSpace機能を使えるようにする
set whichwrap=b,s,h,l,<,>,[,]   " カーソルを行頭、行末で止まらないようにする
set clipboard=unnamed           " クリップボードを利用する

" --- 挿入モードでのカーソル移動 --- "
" 'Ctr-*'でコマンドモードと同じ移動をする
"inoremap <C-h> <Left>
"inoremap <C-l> <Right>
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>

" --- 空白文字を表示 --- "
set list    " タブ、行末等の不可視文字を表示する
set listchars=tab:>-,trail:_    " タブと行末に続くスペースを表示する
scriptencoding utf-8            " おまじない これがないと下記が反映されない
augroup highlightZenkakuSpace   " 全角スペースを赤色にする
  autocmd!
  "autocmd VimEnter,ColorScheme * highlight ZenkakuSpace term=underline ctermbg=Red guibg=Red
  autocmd VimEnter,ColorScheme * highlight ZenkakuSpace term=underline ctermbg=Red  " こっちのほうが落ち着いた表示
  autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
augroup END

" --- dein.vimプラグイン対応 --- "
" dein.vimの影響でなぜかgvimが文字化けしたため対応
source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim

" Ctrl-nでNERDTreeを開く
map <C-n> :NERDTreeToggle<CR>
" 隠しファイルを表示する
let NERDTreeShowHidden = 1

" --- 英語キーボード対応 --- "
"ノーマルモード時に ; と : を入れ替える
"nnoremap ; :
"nnoremap : ;

" --- Display --- "
" vim.exeで反映される
"colorscheme desert
"colorscheme hybrid
"set background=dark
colorscheme molokai
syntax on           " シンタックスカラーリングを設定する
set number          " 行番号を表示する
set title           " 編集中のファイル名を表示する
set showcmd         " 入力中のコマンドを表示する
set ruler           " 座標を表示する
set showmatch       " 閉じ括弧の入力時に対応する括弧を表示する
set matchtime=3     " showmatchの表示時間
set laststatus=2    " ステータスラインを常に表示する
set guifont=Ricty_Diminished:h12:cSHIFTJIS  " フォントをRicty_Diminishedに
set rop=type:directx      " Ricty_Diminishedできれいに表示する
set langmenu=ja_jp.utf-8  " UTF-8設定

" tagjump "
nnoremap <C-w>] :vsp<CR> <C-w>l :exe("tjump ".expand('<cword>'))<CR>

" map
nmap * *N

" vimgrep
au QuickfixCmdPost make,grep,grepadd,vimgrep copen

" tags
set tags=./tags;,tags;


" flake8
let g:ale_linters = {'python': ['flake8']}
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:syntastic_python_checkers = ['flake8']

" black
let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'python': ['black'],
  \ }
