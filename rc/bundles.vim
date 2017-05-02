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
"   neosnippetとか
" =================
" " neosnippet、neosnippet-snippet、neocomplete、neocomplcache
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" Using pocke/dicts
let g:neocomplete#sources#dictionary#dictionaries = {
\   'ruby': $HOME . '/dicts/ruby.dict',
\ }
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns._ = '\h\w*'
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "<C-p>" : "\<S-TAB>"
hi WarningMsg guifg=bg

" =================
"  vim-javascript
" =================
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1


