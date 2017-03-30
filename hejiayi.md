# .vimrc 文件

### 前缀键

vim 自带有很多快捷键，再加上各类插件的快捷键，大量快捷键出现在单层空间中难免引起冲突，为缓解该问题，引入了前缀键 <leader>，这样，键 r 可以配置成 r、<leader>r、<leader><leader>r 等等多个快捷键

```
" 定义快捷键的前缀，即<Leader>
let mapleader=";"
```

### 文件类型侦测

允许基于不同语言加载不同插件（如，C++ 的语法高亮插件与 python 的不同）：

```bash
" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
```

### vim（非插件）常用快捷键

```bash
" 定义快捷键到行首和行尾
nmap LB 0
nmap LE $
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转
nmap <Leader>M %
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
```

```bash
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu
```

### vim/ 目录

vim 有一套自己的脚本语言 vimscript，vim 还支持 perl、python、lua、ruby 等。

vim 插件目前分为 *.vim 和 *.vba 两类，前者是传统格式的插件，实际上就是一个文本文件，通常 someplugin.vim（插件脚本）与 someplugin.txt（插件帮助文件）并存在一个打包文件中，但**帮助文件需执行 :helptags ~/.vim/doc/ 才能生效，可通过 :h someplugin 查看插件帮助信息**。

## 源码安装 vim

## 插件管理

插件更新频率较高，差不多每隔一个月你应该看看哪些插件有推出新版本

```
:PluginInstall
:PluginClean
:PluginUpdate
```

## 界面美化

### 主题风格

 UX 设计讲究的是内容至上，从 GNOME3 的变化就能看出。编辑器界面展示的应全是代码，不应该有工具条、菜单、滚动条浪费空间的元素，另外，编程是种精神高度集中的脑力劳动，不应出现闪烁光标、花哨鼠标这些分散注意力的东东

```bash
" 配色方案
set background=dark
colorscheme solarized
"colorscheme molokai
"colorscheme phd

" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T
```

外部命令 wmctrl 及其命令行参数控制将指定窗口 windowid（即，vim）全屏，绑定快捷键 F11 实现全屏/窗口模式切换（linux 下各 GUI 软件约定使用 F11 全屏，最好遵守约定），最后配置启动时自动全屏。

```bash
" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
fun! ToggleFullscreen()
    call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
" 全屏开/关快捷键
map <silent> <F11> :call ToggleFullscreen()<CR>
" 启动 vim 时自动全屏
autocmd VimEnter * call ToggleFullscreen()
```



```bash
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch

" 设置 gvim 显示字体
set guifont=YaHei\ Consolas\ Hybrid\ 11.5
" 禁止折行
set nowrap
```

### Powerline

```
" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'
```

## 代码分析

### 代码展示

#### 语法高亮

vim-cpp-enhanced-highlight

```bash
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
```

#### 代码缩进 IndentGuides

```bash
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle
```

#### 代码折叠za zM zR

vim 自身支持多种折叠：手动建立折叠（manual）、基于缩进进行折叠（indent）、基于语法进行折叠（syntax）、未更改文本构成折叠（diff）等等，其中，indent、syntax 比较适合编程，按需选用

```bash
" za，打开或关闭当前折叠；zM，关闭所有折叠；zR，打开所有折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
```

### .h与.cpp快速切换 vim-fswitch

### @代码收藏 vim-signature

### @标识符列表 

### @查找替换

#### 声明/定义跳转

#### 内容查找

