" fork from srockstyle/vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

let mapleader=';'

"#####
set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
syntax on "コードの色分け
set tabstop=2 "インデントをスペース4つ分に設定
set expandtab
set shiftwidth=2
set smartindent "オートインデント

let g:unite_enable_start_insert=0
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
map <C-j> !python -m json.tool<CR>

"#### vundle
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/Vundle.vim " required
call vundle#begin() " required

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim' " required
"
" original repos on github

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
" vimproc needed by vimshell, goto downloaded folder and `make`
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-commentary'
Plugin 'kien/ctrlp.vim'

Plugin 'Shougo/vimfiler.vim'
Bundle "kannokanno/previm"
Bundle "thinca/vim-unite-chef"
Plugin 'rhysd/clever-f.vim'
Plugin 'thinca/vim-quickrun'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'vim-scripts/dbext.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'alpaca-tc/alpaca_tags'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-endwise'
Plugin 'fatih/vim-go'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'majutsushi/tagbar'
Plugin 'tsukkee/unite-tag'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-dispatch'
Plugin 'AndrewRadev/switch.vim'
Plugin 'tpope/vim-surround'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'Shougo/unite.vim'
Plugin 'thinca/vim-ref'
Plugin 'yuku-t/vim-ref-ri'
Plugin 'othree/html5.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'hokaccha/vim-html5validator'
" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'

" for js & jsx
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" rust lang
Plugin 'rust-lang/rust.vim'

" typescript
Plugin 'leafgarland/typescript-vim'

" YouCompleteMe
Plugin 'Valloric/YouCompleteMe'

" vim-indent-guides
Plugin 'nathanaelkane/vim-indent-guides'

" editorconfig
Plugin 'editorconfig/editorconfig-vim'

" jsbeautify
Plugin 'maksimr/vim-jsbeautify'

" vim-autoformat
Plugin 'Chiel92/vim-autoformat'

call vundle#end() " required
filetype plugin indent on " required

" F3 for toggle NERDTree
nmap <F3> :NERDTreeToggle <CR>
" F4 for focus on NERDTree window
nmap <F4> :NERDTreeFocus <CR>
" F8 for TagBar
nmap <F8> :TagbarToggle<CR>

" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

"#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る

