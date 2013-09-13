set nocompatible               " be iMproved
filetype off


if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'petdance/vim-perl'
NeoBundle 'hotchpotch/perldoc-vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'

""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

"===============================================
" カラー設定
"===============================================
" シンタックスハイライトを有効にする
"NeoBundle 'altercation/vim-colors-solarized'
"syntax enable
 "背景色を dark にする
" set background=dark
 " 輝度とコントラストは、最初はデフォルトを試すのがオススメです
 " 自分はコントラストだけ高くしています
 " 輝度を高くする
let g:solarized_visibility = "high"
 " コントラストを高くする
let g:solarized_contrast = "high"
 " カラースキーマを Solarized にする
" colorscheme solarized
"===============================================

filetype plugin indent on     " required!
filetype indent on
syntax on
nmap <Leader>r <plug>(quickrun)


"set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,shift-jis,euc-jp

set number
set laststatus=2
set statusline=%f\ [%{&fenc==''?&enc:&fenc}][%{&ff}]%=%8l:%c%8P
""自動でappach再起動
autocmd BufWritePre * :! sudo /etc/init.d/httpd restart
autocmd BufWritePre * :! sudo -E /home/training/script/tool/compile_smart



" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Select with <TAB>
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" for snippets
let g:neocomplcache_snippets_dir = "~/.vim/snippets"
imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-n>"
smap <C-k> <Plug>(neocomplcache_snippets_expand)

"-----------------------------------------------------------------------------
command! Gcc call s:Gcc()
nmap <F6> :Gcc<CR>

function! s:Gcc()
	:w
	:!gcc % -o %.out
	:!%.out
endfunction
"-----------------------------------------------------------------------------

" ESCキーを2回押すと終了する
 au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
 au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

 "カーソル行をハイライト
 set cursorline
 set cursorcolumn
 " カレントウィンドウにのみ罫線を引く
 augroup cch
	 autocmd! cch
	 autocmd WinLeave * set nocursorline
	 autocmd WinEnter,BufRead * set cursorline
 augroup END

 augroup cch
	 autocmd! cch
	 autocmd WinLeave * set nocursorcolumn
	 autocmd WinEnter,BufRead * set cursorcolumn
 augroup END

 hi clear CursorLine
 hi CursorLine gui=underline
 highlight CursorLine ctermbg=black guibg=black

 hi clear Cursorcolumn
 hi Cursorcolumn gui=underline
 highlight CursorColumn ctermbg=black guibg=black

 ".tと.psgiのシンタックスハイライト
 autocmd BufNewFile,BufRead *.psgi   set filetype=perl
 autocmd BufNewFile,BufRead *.t      set filetype=perl

"" 挿入モード中に'Ctr-*'でコマンドモードでの移動・削除を可能にする
 inoremap <c-d> <delete>
 inoremap <c-j> <down>
 inoremap <c-k> <up>
 inoremap <c-h> <left>
 inoremap <c-l> <right>


"テンプレートの設定================================
autocmd BufNewFile *.pl 0r $HOME/.vim/template/perl-script.txt
autocmd BufNewFile *.t  0r $HOME/.vim/template/perl-test.txt

"===================================================
"

"保存して実行
"":w + !perl command
map <F4>  :w !perl<CR>
"!perl command
map <F5>  :!perl %<CR>



set title "編集中のファイル名を表示する
set showcmd "入力中のコマンドを表示する
set ruler "座標を表示する
set showmatch   "閉じ括弧の入力時に対応する括弧を表示する
set matchtime=3 "showmatchの表示時間
set laststatus=2 "ステータスラインを常に表示する

set shiftwidth=4    "行頭での<Tab>の幅
set tabstop=4   "行頭以外での<Tab>の幅
set autoindent
set expandtab



"全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/
