" Vim本体のいろいろな設定
" =================
"  encoding
" =================
scriptencoding utf-8
set encoding=utf-8
filetype plugin indent on

" =================
"  全角スペース可視化
" =================
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '?@')
    augroup END
    call ZenkakuSpace()
endif

" =================
"  エディタの設定
" =================
highlight Normal ctermbg=none
set ruler
set number " 行数表示
set cursorline
set cursorcolumn
set tabstop=2 " タブの文字数
set noexpandtab
set cursorline
set backspace=indent,eol,start
set shiftwidth=2 " Vimで挿入するインデントの幅
set textwidth=70
set colorcolumn=80
autocmd vimenter * NERDTree
set nobackup
set noswapfile
set modifiable
set write
set undodir=$HOME/.vim/undodir
set tw=0
set wildmenu
set wildmode=full
autocmd BufWritePre * :%s/\s\+$//ge " 保存時行末spaceを自動削除

" マウスの動作設定
set mouse=h
set mousehide

" 自動保存で悲劇を自動生成しない
set autowrite
set updatetime=500

autocmd CursorHold *  wall
autocmd CursorHoldI *  wall

" =================
"  Font
" =================
set guifont=Ricty\ 14
set guifontwide=Ricty\ 14

" =================
"  エディタの見た目
" =================
set t_Co=256
syntax enable
" https://github.com/crusoexia/vim-monokai
colorscheme monokai
" set background=dark
set cmdheight=2
set title " タイトル部分に開いてるファイルのフルパスを表示する
set wildmenu " 自動補完でかっこ良くアレする
set laststatus=2
set clipboard=unnamed,autoselect
set noswapfile
set showmatch
set showcmd
