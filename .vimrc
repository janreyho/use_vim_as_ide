" 更新时间：Sat Mar 25 17:29:45 CST 2017

" 自己添加
" 清除行末的空格
autocmd BufWritePre * :%s/\s\+$//e

" 定义快捷键的前缀，即 <Leader>
let mapleader=";"

" 文件类型侦测
filetype on
" 根据类型加载对应插件
filetype plugin on

"11 vim 自身（非插件）快捷键
" 行首和行尾
" nmap LB 0
" nmap LE $

"" 复制至系统剪贴板
"vnoremap <Leader>y "+y
"" 将系统剪贴板粘贴至vim
"nmap <Leader>p "+p
"
"" 关闭窗口
"nmap <Leader>q :q<CR>
"" 保存窗口
"nmap <Leader>w :w<CR>
"" 保存所有窗口并退出
"nmap <Leader>WQ :wa<CR>:q<CR>
"" 不保存，直接退出
"nmap <Leader>Q :qa!<CR>
"
"" 依次遍历
"nnoremap nw <C-W><C-W>
"" 右方窗口
"nnoremap <Leader>lw <C-W>l
"" 左方窗口
"nnoremap <Leader>hw <C-W>h
"" 上方窗口
"nnoremap <Leader>kw <C-W>k
"" 下方窗口
"nnoremap <Leader>jw <C-W>j
"
" 在结对符之间跳转
"nmap <Leader>M %

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 其他
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu


"22 vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
" Plugin 'altercation/vim-colors-solarized'
Plugin 'davidhalter/jedi-vim'               "Awesome autocompletion and static analysis library for python
" Plugin 'fholgado/minibufexpl.vim'         "buffer explorer
Plugin 'gcmt/wildfire.vim'                  "结对选择 空格
Plugin 'klen/python-mode'                   "PyLint, Rope, Pydoc, breakpoints from box
Plugin 'kshenoy/vim-signature'              "收藏display and navigate marks
" Plugin 'lilydjwg/fcitx.vim'               "中文切换keep and restore fcitx state when leaving/re-entering insert mode
Plugin 'Lokaltog/vim-easymotion'            "Vim motions on speed  <leader><leader>fa
Plugin 'Lokaltog/vim-powerline'             "The ultimate vim statusline utility
Plugin 'majutsushi/tagbar'                  "that displays tags in a window, ordered by scope
Plugin 'nathanaelkane/vim-indent-guides'    "缩进
Plugin 'scrooloose/nerdcommenter'           "注释<leader>cc
Plugin 'scrooloose/nerdtree'                "A tree explorer
Plugin 'sjl/gundo.vim'                      "分支undo
Plugin 'SirVer/ultisnips'                   "模板补全
"Plugin 'suan/vim-instant-markdown'
Plugin 'tomasr/molokai'
Plugin 'tpope/vim-fugitive'                 "Git
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'            "Syntax checking hacks for vim

" Plugin 'vim-scripts/indexer.tar.gz'       "自动生产标签indexing all files in project with ctags
" Plugin 'vim-scripts/DfrankUtil'
" Plugin 'vim-scripts/vimprj'
" Plugin 'vim-scripts/DrawIt'               "方向键快速绘制出
" Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
" Plugin 'vim-scripts/phd'                  "复古主题

" Plugin 'derekwyatt/vim-fswitch'
" Plugin 'derekwyatt/vim-protodef'          "根据类声明自动生成类实现的代码框架
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'mileszs/ack.vim'                    "Vim plugin for the Perl module / CLI script 'ack'
Plugin 'dyng/ctrlsf.vim'                  "结合ack.vim 查找替换
Plugin 'terryma/vim-multiple-cursors'       "光标编辑功能

Plugin 'VundleVim/Vundle.vim'
" 插件列表结束
call vundle#end()
filetype plugin indent on


"33 界面美化 配色方案
set background=dark
" colorscheme solarized
" let g:solarized_termcolors=256
" let g:solarized_termtrans = 1
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
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

" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
fun! ToggleFullscreen()
	call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
" 全屏开/关快捷键
" map <silent> <F11> :call ToggleFullscreen()<CR>
"" 启动 vim 时自动全屏
"autocmd VimEnter * call ToggleFullscreen()

