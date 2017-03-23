````bash
#编辑远程文件
vim scp://api2dev//etc/nginx/nginx.conf
````

##窗口管理

	ctrl+f,ctrl+b		//下一页，上一页
	:sp					//split		
	:vsp				//vsplit
	:e 1.txt
	ctrl+ww			//下一个窗口
	,,
	ctrl+w hjkl		//在展示的多个窗口切换
	
	Ctrl+W =	//所有分屏一样高度
	
	vimdiff 1.txt 2.txt 	//比较文件

##块编辑

	ctrl-v 进入块编辑模式
	r  修改
	I   esc  插入
	dd 删除

##复制粘贴
vim有12个粘贴板，分别是0、1、2、...、9、a、“、＋.

	Ny
	Np
	y		//复制到"（零时粘贴板）
	p		//从“粘贴
	＋y		//＋（系统粘贴板）
	＋p
	:reg	//查看各个粘贴板里的内容
	
	u		//取消上一次操作
	ctrl+r	//重复上一次
移动光标：hjkl,左下上右

	11h		//向左移动11个字符
	ra 		//替换当前字符为a
	0		//行首
	$		//行末
	gg  	//首行
	GG		//末行

选择

	v    //从光标当前位置开始，光标所经过的地方会被选中，再按一下v结束。
	ggVG //选中全部的文本， 其中gg为跳到行首，V选中整行，G末尾
	V    //从光标当前行开始，光标经过的行都会被选中，再按一下Ｖ结束。 
	Ctrl + v   //从光标当前位置开始，选中光标起点和终点所构成的矩形区域，再按一下Ｃtrl + v结束。

##替换

替换语法为 :[addr]s/源字符串/目的字符串/[option]

	:set ignorecase		//忽略大小写敏感
	:set noignorecase  //大小写敏感
	:%s/\/Users\/hejiayi/~/g		//把文件中的/Users/hejiayi替换为～
	:g/^$/d	//删除空行
* [vim全局替换命令](http://andyss.blog.51cto.com/315552/131652)
  升级vim

  brew install mercurial
  brew install vim

在vi中保存一个只有root可以写的文件

	:w !sudo tee %

* [vim的复制粘贴小结](http://blog.csdn.net/bluesky_leon/article/details/4069194)
* [vim常用命令总结](http://blog.csdn.net/ithomer/article/details/5929428)
* [Mac自带的Vim怎么升级](https://www.zhihu.com/question/34113076)



##IDE
####ctags
	ctags -R
	:set tags=tags
	ctrl+]
	ctrl+t

####cscope
	cscope -Rbkq
	:cs add cscope.out
	:cs find s symbol
	ctrl shift - s/g/d/c
####taglist

####tagbar

#### 
####winmanager