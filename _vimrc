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
"set guifont=NSimSun:h10

set guifont=Monaco:h9
set gfw=YaHei\ Consolas\ Hybrid:h9

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
set nu!

"��ʾ��������
set ruler



"�Զ�����
set noautoindent
set cindent
set smartindent

"Tab���Ŀ��
set shiftwidth=4
set tabstop=4


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
autocmd! bufwritepost _vimrc source $VIM/_vimrc



"��ɫ����
colorscheme rainbow_fruit


"##########������� ��ʼ#############
filetype off
set rtp+=$VIM/vimfiles/bundle/vundle/
call vundle#rc('$VIM/vimfiles/bundle/')

"���������Ŀ�
Bundle 'gmarik/vundle'

"���벹ȫ
Bundle 'Shougo/neocomplcache'
"������Զ�����
"Bundle 'snipMate'

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "snipmate-snippets"
Bundle "garbas/vim-snipmate"

"��� �﷨/����
Bundle 'JavaScript-syntax'
Bundle 'jQuery'
Bundle 'othree/html5.vim'
Bundle 'groenewege/vim-less'
Bundle 'Markdown'
Bundle 'Markdown-syntax'
Bundle 'php.vim-html-enhanced'
"HTML������������
Bundle "pangloss/vim-javascript"

"�������ַ����䣬 ��Ҫ�޸�Դ����֧�������ַ� https://github.com/muzuiget/hacking-patches/blob/master/tabular_cjk_width.patch
Bundle 'Tabular'



"Bundle 'jslint.vim'
"��ʱԤ��CSS��ɫ
"Bundle 'skammer/vim-css-color'
"Bundle 'ZenCoding.vim'
"Bundle 'The-NERD-tree'
"Bundle 'SuperTab'


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
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : "\<C-x>\<C-u>"
"function! s:check_back_space()"{{{
"	let col = col('.') - 1
"	return !col || getline('.')[col - 1] =~ '\s'
"endfunction"}}
"inoremap <expr><C-l> neocomplcache#complete_common_string()
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"




"--------�Զ����ݼ�

"--- mm : �淶���׿ո�<cr>ȥ�������ַ�<cr>ɾ���հ���<cr>�淶����
nmap mm :%s/\r//g<cr>

