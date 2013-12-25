工欲善其事，必先利其器。Vim就是这样一把利器，而只有通过不断的锤炼Vim才可以得到更快的开发效率。

接触Vim已经快5年，却还经常会出现“原来还可以这样！”的感慨，越是用Vim，越能体会到Vim的博大精深，可能再用5年，能发掘的东西也不足Vim全部机能的20%吧。

这篇日志算是对现阶段的用Vim的一个阶段性总结，希望下一个5年会有更多新的发现。

Vim安装与设置
-------------
 
###Vim 64bit安装

系统环境为Win7 64bit + [Vim7.3 64bit](http://code.google.com/p/vim-win3264/)。假设安装目录为D:\Vim。

首先下载vim73-x64.zip解压到D:\Vim。运行cmd

    cd D:\Vim\vim73
    install

输入d执行安装即可。

安装完成后”D:\Vim\_vimrc”就是vim的配置文件了

我们可以首先做一些基础配置

###Vim基本配置
 
设置工作目录为当前编辑文件的目录

    set bsdir=buffer
    set autochdir

编码设置

    set enc=utf-8
    set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

语言设置

    set langmenu=zh_CN.UTF-8
    language message zh_CN.UTF-8
    set helplang=cn
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim

禁止生成备份文件

    set nobackup

搜索忽略大小写

    set ignorecase 

搜索逐字符高亮

    set incsearch

行内替换

    set gdefault

始终显示行号

    set nu!

显示光标的坐标

    set ruler

设置Tab键的宽度

    set shiftwidth=4
    set tabstop=4

将Tab键更改为四个空格

    set expandtab

这里是为了php的编码规范需求，所以也可以将文件只限定为php生效

    autocmd FileType php set expandtab

根据编辑模式更改输入法光标颜色，同时禁用IME自动切换

    if has('multi_byte_ime')
        hi Cursor guifg=bg guibg=Orange gui=NONE
        hi CursorIM guifg=NONE guibg=Skyblue gui=NONE
        set iminsert=0 imsearch=0
    endif

禁用自动缩进

    set noautoindent

与Windows共享剪贴板

    set clipboard+=unnamed

编辑vimrc之后，重新加载

    autocmd! bufwritepost _vimrc source $VIM/_vimrc

设置配色方案

最后选择一个自己喜欢的配色方案，可以通过

    :color 方案名

来切换尝试。如果仍然没有满意的，那么可以去官网下载更多Vim配色方案。下载后放在”D:\Vim\vimfiles\colors”。

然后可以在配置文件中写入

    colorscheme 方案名

来指定一套方案作为默认的配色方案。

至此就完成了Vim的基础配置，如果不写代码的话，以上的配置已经足以应付日常需求。

Vim插件
-------
 
###Vim插件管理

Vim最强大之处还是由于有无穷无尽的插件，但是Vim对于插件的管理实在是弱爆了。传统的插件安装就是下载插件后丢到plugin目录下完事。但是由于插件编写的质量参差，又没有统一的规范，久而久之Vim的插件随着安装数量的增加就会变得难以维护，而插件管理的需求也就应运而生。

目前Vim有数个插件管理方案，比如pathogen， muzuiget，vim-flavor，vundle等等。

经过再三考虑，最终选择了[Vundle](https://github.com/gmarik/vundle)作为我的[Vim插件管理](http://avnpc.com/pages/vim-of-allovince)方式。

Vundle基于Git构架，每一个插件都是一个项目的Repository，通过Vundle可以用简单的指令，一键安装/删除/更新所有插件。

###Vundle的安装
 
####安装Git

Vundle在Linux非常容易安装，在Windows下首先需要安装Git。

下载[msysgit](http://code.google.com/p/msysgit/downloads/list)并安装。同时建议安装一个[TortoiseGit](http://code.google.com/p/tortoisegit/)作为图形界面。

Git安装后将Git的路径加入系统环境变量，win7下Git的路径为

    C:\Program Files (x86)\Git\cmd

然后运行cmd，输入

    git --version

如果能显示Git版本信息，说明安装成功

    git version 1.7.10.msysgit.1

在Win32下还需要建立一个Curl脚本用于Vundle的远程链接。在Git的路径下新建一个空文本文件，改名为curl.cmd，编辑内容为

    @rem Do not use "echo off" to not affect any child calls.
    @setlocal

    @rem Get the abolute path to the parent directory, which is assumed to be the
    @rem Git installation root.
    @for /F "delims=" %%I in ("%~dp0..") do @set git_install_root=%%~fI
    @set PATH=%git_install_root%\bin;%git_install_root%\mingw\bin;%PATH%

    @if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
    @if not exist "%HOME%" @set HOME=%USERPROFILE%

    @curl.exe %*

保存后在cmd中输入

    curl --version

如果可以看到版本信息说明运行成功。

####安装Vundle

Git安装完毕后，Clone Vundle到”D:\Vim\vimfiles\bundle”下，此时目录结构应该如下

    D:\vim
    +---vim73
    +---vimfiles
        +---bundle
        |   +---vundle
        +---colors

####配置Vundle


按照Vundle官方给出的配置，所有通过Vundle安装的插件会被安装到Windows的用户目录下，这里我做了修改，直接安装到Vim目录下更加方便管理

编辑_vimrc加入

    filetype off

    "此处规定Vundle的路径
    set rtp+=$VIM/vimfiles/bundle/vundle/

    "此处规定插件的安装路径
    call vundle#rc('$VIM/vimfiles/bundle/')

    Bundle 'gmarik/vundle'
    filetype plugin indent on

####通过Vundle安装插件

Vundle安装插件有三种形式，一种是一个从官方移植的Vim Script,只需要在配置中写脚本的名字，比如

    Bundle 'neocomplcache'

第二种是指定一个github上的项目名，以作者/项目的形式

    Bundle 'gmarik/vundle'

最后还可以指定一个完整的git repos地址

    Bundle 'git://git.wincent.com/command-t.git'

将要安装的插件在配置文件中写好，最后执行

    :BundleInstall

就可以一键安装了。安装有问题可以按l键查看log。我在第一次安装时出现了“can't resolve proxy 'null' for https”的报警，调查发现是因为git启用了代理的原因，可以运行cmd

    git config --global --unset http.proxy

解决。

####Vundle常用指令

- `:BundleList` 列出已经安装的插件
- `:BundleInstall` 安装所有配置文件中的插件
- `:BundleInstall!` 更新所有插件
- `:BundleSearch` 搜索插件
- `:BundleClean!` 根据配置文件删除插件

###Vim必装插件
 
####语法及高亮

我选择的插件有

    Bundle 'JavaScript-syntax'
    Bundle 'jQuery'
    Bundle 'othree/html5.vim'
    Bundle 'groenewege/vim-less'
    Bundle 'Markdown'
    Bundle 'Markdown-syntax'
    Bundle 'php.vim-html-enhanced'

主要支持了JavaScript/jQuery/HTML5/LESS/Markdown

####HTML/JS混排缩进改善

    Bundle "pangloss/vim-javascript"

####代码自动补全

代码自动补全是否优秀是评判一个IDE的重要标准，之前一直在使用ctag+supertab作为自动补全，但是ctag的补全必须借助不断更新tag文件，不够智能。所以在看到了neocomplcache后，毫不犹豫的改用了neocomplcache作为新的[Vim自动补全插件](http://avnpc.com/pages/vim-of-allovince)。

neocomplcache可以做到：

- 根据文件类型补全语言内置元素
- 根据include关系自动寻找上下文补全要素
- 自动生成缓存，优先从缓存中查找

    Bundle 'Shougo/neocomplcache'

另外一个非常有助于提高效率的插件是snipMate，可以根据不同语言自动补全代码段，比如在php下写for+Tab键，就会自动生成这样一段代码

    for ($i = 0; $i < count; $i++) {
        // code...
    }

注意这里使用的snipMate和neocomplcache都是官方版本的修改版。

    Bundle "MarcWeber/vim-addon-mw-utils"
    Bundle "tomtom/tlib_vim"
    Bundle "snipmate-snippets"
    Bundle "garbas/vim-snipmate"

###Vim插件配置

安装完上述插件后还需要做一些小的配置

    "自定义关联文件类型
    au BufNewFile,BufRead *.less set filetype=css
    au BufNewFile,BufRead *.phtml set filetype=php
    au BufRead,BufNewFile *.js set ft=javascript.jquery

    "---NeoComplCache 启动
    let g:neocomplcache_enable_at_startup = 1 

编程字体
--------

写代码还需要一个愉快的字体，Consola和Monaco这两种经典的等宽字体可以用做英文字体。中文字体微软雅黑足以胜任，下面是Consola，Monaco以及和微软雅黑的混合字体

- [Consola](http://www.ctdisk.com/file/7705104)
- [Monaco](http://www.ctdisk.com/file/7705106)
- [YaHei Consolas Hybrid](http://www.ctdisk.com/file/7705114)
- [Yahei Mono](http://www.ctdisk.com/file/7705121)

安装字体后自行选择以下的配置

    "set guifont=Monaco:h9
    "set gfw=YaHei\ Consolas\ Hybrid:h9
    "set guifont=Consolas:h12
    "set guifont=YaHei\ Consolas\ Hybrid:h12
    "set guifont=Yahei\ Mono:h12

自定义指令
---------

常用自定义指令就一条：

    nmap mm :%s/\r//g<cr>

用于删除win32下难看的蓝色^M（其实是换行符\r）


最后附上我的[Vim配置On Github](https://github.com/AlloVince/vim-of-allovince)

