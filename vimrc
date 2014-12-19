" fork from srockstyle/vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

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

Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'https://github.com/tpope/vim-rails'
Plugin 'https://github.com/tpope/vim-fugitive.git'
Plugin 'https://github.com/vim-ruby/vim-ruby.git'
" vimproc needed by vimshell, goto downloaded folder and `make`
Plugin 'https://github.com/Shougo/vimproc.vim'
Plugin 'https://github.com/Shougo/vimshell.vim'
Plugin 'https://github.com/jlanzarotta/bufexplorer'
Plugin 'https://github.com/bling/vim-airline.git'
Plugin 'https://github.com/tpope/vim-commentary.git'

Plugin 'Shougo/vimfiler.vim'
Bundle "https://github.com/kannokanno/previm"
Bundle "https://github.com/thinca/vim-unite-chef"
Plugin 'https://github.com/rhysd/clever-f.vim'
Plugin 'thinca/vim-quickrun'
Plugin 'https://github.com/vim-scripts/AutoComplPop'
Plugin 'https://github.com/vim-scripts/dbext.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'https://github.com/alpaca-tc/alpaca_tags'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-endwise'
Plugin 'fatih/vim-go'
" Plugin 'vim-scripts/java.vim'
" Plugin 'vim-scripts/javacomplete'
" Plugin 'vim-scripts/java_getset.vim'
" Plugin 'vim-scripts/java_checkstyle.vim'
Plugin 'tsukkee/unite-tag'
Plugin 'https://github.com/scrooloose/syntastic'
Plugin 'alpaca-tc/neorspec.vim'
Plugin 'basyura/unite-rails'
Plugin 'https://github.com/thoughtbot/vim-rspec'
Plugin 'https://github.com/tpope/vim-dispatch'
Plugin 'AndrewRadev/switch.vim'
Plugin 'edsono/vim-matchit'
Plugin 'http://github.com/tpope/vim-surround'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/unite.vim'
Bundle "https://github.com/Shougo/neocomplcache.vim"
Plugin 'https://github.com/thinca/vim-ref'
Plugin 'https://github.com/yuku-t/vim-ref-ri'
Plugin 'https://github.com/vim-scripts/ruby-matchit'
" Plugin 'petdance/vim-perl'
" Plugin 'hotchpotch/perldoc-vim'
Plugin 'https://github.com/othree/html5.vim.git'
Plugin 'https://github.com/hail2u/vim-css3-syntax'
Plugin 'https://github.com/hokaccha/vim-html5validator'
Plugin 'vim-jp/vimdoc-ja'

" Twitter Vim
" Bundle 'basyura/TweetVim'
" Bundle 'mattn/webapi-vim'
" Bundle 'basyura/twibill.vim'
" Bundle 'tyru/open-browser.vim'
" Bundle 'h1mesuke/unite-outline'
" Bundle 'basyura/bitly.vim'

" EverNote
" Bundle "https://github.com/kakkyz81/evervim"
" Bundle 'glidenote/memolist.vim'

"Bundle 'https://github.com/Shougo/neocomplcache-rsense.vim'
" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
call vundle#end() " required
filetype plugin indent on " required

" F3 for toggle NERDTree
map <F3> :NERDTreeToggle <CR>
" F4 for focus on NERDTree window
map <F4> :NERDTreeFocus <CR>

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

"Rails周りの設定
"augroup AlpacaTags
"  autocmd!
"	if exists(':Tags')
"		autocmd BufWritePost Gemfile TagsBundle
"		autocmd BufEnter * TagsSet
"		" 毎回保存と同時更新する場合はコメントを外す
"		autocmd BufWritePost * TagsUpdate
"	endif
"augroup END


