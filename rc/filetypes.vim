"言語別の設定
" =================
"    Ruby
" =================
autocmd FileType ruby setl nocindent autoindent smartindent
autocmd FileType ruby setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType eruby setl nocindent autoindent smartindent
autocmd FileType eruby setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd BufNewFile,BufRead *.jbuilder set filetype=ruby
autocmd BufNewFile,BufRead Guardfile  set filetype=ruby
autocmd BufNewFile,BufRead .pryrc     set filetype=ruby
augroup RSpec
    autocmd!
    autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END
autocmd FileType yaml setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType slim setl tabstop=2 expandtab shiftwidth=2 softtabstop=2
" RubyでBool値返すメソッドをちゃんと判断させる
autocmd FileType ruby setl iskeyword+=?

" =================
"    Coffee Script
" =================
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
autocmd FileType coffee    setlocal sw=2 sts=2 ts=2 et

" =================
"    C Lang
" =================
autocmd FileType c setlocal cindent expandtab tabstop=4 softtabstop=4 shiftwidth=4

" =================
"    Plane Text
" =================
set autoindent smartindent expandtab tabstop=4 softtabstop=4 shiftwidth=4

" =================
"    Markdown
" =================
au BufRead,BufNewFile *.md set filetype=markdown

" =================
"    HTML/XML
" =================
" 閉じタグ(</)が入力されたら自動で保管する
:let g:closetag_html_style=1
source ~/.vim/bundle/closetag.vim