"新しい行のインデントを現在行と同じにする
set autoindent
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"新しい行を作ったときに高度な自動インデントを行う
"set smartindent
"全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/
"" over.vim {{{
" over.vimの起動
nnoremap <silent> <Leader>m :OverCommandLine<CR>

" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>

" コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>

" }}}
" netrwは常にtree view
let g:netrw_liststyle = 3
" CVSと.で始まるファイルは表示しない
let g:netrw_list_hide = 'CVS,\(^\|\s\s\)\zs\.\S\+'
" 'v'でファイルを開くときは右側に開く。(デフォルトが左側なので入れ替え)
let g:netrw_altv = 1
" 'o'でファイルを開くときは下側に開く。(デフォルトが上側なので入れ替え)
let g:netrw_alto = 1
set wildmode=list:full

" editorconfig
let g:editorconfig_Beautifier = '~/vimrc/.editorconfig'

" jsbeautify
" map <c-b> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-j> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-j> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-j> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-j> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-j> :call CSSBeautify()<cr>

autocmd FileType javascript vnoremap <buffer>  <c-j> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-j> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-j> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-j> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-j> :call RangeCSSBeautify()<cr>

noremap <c-t> :Autoformat<CR>

" vim-javascript"
let g:javascript_enable_domhtmlcss = 0
" vim-jsx
let g:jsx_ext_required = 0

" rest lang
let g:rustfmt_autosave = 1

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/vimrc/.ycm_extra_conf.py'
let g:ycm_python_binary_path = 'python'
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

"------------------------------------
"" neosnippet
"------------------------------------
let g:neosnippet#snippets_directory='~/.vim/vim-snippets'
imap <silent><C-F>                <Plug>(neosnippet_expand_or_jump)
inoremap <silent><C-U>            <ESC>:<C-U>Unite snippet<CR>
nnoremap <silent><Space>e         :<C-U>NeoSnippetEdit -split<CR>
smap <silent><C-F>                <Plug>(neosnippet_expand_or_jump

function! s:separate_defenition_to_each_filetypes(ft_dictionary) "{{{
  let result = {}

  for [filetypes, value] in items(a:ft_dictionary)
    for ft in split(filetypes, ",")
      if !has_key(result, ft)
        let result[ft] = []
      endif

      call extend(result[ft], copy(value))
    endfor
  endfor

  return result
endfunction"}}}
nnoremap ! :Switch<CR>

" typescript-vim
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = '-t ES2015'
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Endwise
let g:endwise_no_mappings=1

" vimの補完箇所
hi Pmenu ctermbg=0
hi PmenuSel ctermbg=4
hi PmenuSbar ctermbg=2
hi PmenuThumb ctermfg=3

let dbext_default_profile=""
let dbext_default_type="MYSQL"
let dbext_default_user="root"
let dbext_default_passwd=""
let dbext_default_dbname=""
let dbext_default_host="localhost"
let dbext_default_buffer_lines=60

" シンタックスチェック
" let g:syntastic_javascript_checker = "jshint"

"アルパカタグ
let g:alpaca_update_tags_config = {
      \ '_' : '-R --sort=yes --languages=-js,html,css',
      \ }
let g:alpaca_tags_ctags_bin = '/usr/local/Cellar/ctags/5.8/bin/ctags'
let g:alpaca_tags_cache_directory = "~/.vim/alpaca_tags"
let g:unite_data_directory = "~/vim/unite_data"
nnoremap <expr>tt  ':Unite tags -horizontal -buffer-name=tags -input='.expand("<cword>").'<CR>'

highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PMenuSbar ctermbg=4
" シンタックスエラーチェック
autocmd FileType php set makeprg=php\ -l\ %
autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif

" 行頭行末への移動
:map! <C-e> <Esc>$a
:map! <C-a> <Esc>^a

:map <C-e> <Esc>$a
:map <C-a> <Esc>^a

"メモアプリ
map <Leader>mn  :MemoNew<CR>
map <Leader>ml  :MemoList<CR>
map <Leader>mg  :MemoGrep<CR>
let g:memolist_memo_suffix = "txt"
let g:memolist_memo_date = "%Y-%m-%d %H:%M"
let g:memolist_memo_date = "epoch"
let g:memolist_memo_date = "%D %T"
let g:memolist_unite        = 1
let g:memolist_unite_source = "file_rec"
let g:memolist_unite_option = "-start-insert"
let g:memolist_path = "Dropbox/srockstyle/notes"

" resize window
nmap    <leader>w=  :resize +3<CR>
nmap    <leader>w-  :resize -3<CR>
nmap    <leader>w,  :vertical resize -3<CR>
nmap    <leader>w.  :vertical resize +3<CR>

" Go言語の設定
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)

" Vim-goの設定
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" :Fmt などで gofmt の代わりに goimports を使う
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1

" gotags-tagbarの設定
" SEE: https://github.com/jstemmer/gotags#vim-tagbar-configuration
let g:tagbar_type_go = {
      \ 'ctagstype' : 'go',
      \ 'kinds'     : [
      \ 'p:package',
      \ 'i:imports:1',
      \ 'c:constants',
      \ 'v:variables',
      \ 't:types',
      \ 'n:interfaces',
      \ 'w:fields',
      \ 'e:embedded',
      \ 'm:methods',
      \ 'r:constructor',
      \ 'f:functions'
      \ ],
      \ 'sro' : '.',
      \ 'kind2scope' : {
      \ 't' : 'ctype',
      \ 'n' : 'ntype'
      \ },
      \ 'scope2kind' : {
      \ 'ctype' : 't',
      \ 'ntype' : 'n'
      \ },
      \ 'ctagsbin'  : 'gotags',
      \ 'ctagsargs' : '-sort -silent'
      \ }

" HTML5の設定
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0

" nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

noremap j gj
noremap k gk
set helplang=ja,en

let g:previm_open_cmd = ''
augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup    " do not keep a backup file, use versions instead
else
  set backup    " keep a backup file
endif
set history=50    " keep 50 lines of command line history
set ruler   " show the cursor position all the time
set showcmd   " display incomplete commands
set incsearch   " do incremental searching

" set nobackup
" set nowritebackup
set backupdir=/tmp/,~/.backup

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=v
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!
    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78
    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif
  augroup END
else
  set autoindent    " always set autoindenting on
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif
