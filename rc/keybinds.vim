" キーバインド
" =================
"   Alpegggio
" =================
" Arpeggio.vimの設定
call arpeggio#load()
Arpeggionmap jk <Esc>
Arpeggioimap jk <Esc>
Arpeggiocmap jk <Esc>
Arpeggiovmap jk <Esc>

" =================
"   Unit.vim
" =================
" Unit.vimの設定
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name = file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J>unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J>unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" =================
"   NERDTree
" =================
" NERDTreeの表示トグル
noremap nt :NERDTreeToggle<CR>

" =================
"   VimShell
" =================
" VimShellの表示トグル
noremap vs :VimShellTab<CR>

" =================
"   RSpec.vim
" =================
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" =================
"   system
" =================
" タブ移動
map <C-l> gt
map <C-h> gT
" 新規タブを開く
map <C-t> :tabnew<CR>
" 現在の状態を保存
inoremap <C-s> :w<CR>
" Ecs連打で検索結果のハイライトを消す
nnoremap <ESC><ESC> :nohlsearch<CR>
" 新規バッファを開く
map vn :vnew<CR>