"------------------------------------
"" neosnippet
"------------------------------------
let g:neosnippet#snippets_directory='~/.vim/vim-snippets'
imap <silent><C-F>                <Plug>(neosnippet_expand_or_jump)
inoremap <silent><C-U>            <ESC>:<C-U>Unite snippet<CR>
nnoremap <silent><Space>e         :<C-U>NeoSnippetEdit -split<CR>
smap <silent><C-F>                <Plug>(neosnippet_expand_or_jump


"------------------------------------
" vim-rails
"------------------------------------
""{{{
"有効化
let g:rails_default_file='config/database.yml'
let g:rails_level = 4
let g:rails_mappings=1
let g:rails_modelines=0
" let g:rails_some_option = 1
" let g:rails_statusline = 1
" let g:rails_subversion=0
" let g:rails_syntax = 1
" let g:rails_url='http://localhost:3000'
" let g:rails_ctags_arguments='--languages=-javascript'
" let g:rails_ctags_arguments = ''
function! SetUpRailsSetting()
  nnoremap <buffer><Space>r :R<CR>
  nnoremap <buffer><Space>a :A<CR>
  nnoremap <buffer><Space>m :Rmodel<Space>
  nnoremap <buffer><Space>c :Rcontroller<Space>
  nnoremap <buffer><Space>v :Rview<Space>
  nnoremap <buffer><Space>p :Rpreview<CR>
endfunction
 
aug MyAutoCmd
  au User Rails call SetUpRailsSetting()
aug END
 
aug RailsDictSetting
  au!
aug END
"}}}

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
let s:switch_definition = {
      \ '*': [
      \   ['is', 'are']
      \ ],
      \ 'ruby,eruby,haml' : [
      \   ['if', 'unless'],
      \   ['while', 'until'],
      \   ['.blank?', '.present?'],
      \   ['include', 'extend'],
      \   ['class', 'module'],
      \   ['.inject', '.delete_if'],
      \   ['.map', '.map!'],
      \   ['attr_accessor', 'attr_reader', 'attr_writer'],
      \ ],
      \ 'Gemfile,Berksfile' : [
      \   ['=', '<', '<=', '>', '>=', '~>'],
      \ ],
      \ 'ruby.application_template' : [
      \   ['yes?', 'no?'],
      \   ['lib', 'initializer', 'file', 'vendor', 'rakefile'],
      \   ['controller', 'model', 'view', 'migration', 'scaffold'],
      \ ],
      \ 'erb,html,php' : [
      \   { '<!--\([a-zA-Z0-9 /]\+\)--></\(div\|ul\|li\|a\)>' : '</\2><!--\1-->' },
      \ ],
      \ 'rails' : [
      \   [100, ':continue', ':information'],
      \   [101, ':switching_protocols'],
      \   [102, ':processing'],
      \   [200, ':ok', ':success'],
      \   [201, ':created'],
      \   [202, ':accepted'],
      \   [203, ':non_authoritative_information'],
      \   [204, ':no_content'],
      \   [205, ':reset_content'],
      \   [206, ':partial_content'],
      \   [207, ':multi_status'],
      \   [208, ':already_reported'],
      \   [226, ':im_used'],
      \   [300, ':multiple_choices'],
      \   [301, ':moved_permanently'],
      \   [302, ':found'],
      \   [303, ':see_other'],
      \   [304, ':not_modified'],
      \   [305, ':use_proxy'],
      \   [306, ':reserved'],
      \   [307, ':temporary_redirect'],
      \   [308, ':permanent_redirect'],
      \   [400, ':bad_request'],
      \   [401, ':unauthorized'],
      \   [402, ':payment_required'],
      \   [403, ':forbidden'],
      \   [404, ':not_found'],
      \   [405, ':method_not_allowed'],
      \   [406, ':not_acceptable'],
      \   [407, ':proxy_authentication_required'],
      \   [408, ':request_timeout'],
      \   [409, ':conflict'],
      \   [410, ':gone'],
      \   [411, ':length_required'],
      \   [412, ':precondition_failed'],
      \   [413, ':request_entity_too_large'],
      \   [414, ':request_uri_too_long'],
      \   [415, ':unsupported_media_type'],
      \   [416, ':requested_range_not_satisfiable'],
      \   [417, ':expectation_failed'],
      \   [422, ':unprocessable_entity'],
      \   [423, ':precondition_required'],
      \   [424, ':too_many_requests'],
      \   [426, ':request_header_fields_too_large'],
      \   [500, ':internal_server_error'],
      \   [501, ':not_implemented'],
      \   [502, ':bad_gateway'],
      \   [503, ':service_unavailable'],
      \   [504, ':gateway_timeout'],
      \   [505, ':http_version_not_supported'],
      \   [506, ':variant_also_negotiates'],
      \   [507, ':insufficient_storage'],
      \   [508, ':loop_detected'],
      \   [510, ':not_extended'],
      \   [511, ':network_authentication_required'],
      \ ],
      \ 'rspec': [
      \   ['describe', 'context', 'specific', 'example'],
      \   ['before', 'after'],
      \   ['be_true', 'be_false'],
      \   ['get', 'post', 'put', 'delete'],
      \   ['==', 'eql', 'equal'],
      \   { '\.should_not': '\.should' },
      \   ['\.to_not', '\.to'],
      \   { '\([^. ]\+\)\.should\(_not\|\)': 'expect(\1)\.to\2' },
      \   { 'expect(\([^. ]\+\))\.to\(_not\|\)': '\1.should\2' },
      \ ],
      \ 'markdown' : [
      \   ['[ ]', '[x]']
      \ ]
      \ }
 
let s:switch_definition = s:separate_defenition_to_each_filetypes(s:switch_definition)
function! s:define_switch_mappings() "{{{
  if exists('b:switch_custom_definitions')
    unlet b:switch_custom_definitions
  endif
 
  let dictionary = []
  for filetype in split(&ft, '\.')
    if has_key(s:switch_definition, filetype)
      let dictionary = extend(dictionary, s:switch_definition[filetype])
    endif
  endfor
 
  if exists('b:rails_root')
    let dictionary = extend(dictionary, s:switch_definition['rails'])
  endif
 
  if has_key(s:switch_definition, '*')
    let dictionary = extend(dictionary, s:switch_definition['*'])
  endif
 
endfunction"}}}
 
augroup SwitchSetting
  autocmd!
  autocmd Filetype * if !empty(split(&ft, '\.')) | call <SID>define_switch_mappings() | endif
augroup END

"------------------------------------
" Unite-rails.vim
"------------------------------------
"{{{
function! UniteRailsSetting()
  nnoremap <buffer><C-H><C-H><C-H>  :<C-U>Unite rails/view<CR>
  nnoremap <buffer><C-H><C-H>       :<C-U>Unite rails/model<CR>
  nnoremap <buffer><C-H>            :<C-U>Unite rails/controller<CR>
 
  nnoremap <buffer><C-H>c           :<C-U>Unite rails/config<CR>
  nnoremap <buffer><C-H>s           :<C-U>Unite rails/spec<CR>
  nnoremap <buffer><C-H>m           :<C-U>Unite rails/db -input=migrate<CR>
  nnoremap <buffer><C-H>l           :<C-U>Unite rails/lib<CR>
  nnoremap <buffer><expr><C-H>g     ':e '.b:rails_root.'/Gemfile<CR>'
  nnoremap <buffer><expr><C-H>r     ':e '.b:rails_root.'/config/routes.rb<CR>'
  nnoremap <buffer><expr><C-H>se    ':e '.b:rails_root.'/db/seeds.rb<CR>'
  nnoremap <buffer><C-H>ra          :<C-U>Unite rails/rake<CR>
  nnoremap <buffer><C-H>h           :<C-U>Unite rails/heroku<CR>
endfunction
aug MyAutoCmd
  au User Rails call UniteRailsSetting()
aug END
"}}}
"
" Endwise
let g:endwise_no_mappings=1

" netcomplace
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 20
let g:neocomplcache_manual_completion_start_length = 3
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
if !exists('g:neocomplcache_delimiter_patterns')
	let g:neocomplcache_delimiter_patterns = {}
endif

" vimの補完箇所
hi Pmenu ctermbg=0
hi PmenuSel ctermbg=4
hi PmenuSbar ctermbg=2
hi PmenuThumb ctermfg=3

if !exists('loaded_matchit')
	" matchitを有効化
	runtime macros/matchit.vim
endif

let dbext_default_profile=""
let dbext_default_type="MYSQL"
let dbext_default_user="root"
let dbext_default_passwd=""
let dbext_default_dbname=""
let dbext_default_host="localhost"
let dbext_default_buffer_lines=60

" シンタックスチェック
let g:syntastic_javascript_checker = "jshint"

"アルパカタグ
let g:alpaca_update_tags_config = {
      \ '_' : '-R --sort=yes --languages=-js,html,css',
      \ 'ruby': '--languages=+Ruby',
      \ }
let g:alpaca_tags_ctags_bin = '/usr/local/Cellar/ctags/5.8/bin/ctags'
let g:alpaca_tags_cache_directory = "~/.vim/alpaca_tags"
let g:unite_data_directory = "~/vim/unite_data"
augroup AlpacaTags
		autocmd!
		if exists(':Tags')
		autocmd BufWritePost * TagsUpdate ruby
		autocmd BufWritePost Gemfile TagsBundle
		autocmd BufEnter * TagsSet
		endif
augroup END
nnoremap <expr>tt  ':Unite tags -horizontal -buffer-name=tags -input='.expand("<cword>").'<CR>'

" RSPEC自動実行
let g:quickrun_config = {}
let g:quickrun_config['ruby.rspec'] = { 'command': 'rspec', 'cmdopt': 'bundle exec', 'exec': '%o %c %s' }
augroup RSpec
		autocmd!
		autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

let g:rspec_command = "Dispatch rspec {spec}"

" PHP用の設定
autocmd FileType php,ctp :set dictionary="~/.vim/dict/php.dict"
autocmd FileType css :set dictionary="~/.vim/dict/css.dict"
autocmd FileType c :set dictionary="~/.vim/dict/c.dict"
autocmd FileType js :set dictionary="~/.vim/dict/javascript.dict"
autocmd FileType rb :set dictionary="~/.vim/dict/ruby.dict"

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

" Perlのための設定
let g:neocomplcache_ctags_arguments_list = {
  \ 'perl' : '-R -h ".pm"'
  \ }
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default'    : '',
    \ 'perl'       : $HOME . '/.vim/dict/perl.dict'
    \ }
if !exists('g:neocomplcache_keyword_patterns')
				  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

nnoremap <silent> t :Unite tweetvim<CR>
nnoremap <silent> s :TweetVimSay<CR>
if !exists('g:neocomplcache_dictionary_filetype_lists')
				  let g:neocomplcache_dictionary_filetype_lists = {}
endif
let neco_dic = g:neocomplcache_dictionary_filetype_lists
let neco_dic.tweetvim_say = $HOME . '/.tweetvim/screen_name'

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

" Go言語の設定
" :Fmt などで gofmt の代わりに goimports を使う
let g:gofmt_command = 'goimports'

" Go に付属の plugin と gocode を有効にする
set rtp^=${GOROOT}/misc/vim
set rtp^=${GOPATH}/src/github.com/nsf/gocode/vim

" 保存時に :Fmt する
au BufWritePre *.go Fmt
au BufNewFile,BufRead *.go set sw=4 noexpandtab ts=4
au FileType go compiler go
" Vim-goの設定
let g:go_play_open_browser = 0
let g:go_fmt_fail_silently = 1
let g:go_fmt_autosave = 0
let g:go_fmt_command = "gofmt"
let g:go_gocode_bin="/Users/srockstyle/go/bin/gocode"
let g:go_goimports_bin="/Users/srockstyle/go/bin/goimports"
let g:go_godef_bin="/Users/srockstyle/go/bin/godef"


"HTML5の設定
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0

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
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
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

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