" 辅助信息
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

" 其他美化
" 设置 gvim 显示字体
set guifont=YaHei\ Consolas\ Hybrid\ 10.5
" 禁止折行
set nowrap
" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'


"44 语法分析
" 语法高亮
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 缩进
" 不同语言的智能缩进
filetype indent on
" tab->空格
set expandtab
" tab占用空格数
set tabstop=4
" 格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 缩进可视化插件 Indent Guides
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
" nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" 代码折叠
" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" 接口与实现快速切换
" *.cpp 和 *.h 间切换
" nmap <silent> <Leader>sw :FSHere<cr>

" 代码收藏
" 自定义 vim-signature 快捷键
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

" 标签列表
" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_left=1
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
" nnoremap <Leader>ilt :TagbarToggle<CR>
" 设置标签子窗口的宽度
let tagbar_width=32
" tagbar 子窗口中不显示冗余帮助信息
let g:tagbar_compact=1
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
     \ 'ctagstype' : 'c++',
     \ 'kinds'     : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0',
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

" 基于标签的代码导航
" 设置插件 indexer 调用 ctags 的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
" let g:indexer_ctagsCommandLineOptions="--c++-kinds=+l+p+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"
" 正向遍历同名标签
" nmap <Leader>tn :tnext<CR>
" 反向遍历同名标签
" nmap <Leader>tp :tprevious<CR>

" 基于语义的代码导航
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" syntastic 错误符号
let g:syntastic_error_symbol='✗'
" 警告符号
let g:syntastic_warning_symbol='⚠'
" 是否在打开文件时检查
let g:syntastic_check_on_open=0
" 是否在保存文件后检查
let g:syntastic_check_on_wq=1

" 查找
" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>
" 快捷替换
let g:multi_cursor_next_key='<S-n>'
let g:multi_cursor_skip_key='<S-k>'
" 精准替换
" 替换函数。参数说明：
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>


"55 模板补全
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsSnippetDirectories=["mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" YCM 补全
" YCM 补全菜单配色
" 菜单
highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0

" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=0
"" 引入 C++ 标准库 tags
"set tags+=/data/misc/software/app/vim/stdcpp.tags
"set tags+=/data/misc/software/app/vim/sys.tags
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview

" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1

" 由接口快速生成实现框架
" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1

" 库信息参考
" 启用:Man命令查看各类man信息
source $VIMRUNTIME/ftplugin/man.vim
" 定义:Man命令查看各类man信息的快捷键
nmap <Leader>man :Man 3 <cword><CR>


" 66工程文件浏览
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置 NERDTree 子窗口宽度
let NERDTreeWinSize=22
" 设置 NERDTree 子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

" 多文档编辑
" 显示/隐藏 MiniBufExplorer 窗口
" map <Leader>bl :MBEToggle<cr>
" buffer 切换快捷键
" map <C-Tab> :MBEbn<cr>
" map <C-S-Tab> :MBEbp<cr>

" 环境恢复
" 设置环境保存项
"set sessionoptions="blank,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
" 保存 undo 历史。必须先行创建 .undo_history/
"set undodir=~/.undo_history/
"set undofile
" 保存快捷键
"map <leader>ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
"map <leader>ss :mksession! my.vim<cr>
" 恢复快捷键
"map <leader>rs :source my.vim<cr> :rviminfo my.viminfo<cr>
"map <leader>rs :source my.vim<cr>
" 设置快捷键实现一键编译及运行
" nmap <Leader>m :wa<CR> :cd build/<CR> :!rm -rf main<CR> :!cmake CMakeLists.txt<CR>:make<CR><CR> :cw<CR> :cd ..<CR>
" nmap <Leader>g :wa<CR>:cd build/<CR>:!rm -rf main<CR>:!cmake CMakeLists.txt<CR>:make<CR><CR>:cw<CR>:cd ..<CR>:!build/main<CR>

" 快速选中结对符内的文本
map <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)
" 适用于哪些结对符
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip"]

" 调用 gundo 树
" nnoremap <Leader>ud :GundoToggle<CR>

