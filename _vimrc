let g:iswindows = 0
let g:islinux = 0
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:islinux = 1
endif

if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

"TODO: jshint
"TODO:��ָ���ַ�����

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

"���ù���Ŀ¼Ϊ��ǰ�༭�ļ���Ŀ¼
set bsdir=buffer
set autochdir

"��������
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

"��������
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8

if g:iswindows
set guifont=Monaco:h9
endif

"������ʱ�ļ�����λ��
if g:iswindows
set directory=$HOME
else 
set directory=~/tmp,/tmp
endif

"set guifont=NSimSun:h10

"set gfw=YaHei\ Consolas\ Hybrid:h9
"set guifont=Consolas:h12
"set guifont=YaHei\ Consolas\ Hybrid:h12
"set guifont=Yahei\ Mono:h12

set helplang=cn
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"��ֹ������ʱ�ļ�
set nobackup

"�������Դ�Сд
set ignorecase

"�������ַ�����
set incsearch

"�����滻
set gdefault

"ʼ����ʾ�к�
set number

"��ʾ��������
set ruler

"��������
set cursorline


"�Զ�����
set noautoindent
set cindent
set smartindent

"Tab���Ŀ��
set shiftwidth=4
set tabstop=4

"ʹ��4���ո����Tab
set expandtab
set softtabstop=4
"Tab�������ĸ��ո�,��PHP
autocmd FileType php set shiftwidth=4 tabstop=4 expandtab softtabstop=4



"���뷨����
if has('multi_byte_ime')
	"δ����IMEʱ��걳��ɫ
	hi Cursor guifg=bg guibg=Orange gui=NONE
	"����IMEʱ��걳��ɫ
	hi CursorIM guifg=NONE guibg=Skyblue gui=NONE
	" �ر�Vim���Զ��л�IME���뷨(����ģʽ�ͼ���ģʽ)
	set iminsert=0 imsearch=0
	" ����ģʽ���뷨״̬δ����¼ʱ��Ĭ�Ϲر�IME
	"inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif



"��Windows���������
set clipboard+=unnamed


"�༭vimrc֮�����¼���
if g:iswindows
autocmd! bufwritepost _vimrc source $VIM/_vimrc
else
endif


"��ɫ����
syntax enable
set background=dark
if g:iswindows
colorscheme solarized
else
    if g:isGUI
        colorscheme solarized
    else
        colorscheme torte
    endif
endif


"##########������� ��ʼ#############
filetype off
set rtp+=$VIM/vimfiles/bundle/vundle/
call vundle#rc('$VIM/vimfiles/bundle/')

"���������Ŀ�
Bundle 'gmarik/vundle'

"���벹ȫ
Bundle 'Shougo/neocomplcache'
"Bundle 'Shougo/neosnippet'
"������Զ�����
"Bundle 'snipMate'

"���ٲ���
Bundle 'kien/ctrlp.vim'

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
"Bundle "snipmate-snippets"
"Bundle "garbas/vim-snipmate"

"��� �﷨/����
Bundle 'JavaScript-syntax'
Bundle 'jQuery'
Bundle 'othree/html5.vim'
Bundle 'groenewege/vim-less'
"Bundle 'Markdown'
"Bundle 'Markdown-syntax'
"Bundle 'plasticboy/vim-markdown'
Bundle 'StanAngeloff/php.vim'
Bundle 'php.vim-html-enhanced'
"HTML������������
Bundle "pangloss/vim-javascript"

"�������ַ����䣬 ��Ҫ�޸�Դ����֧�������ַ� https://github.com/muzuiget/hacking-patches/blob/master/tabular_cjk_width.patch
Bundle 'Tabular'

"statuslines ��ǿ
Bundle 'scrooloose/vim-statline'

"�ļ�������
Bundle 'scrooloose/nerdtree'
"Nerdtree ��ǿ
Bundle 'jistr/vim-nerdtree-tabs'
"autocmd vimenter * NERDTree

"��()��""������HTML��ǩ֮�������ת��
Bundle 'matchit.zip'
"��ʾ��ĩ�Ŀո�
Bundle 'ShowTrailingWhitespace'
"JS�����ʽ�������
Bundle '_jsbeautify'

"Code check for most languages
Bundle 'scrooloose/syntastic'
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_post_args='--standard=psr2'
let g:syntastic_javascript_checkers = ['eslint']

"PHP CodeSniffer
"Bundle 'joonty/vim-phpqa'
Bundle 'jcf/vim-latex'

Bundle 'thinca/vim-quickrun'
Bundle 'mattn/webapi-vim'
Bundle 'tyru/open-browser.vim'
Bundle 'superbrothers/vim-quickrun-markdown-gfm'

"python 
Bundle 'klen/python-mode'
"�����۵���ʼ�Ĳ���
set foldlevelstart=10

"Bundle 'hallettj/jslint.vim'

"��ʱԤ��CSS��ɫ
"Bundle 'skammer/vim-css-color'
"Bundle 'ZenCoding.vim'
"Bundle 'The-NERD-tree'
"Bundle 'SuperTab'

"�﷨���
"Bundle 'scrooloose/syntastic'

"��ɫ����
Bundle 'altercation/vim-colors-solarized'
"���������ļ����͵�������ϵ
filetype plugin indent on
"##########������� ����#############

"�Զ�������ļ�����
au BufNewFile,BufRead *.less set filetype=css
au BufNewFile,BufRead *.phtml set filetype=php
au BufRead,BufNewFile *.js set ft=javascript.jquery

"--------�������

"---NeoComplCache ������ʹ��Tab����
let g:neocomplcache_enable_at_startup = 1 

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 2
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
"if has('conceal')
"  set conceallevel=2 concealcursor=i
"endif


autocmd FileType php,phtml setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType css,less setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" vim markdown
let g:vim_markdown_folding_disabled=1

" ctrlp
noremap <C-W><C-U> :CtrlPMRU<CR>
nnoremap <C-W>u :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.rvm$'
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1



let g:quickrun_config = {
\   'markdown': {
\     'type': 'markdown/gfm',
\     'outputter': 'browser'
\   }
\ }



"--------�Զ����ݼ�


" �༭ģʽ���й���ƶ�
inoremap <C-h> <left>
inoremap <C-l> <right>
inoremap <C-j> <C-o>gj
inoremap <C-k> <C-o>gk


"A-t : ��NERDTree
map <silent> <C-t>   <ESC>:NERDTree<CR>
" �Դ�NERDTreeʱ��Ŀ¼Ϊ����Ŀ¼
let NERDTreeChDirMode=1
"�ر�vimʱ������򿪵��ļ�����NERDTreeû�������ļ�ʱ�����Զ��ر�
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
"�Զ�����Nerdtree
autocmd vimenter * NERDTree
"�л�Nerdtree���㵽�ļ��༭
autocmd VimEnter * wincmd p

"mm : �淶���׿ո�<cr>ȥ�������ַ�<cr>ɾ���հ���<cr>�淶����
nmap mm :%s/\r//g<cr>

"ff : ǰ��ȫ
"vmap ff <Esc>`>i')?><Esc>`<i<?=$this->_('<Esc>
vmap ff "zdi<?=$this->tag->_('<C-R>z');?><ESC>