ack.vim（[https://github.com/mileszs/ack.vim](https://github.com/mileszs/ack.vim) ）

ctrlsf.vim（[https://github.com/dyng/ctrlsf.vim](https://github.com/dyng/ctrlsf.vim) ）

#### 内容替换

vim-multiple-cursors 插件（[https://github.com/terryma/vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors) ）

## 代码开发

### 快速开关注释

Commenter（[https://github.com/scrooloose/nerdcommenter](https://github.com/scrooloose/nerdcommenter) 

````
<leader>cc，注释
<leader>cu，取消注释
````

### @模版补全

### @接口生成框架

### @信息库参考

## 工程管理

#### 工程文件nerdtree

#### 多文档 MiniBufExplorer

#### 环境恢复

#### @cmake

## 其他辅助

#### 结对符wildfire.vim

    一次空格	选中最近一层结对符内的文本，
    两次		  则选中近两层内的文本
    三次		  选中三层，依此类推
    %	在结对间跳转，vim自带
#### 快速移动vim-easymotion

    ;;fa  查找所有a字符
    v<leader><leader>fa		快速选中光标当前位置到指定字符 a 之间的文本，d<leader><leader>fa		快速删除光标当前位置到指定字符 a 之间的文本

#### 分支undo gundo.vim

# 其他

### vim命令

#### set命令

这个命令通常用来设置一个vim选项，如`set number`可以开启行号显示。`set list`可以显示一些不可见字符。`set tabstop=4`可以设置将一个缩进符号显示为4个字符宽。有些选项通常需要同时设置，这时可以用一个set命令搞定，如`set noexpandtab nosmarttab tabstop=4 shiftwidth=4 softtabstop=4`，这可以同时设置一系列关于缩进的选项。

set命令也可以用来显示选项的值，这在诊断问题的时候非常有用，如`set list?`，`set autoindent?`，`set tabstop?`（也可以写成`set tabstop`）。

#### let命令

let命令用来给变量赋值。你在别人的vim配置里会经常看到let命令出现，因为很多vim插件通过读取某个全局变量的值来设定它的行为模式，包括插件的开启和关闭，这是保证在公共环境下安装vim插件而不影响其他人的好方法，因为只要其他人的vimrc配置里没有定义关于该插件的全局变量，插件就可以选择什么都不做。

关于let命令的具体语法，你可以`:h let`。

#### map命令

map命令用来定义按键映射，按键映射简单但强大，可以帮助你减少相当多的重复工作。这几乎是学习vim的初期最具学习性价比的一个命令。

我在这里提到的map命令，其实是一组类似的命令，包括`map`, `noremap`, `imap`, `inoremap`, `nmap`, `nnoremap`... 这些命令都用来定义按键映射，只是作用稍有区别。他们的语法都类似：

`map {lhs} {rhs}`

表示将`{lhs}`按键序列映射到`{rhs}`按键序列

这些命令可以分为两类：不允许递归定义的`*noremap`类和允许递归定义的`*map`类，两类命令的区别就在于，`*noremap`类按键映射中的{rhs}被解释为默认按键的序列，而`*map`类按键映射中的{rhs}则被解释为原始的用户按键序列，因而会受到其它按键映射的影响。

显然`*map`类的映射命令的涵义并不明确，它很可能会受到其它脚本及vim插件的干扰，对于新手来说并不友好。事实上，通常我们很少需要用到`*map`类映射命令，除非你有意要保留某些副作用。所以，如果你对map命令不是十分熟悉，请**从\*noremap类命令开始**。

常用的几个`*noremap`类命令有：

- `nnoremap` 定义normal模式(普通模式)下的键映射，如`nnoremap j gjzz`
- `inoremap` 定义insert模式(插入模式)下的键映射, 如`inoremap  g`
- `vnoremap` 定义visual模式(可视模式)下的键映射, 如`vnoremap v `

更多的map命令可以参考[这里](http://man.lupaworld.com/content/manage/vi/doc/map.html)

#### 关于那些不能映射的键

在Linux系统终端中，很多键具有特殊的含义，是不应该在vim里再定义映射的：

<c-c> 向当前进程发送一个终止信号。很多人习惯在windows系统里用这个快捷键复制文本，但是不要把这个习惯带入vim中
<c-z> 向当前进程发送一个挂起信号，当前进程将被挂起到后台。
<c-d> 相当于输入了一个EOF(文件结束符)，很多命令行程序通过这个符号判断输入结束。
<c-[> 相当于输入<esc>。这是某些情况下输入<esc>的唯一方式。
<c-h> 相当于输入<backspace>，这是某些情况下输入<backspace>的唯一方式。

即使你大部分时间并没有在使用终端，你也不应该映射这些键，否则你的配置说不定哪天就会出一些奇怪的问题。当你在写一个准备发布给别人用的插件时尤其需要注意这点！

### vim寄存器

*先抛出一个问题：每次打开Vim，想找一段文本来练练手，于是打开网页copy了一段，问题来了，怎样粘贴到vim的编辑器里头去呢？如果你还在CTRL+v的话，说明你还无法割舍Windows，就像东方姑娘忘不了令狐冲):这里暂且告诉你如何粘贴：SHIFT+INSERT 两个键联合起来。再来看下面的原理* 
寄存器是Vim用来存储文件的临时空间，当使用命令y（yank）或d（delete）复制删除文本时，该文本就会被保存在寄存器中，通过p（put）命令插入刚删除或复制的内容。vim的寄存器分为不同的种类：

#### 数字寄存器：

在normal模式下输入`:reg`，您是否看到很多“（双引号）开头的数字了呢，这些都是寄存器，（如果暂时没看到，那么在对文本做几个操作，比如：`dd,yy`等），这些寄存器里保存了最近删除的和复制的文本。

数字寄存器有十个，分别是：`"0，"1，"2... "9`（注意：**数字前有个双引号**），寄存器`"0`保存上一次复制(y)操作的文本，"1到"9寄存器保存最近9次删除的文本行（**注意这个“行”字**），"1保存的内容是**最最近一次**删除的内容（也就是说最后一次执行删除命令保存的内容）"2保存的是**倒数第二次删除**的内容，依此类推，直到"9，如果又有新的操作，那么"9的内容将会被"8的内容替换，先前”9的内容将被丢弃。 
那么p（put）命令粘贴是哪个寄存器中的内容呢？有时候是粘贴的是"1寄存器的，有时粘贴的是"0寄存器中的，但是总的原则就是**粘贴最近一次删除或者复制的内容**，如果删除是最近的一次，就是粘贴"1的，也就是粘贴刚刚删除的文本，如果复制是最近的一次操作，那么粘贴的内容是"0中的，也就是粘贴刚刚复制的内容。

#### 字母寄存器：

`"a，"b，"c...`都是字母寄存器，也许你执行`:reg`的时候看不到这些命令，不要紧，稍后就有了。之前粘贴我们用的都是p命令，如果我想粘贴其他寄存器里面的内容呢，你想到了吗？答案就是：**寄存器的名称+p**。现在我们新建一个字母寄存器，把当前三行保存到`"a`寄存器中去，具体操作如下：在normal模式下输入`"a3yy`，这样当前三行就保存在"a中去了，粘贴同样在normal模式下，`"3p` 即可。如果是大写字母的寄存器，如执行：`"Cdd`：他的作用是把当前行删除，再把内容追加到"c寄存器中，也就是说**字母寄存器没有大写之分，只是功能上有区别，大写就是追加，小写是替换**。

#### 其他寄存器：

`""`：无名寄存器，p命令粘贴的内容，保存最近一次删除或复制的内容。
`“-`：（**-是个减号**）小删除寄存器（small delete register），前面说过要您注意这个”行“字，也就是说并不是所有删除的文本都会保存在数字寄存器中，如果你删除的只是一个单词或字母： `dw`或者`x`，那么这个单词并不会保存在"1寄存器中，而是保存在`"-`寄存器里面。所有不包含**换行符**的删除都会保存在此寄存器中。

`"*` ：这个就是系统寄存器喽，最开始的问题的第二个答案知道了吧 

当然还有一些寄存器，这里就不一一介绍了。

### 跳转

```
Ctrl + ] 到函数定义或声明 [ + tab
Ctrl + T 返回
[{ 转到上一个位于第一列的"{"
}] 转到下一个位于第一列的"{"
{   转到上一个空行
}   转到下一个空行
gd 转到当前光标所指的局部变量的定义，
CTRL-w gf  在新tab打开头文件
:checkpath	检查头文件目录
:set path+=base/ 设置头文件目录
CTRL-6	上一次编辑的文件
Ctrl+i 前进 Ctrl+o 返回


H M L	到当前页high，middle，lower
NG 	到第 N 行 （陈皓注：注意命令中的G是大写的，另我一般使用 : N 到第N行，如 :137 到第137行）
gg 	到第一行。（陈皓注：相当于1G，或 :1）
G 	到最后一行

% 	匹配括号移动
*   转到当前光标所指的单词下一次出现的地方
#   转到当前光标所指的单词上一次出现的地方
Ctrl+O	向后回退你的光标移动
Ctrl+I	向前追赶你的光标移动
w 	到下一个单词的开头。
e 	到下一个单词的结尾
```



### 目录相关

````
$ ctags –R --c-types=+px ($ 为Linux系统Shell提示符)
$ vi –t tag (请把tag替换为您欲查找的变量或函数名)
：ts (ts 助记字：tags list, “:”开头的命令为VI中命令行模式命令)
：tp (tp 助记字：tags preview)—此命令不常用，可以不用记
：tn (tn 助记字：tags next) —此命令不常用，可以不用记
：tag /tag(请把tag替换为您欲查找的变量或函数名)

ctrl+z将vi转入后台，fg可返回vi

N<command> 	重复某个命令N次
u → undo
<C-r> → redo

J	join line

:r!date 插入日期（读取Shell命令相关）
:%!xxd	二进制查看
:%!xxd -r	恢复
````



> :w !sudo tee %

命令:w !{cmd}，让 vim 执行一个外部命令{cmd}，然后把当前缓冲区的内容从 stdin 传入。
tee 是一个把 stdin 保存到文件的小工具。
而 %，是vim当中一个只读寄存器的名字，总保存着当前编辑文件的文件路径。
所以执行这个命令，就相当于从vim外部修改了当前编辑的文件，好完工。

#### 缓冲区

````
– （非活动的缓冲区）
a （当前被激活缓冲区）
h （隐藏的缓冲区）
% （当前的缓冲区）
# （交换缓冲区）
= （只读缓冲区）
+ （已经更改的缓冲区）

:ls查看缓冲区
:b n 打开第n个缓冲区
:bn 下一个缓冲区
:bp 上一个缓冲区

:e <path/to/file> 打开edit一个文件
:sp <filename>  分屏打开文件
:tabnew <filename>  分tab打开文件

:sb 3 				分屏显示3号buffer
:vertical sb 3      同上，垂直分屏
:b <Tab>	显示所有Buffer中的文件
:b *car<Tab>   " 显示 car.c jetcar.c car.h jetcar.h
````

#### 窗口分屏浏览目录

````
:He   全称为 :Hexplore  （在下边分屏浏览目录）
:He!  （在上分屏浏览目录）
:Ve 全称为 :Vexplore （在左边分屏间浏览目录，要在右边则是 :Ve!）
````

#### 分屏同步移动

要让两个分屏中的文件同步移动，很简单，你需要到需要同步移动的两个屏中都输入如下命令（相当于使用“铁锁连环”）：

> :set scb

如果你需要解开，那么就输入下面的命令：

> :set scb!

注：set scb 是 set scrollbind 的简写。

#### Tab页浏览目录

````
:Te  全称是 :Texplorer 分tab式的浏览
gt   	到下一个页
gT  	到前一个页
{i} gt    i是数字，到指定页，比如：5 gt 就是到第5页
:tabm{n}  切换tab
:tabs	查看tab页
:tabclose [i] – 如果后面指定了数字，那就关闭指定页，如果没有就关闭当前页
:bufdo tab split		把buffer中的文件全转成tab的话
````

### 查找

````
:vimgrep word *		在当前目录下查找:
:vimgrep word **	递归查找子文件夹:
:cnext (:cn) 		当前页下一个结果
:cprevious (:cp) 	当前页上一个结果
:clist (:cl) 		打开quickfix窗口，列出所有结果，不能直接用鼠标点击打开，只能看
:copen (:cope) 		打开quickfix窗口，列出所有结果，可以直接用鼠标点击打开
:ccl[ose] 		关闭 quickfix 窗口。
ctrl + ww 		切换编辑窗口和quickfix窗口，在quickfix里面和编辑窗口一样jk表示上下移动，回车选中进入编辑窗口
````

### 列块编辑

````
V（大写）	按行为单位进行选择
v（小写）	移动光标可以选择

ctrl-v 进入纵向编辑模式
r 修改
I 插入
A 后添加

ve 选中当前单词
ve"*y 当前单词拷贝到系统剪贴板
````



### vim command line

````
<c-b>	光标移到最左侧
<c-e>	光标移到最右侧
````



## 每日一Vim

### 23宏---Record、Play

例1: 	每行末加上分号";"：

```
print a
print b
print c
```

1. normal 模式下输入`q`启动recoding，q后面跟任意a-z的小写字母比如`m`，这个字母就是宏的名字，接下来你要执行的操作就会记录在这个宏中。
2. 执行我们的任务：“行末加分号”，命令是：`$a;j$`，这条命令意思就是：移动行尾插入分号，退到normal模式，光标移动到下一行的末尾。
3. 再次输入`q`，表示录制结束
4. 录制结束后我们就可以play了，输入`@m`就会执行宏中的操作，`m`是第一步中使用的宏的名称，`5@m`表示重复执行5次。这样，所有行都给加上分号了，真是好使。

   例2：实现如下效果：从1到100，每行+1。

命令：首先在第一行插入1，然后光标定位了“1”处，进入normal模式，开始录制：`qmyypaq`，（解释：`yyp`：拷贝一行再粘贴在新的一行，`a`：数字+1）后然执行`98@m`，收工。

注：

````
<Ctrl>a		+1
<Ctrl>x		-1
````


