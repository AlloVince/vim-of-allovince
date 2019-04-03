工欲善其事，必先利其器。Vim 就是这样一把利器，而只有通过不断的锤炼 Vim 才可以得到更快的开发效率。

接触 Vim 已经快 5 年，却还经常会出现“原来还可以这样！”的感慨，越是用 Vim，越能体会到 Vim 的博大精深，可能再用 5 年，能发掘的东西也不足 Vim 全部机能的 20%吧。

这篇日志算是对现阶段的用 Vim 的一个阶段性总结，希望下一个 5 年会有更多新的发现。

## Vim 安装与设置
 
### Vim 64bit 安装

系统环境为 Win7 64bit + [Vim7.3 64bit](http://code.google.com/p/vim-win3264/)。假设安装目录为 D:\Vim。

首先下载 vim73-x64.zip 解压到 D:\Vim。运行 cmd

```bash
cd D:\Vim\vim73
install
```

输入 d 执行安装即可。

安装完成后”D:\Vim\_vimrc”就是 vim 的配置文件了

我们可以首先做一些基础配置

### Vim 基本配置
 
设置工作目录为当前编辑文件的目录

```vim
set bsdir=buffer
set autochdir
```

编码设置

```vim
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
```

语言设置

```vim
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
set helplang=cn
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
```

禁止生成备份文件

```vim
set nobackup
```

搜索忽略大小写

```vim
set ignorecase 
```

搜索逐字符高亮

```vim
set incsearch
```

行内替换

```vim
set gdefault
```

始终显示行号

```vim
set nu!
```

显示光标的坐标

```vim
set ruler
```

设置 Tab 键的宽度

```vim
set shiftwidth=4
set tabstop=4
```

将 Tab 键更改为四个空格

```vim
set expandtab
```

这里是为了 php 的编码规范需求，所以也可以将文件只限定为 php 生效

```vim
autocmd FileType php set expandtab
```

根据编辑模式更改输入法光标颜色，同时禁用 IME 自动切换

```vim
if has('multi_byte_ime')
    hi Cursor guifg=bg guibg=Orange gui=NONE
    hi CursorIM guifg=NONE guibg=Skyblue gui=NONE
    set iminsert=0 imsearch=0
endif
```

禁用自动缩进

```vim
set noautoindent
```

与 Windows 共享剪贴板

```vim
set clipboard+=unnamed
```

编辑 vimrc 之后，重新加载

```vim
autocmd! bufwritepost _vimrc source $VIM/_vimrc
```

设置配色方案

最后选择一个自己喜欢的配色方案，可以通过

```vim
:color 方案名
```

来切换尝试。如果仍然没有满意的，那么可以去官网下载更多 Vim 配色方案。下载后放在”D:\Vim\vimfiles\colors”。

然后可以在配置文件中写入

```vim
colorscheme 方案名
```

来指定一套方案作为默认的配色方案。

至此就完成了 Vim 的基础配置，如果不写代码的话，以上的配置已经足以应付日常需求。

## Vim 插件
 
### Vim 插件管理

Vim 最强大之处还是由于有无穷无尽的插件，但是 Vim 对于插件的管理实在是弱爆了。传统的插件安装就是下载插件后丢到 plugin 目录下完事。但是由于插件编写的质量参差，又没有统一的规范，久而久之 Vim 的插件随着安装数量的增加就会变得难以维护，而插件管理的需求也就应运而生。

目前 Vim 有数个插件管理方案，比如 pathogen， muzuiget，vim-flavor，vundle 等等。

经过再三考虑，最终选择了[Vundle](https://github.com/gmarik/vundle)作为我的[Vim 插件管理](http://avnpc.com/pages/vim-of-allovince)方式。

Vundle 基于 Git 构架，每一个插件都是一个项目的 Repository，通过 Vundle 可以用简单的指令，一键安装/删除/更新所有插件。

### Vundle 的安装
 
#### 安装 Git

Vundle 在 Linux 非常容易安装，在 Windows 下首先需要安装 Git。

下载[msysgit](http://code.google.com/p/msysgit/downloads/list)并安装。同时建议安装一个[TortoiseGit](http://code.google.com/p/tortoisegit/)作为图形界面。

Git 安装后将 Git 的路径加入系统环境变量，win7 下 Git 的路径为

```plain
C:\Program Files (x86)\Git\cmd
```

然后运行 cmd，输入

```bash
git --version
```

如果能显示 Git 版本信息，说明安装成功

```plain
git version 1.7.10.msysgit.1
```

在 Win32 下还需要建立一个 Curl 脚本用于 Vundle 的远程链接。在 Git 的路径下新建一个空文本文件，改名为 curl.cmd，编辑内容为

```bash
@rem Do not use "echo off" to not affect any child calls.
@setlocal

@rem Get the abolute path to the parent directory, which is assumed to be the
@rem Git installation root.
@for /F "delims=" %%I in ("%~dp0..") do @set git_install_root=%%~fI
@set PATH=%git_install_root%\bin;%git_install_root%\mingw\bin;%PATH%

@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%

@curl.exe %*
```

保存后在 cmd 中输入

```bash
curl --version
```

如果可以看到版本信息说明运行成功。

#### 安装 Vundle

Git 安装完毕后，Clone Vundle 到”D:\Vim\vimfiles\bundle”下，此时目录结构应该如下

```plain
D:\vim
+---vim73
+---vimfiles
    +---bundle
    |   +---vundle
    +---colors
```

#### 配置 Vundle


按照 Vundle 官方给出的配置，所有通过 Vundle 安装的插件会被安装到 Windows 的用户目录下，这里我做了修改，直接安装到 Vim 目录下更加方便管理

编辑_vimrc 加入

```vim
filetype off

"此处规定Vundle的路径
set rtp+=$VIM/vimfiles/bundle/vundle/

"此处规定插件的安装路径
call vundle#rc('$VIM/vimfiles/bundle/')

Bundle 'gmarik/vundle'
filetype plugin indent on
```

#### 通过 Vundle 安装插件

Vundle 安装插件有三种形式，一种是一个从官方移植的 Vim Script,只需要在配置中写脚本的名字，比如

```vim
Bundle 'neocomplcache'
```

第二种是指定一个 github 上的项目名，以作者/项目的形式

```vim
Bundle 'gmarik/vundle'
```

最后还可以指定一个完整的 git repos 地址

```vim
Bundle 'git://git.wincent.com/command-t.git'
```

将要安装的插件在配置文件中写好，最后执行

```vim
:BundleInstall
```

就可以一键安装了。安装有问题可以按 l 键查看 log。我在第一次安装时出现了“can't resolve proxy 'null' for https”的报警，调查发现是因为 git 启用了代理的原因，可以运行 cmd

```vim
git config --global --unset http.proxy
```

解决。

#### Vundle 常用指令

- `:BundleList` 列出已经安装的插件
- `:BundleInstall` 安装所有配置文件中的插件
- `:BundleInstall!` 更新所有插件
- `:BundleSearch` 搜索插件
- `:BundleClean!` 根据配置文件删除插件

### Vim 必装插件
 
#### 语法及高亮

我选择的插件有

```vim
Bundle 'JavaScript-syntax'
Bundle 'jQuery'
Bundle 'othree/html5.vim'
Bundle 'groenewege/vim-less'
Bundle 'Markdown'
Bundle 'Markdown-syntax'
Bundle 'php.vim-html-enhanced'
```

主要支持了 JavaScript/jQuery/HTML5/LESS/Markdown

#### HTML/JS 混排缩进改善

```vim
Bundle "pangloss/vim-javascript"
```

#### 代码自动补全

代码自动补全是否优秀是评判一个 IDE 的重要标准，之前一直在使用 ctag+supertab 作为自动补全，但是 ctag 的补全必须借助不断更新 tag 文件，不够智能。所以在看到了 neocomplcache 后，毫不犹豫的改用了 neocomplcache 作为新的[Vim 自动补全插件](http://avnpc.com/pages/vim-of-allovince)。

neocomplcache 可以做到：

- 根据文件类型补全语言内置元素
- 根据 include 关系自动寻找上下文补全要素
- 自动生成缓存，优先从缓存中查找

    Bundle 'Shougo/neocomplcache'

另外一个非常有助于提高效率的插件是 snipMate，可以根据不同语言自动补全代码段，比如在 php 下写 for+Tab 键，就会自动生成这样一段代码

```php
for ($i = 0; $i < count; $i++) {
    // code...
}
```

注意这里使用的 snipMate 和 neocomplcache 都是官方版本的修改版。

```vim
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "snipmate-snippets"
Bundle "garbas/vim-snipmate"
```

### Vim 插件配置

安装完上述插件后还需要做一些小的配置

```vim
"自定义关联文件类型
au BufNewFile,BufRead *.less set filetype=css
au BufNewFile,BufRead *.phtml set filetype=php
au BufRead,BufNewFile *.js set ft=javascript.jquery

"---NeoComplCache 启动
let g:neocomplcache_enable_at_startup = 1 
```

## 编程字体

写代码还需要一个愉快的字体，Consola 和 Monaco 这两种经典的等宽字体可以用做英文字体。中文字体微软雅黑足以胜任，下面是 Consola，Monaco 以及和微软雅黑的混合字体

- [Consola](http://www.ctdisk.com/file/7705104)
- [Monaco](http://www.ctdisk.com/file/7705106)
- [YaHei Consolas Hybrid](http://www.ctdisk.com/file/7705114)
- [Yahei Mono](http://www.ctdisk.com/file/7705121)

安装字体后自行选择以下的配置

```vim
"set guifont=Monaco:h9
"set gfw=YaHei\ Consolas\ Hybrid:h9
"set guifont=Consolas:h12
"set guifont=YaHei\ Consolas\ Hybrid:h12
"set guifont=Yahei\ Mono:h12
```

## 自定义指令

常用自定义指令就一条：

```vim
nmap mm :%s/\r//g<cr>
```

用于删除 win32 下难看的蓝色^M（其实是换行符\r）


最后附上我的 [Vim 配置 On Github](https://github.com/AlloVince/vim-of-allovince)
