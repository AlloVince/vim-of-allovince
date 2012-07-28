[Vim of Allovince](http://avnpc.com/pages/vim-of-allovince)
================

工欲善其事，必先利其器。Vim就是这样一把利器，而只有通过不断的锤炼Vim才可以得到更快的开发效率。

接触Vim已经快5年，却还经常会出现“原来还可以这样！”的感慨，越是用Vim，越能体会到Vim的博大精深，可能再用5年，能发掘的东西也不足Vim全部机能的20%吧。

这篇日志算是对现阶段的用Vim的一个阶段性总结，希望下一个5年会有更多新的发现。

<a id="vim安装与设置" name="vim安装与设置"></a>Vim安装与设置
============================================================

<div class="level1">
 

</div>
<a id="vim_64bit安装" name="vim_64bit安装"></a>Vim 64bit安装
------------------------------------------------------------

<div class="level2">
系统环境为Win7 64bit + [Vim7.3 64bit][]。假设安装目录为D:\\Vim。

首先下载vim73-x64.zip解压到D:\\Vim。运行cmd

    cd D:\Vim\vim73
    install

输入d执行安装即可。

安装完成后”D:\\Vim\\\_vimrc”就是vim的配置文件了

我们可以首先做一些基础配置

</div>
<a id="vim基本配置" name="vim基本配置"></a>Vim基本配置
------------------------------------------------------

<div class="level2">
 

</div>
### <a id="设置工作目录为当前编辑文件的目录" name="设置工作目录为当前编辑文件的目录"></a>设置工作目录为当前编辑文件的目录

<div class="level3">
    set bsdir=buffer
    set autochdir

</div>
### <a id="编码设置" name="编码设置"></a>编码设置

<div class="level3">
    set enc=utf-8
    set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

</div>
### <a id="语言设置" name="语言设置"></a>语言设置

<div class="level3">
    set langmenu=zh_CN.UTF-8
    language message zh_CN.UTF-8
    set helplang=cn
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim

</div>
### <a id="禁止生成备份文件" name="禁止生成备份文件"></a>禁止生成备份文件

<div class="level3">
    set nobackup

</div>
### <a id="搜索忽略大小写" name="搜索忽略大小写"></a>搜索忽略大小写

<div class="level3">
    set ignorecase 

</div>
### <a id="搜索逐字符高亮" name="搜索逐字符高亮"></a>搜索逐字符高亮

<div class="level3">
    set incsearch

</div>
### <a id="行内替换" name="行内替换"></a>行内替换

<div class="level3">
    set gdefault

</div>
### <a id="始终显示行号" name="始终显示行号"></a>始终显示行号

<div class="level3">
    set nu!

</div>
### <a id="显示光标的坐标" name="显示光标的坐标"></a>显示光标的坐标

<div class="level3">
    set ruler

</div>
### <a id="设置tab键的宽度" name="设置tab键的宽度"></a>设置Tab键的宽度

<div class="level3">
    set shiftwidth=4
    set tabstop=4

</div>
### <a id="将tab键更改为四个空格" name="将tab键更改为四个空格"></a>将Tab键更改为四个空格

<div class="level3">
    set expandtab

这里是为了php的编码规范需求，所以也可以将文件只限定为php生效

    autocmd FileType php set expandtab

</div>
### <a id="根据编辑模式更改输入法光标颜色_同时禁用ime自动切换" name="根据编辑模式更改输入法光标颜色_同时禁用ime自动切换"></a>根据编辑模式更改输入法光标颜色，同时禁用IME自动切换

<div class="level3">
    if has('multi_byte_ime')
        hi Cursor guifg=bg guibg=Orange gui=NONE
        hi CursorIM guifg=NONE guibg=Skyblue gui=NONE
        set iminsert=0 imsearch=0
    endif

</div>
### <a id="禁用自动缩进" name="禁用自动缩进"></a>禁用自动缩进

<div class="level3">
    set noautoindent

</div>
### <a id="与windows共享剪贴板" name="与windows共享剪贴板"></a>与Windows共享剪贴板

<div class="level3">
    set clipboard+=unnamed

</div>
### <a id="编辑vimrc之后_重新加载" name="编辑vimrc之后_重新加载"></a>编辑vimrc之后，重新加载

<div class="level3">
    autocmd! bufwritepost _vimrc source $VIM/_vimrc

</div>
### <a id="设置配色方案" name="设置配

TRUNCATED!  Please download pandoc if you want to convert large files.">

  [Vim7.3 64bit]: http://code.google.com/p/vim-win3264/
    "http://code.google.com/p/vim-win3264/"


