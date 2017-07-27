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
let NERDTreeIgnore=['\.o$', '\.pyc$', '\.php\~$']
let NERDTreeShowLineNumbers = 1
let NERDTreeAutoCenter = 1
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
"  NeoComplete
"  NeoSnippet
"  UltiSnips
" =================
" --- NeoComplete
" 起動時にneocompleteを有効化
let g:neocomplete#disable_auto_complete = 0
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

let s:neco_dicts_dir = $HOME . '/vim-dotfiles/dicts'
if isdirectory(s:neco_dicts_dir)
    let g:neocomplete#sources#dictionary#dictionaries = {
                \ 'default':    '',
                \ 'ruby':       s:neco_dicts_dir . '/ruby.dict',
                \ 'javascript': s:neco_dicts_dir . '/jquery.dict'
                \ }
endif
let g:neocomplete#data_directory = $HOME . '/.vim/cache/neocomplete'

"インクルードパスの指定
let g:neocomplete#include_paths = {
  \ 'ruby' : '.,$HOME/.rbenv/versions/**/lib/ruby/2.3.0/',
  \ }
"インクルード文のパターンを指定
let g:neocomplete#include_patterns = {
  \ 'ruby' : '^\s*require',
  \ }
"インクルード先のファイル名の解析パターン
let g:neocomplete#include_exprs = {
  \ 'ruby' : substitute(v:fname,'::','/','g')
  \ }
" ファイルを探す際に、この値を末尾に追加したファイルも探す。
let g:neocomplete#include_suffixes = {
  \ 'ruby' : '.rb',
  \ }

if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

if !exists('g:neocomplete#delimiter_patterns')
    let g:neocomplete#delimiter_patterns= {}
endif
let g:neocomplete#delimiter_patterns.ruby = ['::']

if !exists('g:neocomplete#same_filetypes')
    let g:neocomplete#same_filetypes = {}
endif
let g:neocomplete#same_filetypes.ruby = 'eruby'

" Rubyの補完は"."等で始めてほしい"
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

autocmd FileType css         setl omnifunc=csscomplete#CompleteCSS
autocmd FileType html        setl omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript  setl omnifunc=javascriptcomplete#CompleteJS
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
inoremap <expr><C-h>     neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>      neocomplete#smart_close_popup()."\<C-h>"

" --- NeoSnippet
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-x> <Plug>(neosnippet_expand_or_jump)
smap <C-x> <Plug>(neosnippet_expand_or_jump)
xmap <C-x> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-x> <Plug>(neosnippet_expand_or_jump)
imap <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/snippets/neosnippet-snippets/neosnippets/'

" =================
"  jedi-vim
" =================

" =================
"  vim-javascript
" =================
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

" =================
"  Elixir
" =================
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records',
        \ 't:tests'
    \ ]
    \ }

" =================
"   fzf
" =================
" Fzf Configuration
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
