" プラグインの設定
" =================
"   quickrun.vim
" =================
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ = {
      \ 'runner'    : 'vimproc',
      \ 'runner/vimproc/updatetime' : 60,
      \ 'outputter' : 'error',
      \ 'outputter/error/success' : 'buffer',
      \ 'outputter/error/error'   : 'quickfix',
      \ 'outputter/buffer/split'  : ':rightbelow 8sp',
      \ 'outputter/buffer/close_on_empty' : 1,
      \ }
au FileType qf nnoremap <silent><buffer>q :quit<CR>
let g:quickrun_no_default_key_mappings = 1
    nnoremap <Space>r :write<CR>:QuickRun -mode n<CR>
    xnoremap <Space>r :<C-U>write<CR>gv:QuickRun -mode v<CR>
let g:quickrun_no_default_key_mappings = 1
    nnoremap <Space>r :cclose<CR>:write<CR>:QuickRun -mode n<CR>
    xnoremap <Space>r :<C-U>cclose<CR>:write<CR>gv:QuickRun -mode v<CR>
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
nnoremap <Space>q :<C-u>bw! \[quickrun\ output\]<CR>

" =================
"   NERDTree
" =================
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('py',     'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('md',     'blue',    'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml',    'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('config', 'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('conf',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('json',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('html',   'yellow',  'none', 'yellow',  '#151515')
call NERDTreeHighlightFile('styl',   'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('css',    'cyan',    'none', 'cyan',    '#151515')
call NERDTreeHighlightFile('rb',     'Red',     'none', 'red',     '#151515')
call NERDTreeHighlightFile('js',     'Red',     'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')

" =================
"   emmet.vim
" =================
let g:user_emmet_mode = 'a'
let g:user_emmet_leader_key = '<C-y>'
let g:user_emmet_complete_tag = 1
let g:user_emmet_settings = {
            \   'lang': 'ja',
            \   'indentation': '  ',
            \   'html': {
            \       'filters': 'html',
            \   },
            \   'css': {
            \       'filters': 'fc',
            \   },
            \   'php': {
            \       'extends': 'html',
            \       'filters': 'html',
            \   },
            \}

" =================
"  neocomplete/neosnippet
" =================
" --- NeoComplete
" 起動時にneocompleteを有効化
let g:neocomplete#enable_at_startup = 1
" 大文字が入力されるまで大/小文字の区別を無視
let g:neocomplete#enable_smart_case = 1
" '_'区切りの保管を有効にする
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#enable_camel_case_completion = 1
" ポップアップ表示される候補件数 : 20
let g:neocomplete#max_list = 20
" シンタックスをキャッシュする際の文字列の最小の長さ : 3
let g:neocomplete#sources#syntax#min_keyword_length = 3
" 保管を表示する際の文字列の最小の長さ
let g:neocomplete#auto_completion_start_length = 2
" preview windowを閉じない
let g:neocomplete#enable_auto_close_preview = 0
" 補完候補の一番先頭を選択状態にする(AutoComplPopと似た動作)
let g:neocomplete#enable_auto_select = 1
" AutoCmd InsertLeave * silent! pclose!
let g:neocomplete#max_keyword_width = 10000

let g:neocomplete#include_paths = {
    \ 'ruby' : '.,$HOME/.rbenv/versions/2.3.3/lib/ruby',
    \}

if !exists('g:neocomplete#delimiter_patterns')
    let g:neocomplete#delimiter_patterns= {}
endif
let g:neocomplete#delimiter_patterns.ruby = ['::']

if !exists('g:neocomplete#same_filetypes')
    let g:neocomplete#same_filetypes = {}
endif
let g:neocomplete#same_filetypes.ruby = 'eruby'

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let s:neco_dicts_dir = $HOME . '/vim-dotfiles/dicts'
if isdirectory(s:neco_dicts_dir)
    let g:neocomplete#sources#dictionary#dictionaries = {
    \   'ruby': s:neco_dicts_dir . '/ruby.dict',
    \   'javascript': s:neco_dicts_dir . '/jquery.dict',
    \ }
endif
let g:neocomplete#data_directory = $HOME . '/.vim/cache/neocomplete'

autocmd FileType css         setl omnifunc=csscomplete#CompleteCSS
autocmd FileType html        setl omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript  setl omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python      setl omnifunc=pythoncomplete#Complete
autocmd FileType ruby        setl omnifunc=rubycomplete#Complete

call neocomplete#custom#source('look', 'min_pattern_length', 1)

" インクルードバスの指定

" --- NeoSnippet
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"


" =================
"  vim-javascript
" =================
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1


