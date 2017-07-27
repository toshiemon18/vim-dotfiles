" dein.vim
if &compatible
    set nocompatible
endif
" プラグインがインストールされるディレクトリを設定する
let s:dein_dir = expand('~/.vim/dein')
" dein.vimの本体があるディレクトリ
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim/'

" dein.vimが無い場合にはgithubから落としてくる
if &runtimepath !~# 'dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" dein.vimの設定
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    " プラグインリストであるTOMLファル
    " 予めdein_plugs.tomlを用意すること
    let g:rc_dir    = expand('~/vim-dotfiles/dein_files/')
    let s:toml      = g:rc_dir . 'dein_plugs.toml'
    let s:lazy_toml = g:rc_dir . 'dein_plugs_lazy.toml'

    " TOMLファイルを読み込んでキャッシュしておく
    call dein#load_toml(s:toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    " 設定終了
    call dein#end()
    call dein#save_state()
endif

" 未インストールのプラグインがあればすぐさまインストール
if dein#check_install()
    call dein#install()
endif
