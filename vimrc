"""""""""""""""""""""""""""系统""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:iswingows = 0
let g:islinux = 0
if(has("win32")||has("win64")||has("win95")||has("win16"))
	let g:iswingows = 1
else
	let g:islinux = 1
endif

if has("gui_running")
	let g:isGUI = 1
else
	let g:isGUI = 0
endif

if has("syntax")
    syntax on
endif

if g:islinux
	set hlsearch "高亮搜索
	set incsearch "实时匹配
	"Uncomment the following to have Vim jump to the last position when reopening a file
	if has("autocmd")
		au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")|exe "normal! g'\""|endif
	endif
	if g:isGUI
		if filereadable("/etc/vim/gvimrc.local")
			source /etc/vim/gvimrc.local
		endif
	endif
else
	" This line should not be removed as it ensures that various options are
	" properly set to work with the Vim-related packages available in Debian.
	runtime! debian.vim
	" Vim5 and later versions support syntax highlighting. Uncommenting the
	" next line enables syntax highlighting by default.

	set mouse = 1	"在任何模式下启用鼠标
	set t_Co = 256  "在终端启用256色

	if filereadable("/etc/vim/vimrc.local")
		source /etc/vim/vimrc.local
	endif
endif
"""""""""""""""""""""""""""系统""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"==============================vundle====================================================================
"安装
"git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set nocompatible               " be iMproved
filetype off                   " required!
if g:islinux
	set rtp+=~/.vim/bundle/vundle/
	call vundle#rc()
else
	set rtp+=$VIM/vimfiles/bundle/vundle/
	call vundle#rc('$VIM/vimfiles/bundle/')
endif

" required!
Bundle 'gmarik/vundle'
Bundle 'taglist.vim'
"Bundle 'supertab'
Bundle 'bufexplorer.zip'
Bundle 'c.vim'
Bundle 'a.vim'
"Bundle 'ag.vim'
"相对 TagList 能更好的支持面向对象
Bundle 'tagbar'
"Bundle 'majutsushi/tagbar'
"一个全路径模糊文件，缓冲区，最近最多使用，... 检索插件；详细帮助见 :h ctrlp
Bundle 'ctrlpvim/ctrlp.vim'
"用于各种代码补全，这种补全是一种对代码中的词与代码块的缩写补全
Bundle 'snipmate'                   
Bundle 'scrooloose/nerdtree'
"状态栏插件，更好的状态栏效果
Bundle 'Lokaltog/vim-powerline'     
"主要用.命令来重复上次插件使用的命令
Bundle 'repeat.vim'                 
"Bundle 'winmanager'
"Bundle 'Lokaltog/vim-easymotion'
Bundle 'easymotion/vim-easymotion'
"Bundle 'terryma/vim-multiple-cursors'
"Bundle 'upsuper/vim-colorschemes'
"Bundle 'ctrlp.vim'                  
"Bundle 'genutils'
"Bundle 'lookupfile'
"Bundle 'easygrep'
"用于括号与引号自动补全，不过会与函数原型提示插件echofunc冲突,所以我就没有加入echofunc插件
"Bundle 'jiangmiao/auto-pairs'       
"用于对指定文件自动生成tags与cscope文件并连接
"Bundle 'ccvext.vim'                 
"高亮括号与运算符等
"Bundle 'cSyntaxAfter'               
""HTML/CSS代码快速编写神器，
"Bundle 'mattn/emmet-vim'           
"用于显示对齐线，与 indent_guides 在显示方式上不同，根据自己喜好选择了
"Bundle 'Yggdroot/indentLine'        
""java 补全插件
"Bundle 'vim-javacompleteex'        
"给不同的单词高亮，表明不同的变量时很有用
"Bundle 'Mark--Karkat'               
"关键字补全、文件路径补全、tag补全等等，各种，非常好用，速度超快。
"Bundle 'Shougo/neocomplcache.vim'   
"主要用于C/C++代码注释(其它的也行)
"Bundle 'scrooloose/nerdcommenter'   
"用于C/C++代码补全，这种补全主要针对命名空间、类、结构、共同体等进行补全
"Bundle 'OmniCppComplete'            
"增强源代码浏览，其功能就像Windows中的Source Insight
"Bundle 'wesleyche/SrcExpl'          
"用于增强C语法高亮
"Bundle 'std_c.zip'                  
"快速给单词/句子两边增加符号
"Bundle 'tpope/vim-surround'         
"用于保存文件时查检语法
"Bundle 'scrooloose/syntastic'       
"用于文本文件生成标签与与语法高亮
"Bundle 'TxtBrowser'                 
"用于分割窗口的最大化与还原
"Bundle 'ZoomWin'                    


" Bundle 'git://git.wincent.com/command-t.git'

"Brief help
":BundleList			-list configured bundles
":BundleInstall(!) 		-install(update) bundles
":BundleSearch(!) foo 	-search(or refresh cache first) for foo
":BundleClear(!)		-confirm(or auto-approve) removal of unused bundles
"vundle主要就上面4个命令，
"例如BundleInstall是全部重装安装，
"BundleInstall!则是更新
"安装完之后，在vimrc中，添加Bundle"'XXX',使得bundle能够加载这个插件，
"同时如果需要配置这个插件，也是在vimrc中设置即可
"set :h vundle for more details or wiki for FAQ

filetype plugin indent on     " required!



" -----------------------------------------------------------------------------
" < 文件编码 >
" -----------------------------------------------------------------------------
set encoding=utf-8  		"设置gvim内部编码，默认不更改
set fileencoding=utf-8 		"设置当前文件编码，可以更改, 如:gbk(同cp936)
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1 	"设置支持打开的文件的编码
set fileformat=unix "设置新（当前）文件的<EOL>格式，可以更改，如:doc(windows系统常用)
"set fileformats=unix,doc,mac	"给出文件的<EOL>格式类型

"解决菜单乱码
if (g:iswingows && g:isGUI)
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim
	language messages zh_CN.utf-8
endif


" -----------------------------------------------------------------------------
"  < 编写文件时的配置 >
" -----------------------------------------------------------------------------
filetype on                                           "启用文件类型侦测
filetype plugin on                                    "针对不同的文件类型加载对应的插件
filetype plugin indent on                             "启用缩进
set smartindent                                       "启用智能对齐方式
set expandtab                                         "将Tab键转换为空格
set tabstop=4                                         "设置Tab键的宽度，可以更改，如：宽度为2
set shiftwidth=4                                      "换行时自动缩进宽度，可更改（宽度同tabstop）
set smarttab                                          "指定按一次backspace就删除shiftwidth宽度
let mapleader = ";"
"set foldlevel=100                                     "默认不折叠
set nofoldenable                                        "启用折叠
set foldmethod=syntax                                "indent 折叠方式
set foldcolumn=1
"set foldmethod=marker                                   "marker 折叠方式
" 常规模式下用空格键来开关光标行所在折叠（注：zR 展开所有折叠，zM 关闭所有折叠）
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
" 当文件在外部被修改，自动更新该文件
set autoread
" 常规模式下输入 cS 清除行尾空格
nmap cS :%s/\s\+$//g<CR>:noh<CR>
" 常规模式下输入 cM 清除行尾 ^M 符号
nmap cM :%s/\r$//g<CR>:noh<CR>
set ignorecase                                        "搜索模式里忽略大小写
set smartcase                                         "如果搜索模式包含大写字符，不使用 'ignorecase' 选项，只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用
" set noincsearch                                       "在输入要搜索的文字时，取消实时匹配
" Ctrl + K 插入模式下光标向上移动
"imap <c-k> <Up>
" Ctrl + J 插入模式下光标向下移动
"imap <c-j> <Down>
" Ctrl + H 插入模式下光标向左移动
"imap <c-h> <Left>
" Ctrl + L 插入模式下光标向右移动
"imap <c-l> <Right>
" 启用每行超过80列的字符提示（字体变蓝并加下划线），不启用就注释掉
"au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)
set backspace=indent,eol,start      "退格键

" -----------------------------------------------------------------------------
"  < 界面配置 >
" -----------------------------------------------------------------------------
set number                                            "显示行号
set laststatus=2                                      "启用状态栏信息
set cmdheight=2                                       "设置命令行的高度为2，默认为1
set cursorline                                        "突出显示当前行
"set guifont=YaHei_Consolas_Hybrid:h10                "设置字体:字号（字体名称空格用下划线代替）
"set nowrap                                            "设置不自动换行
set shortmess=atI                                     "去掉欢迎界面
set novisualbell                                        " 不要闪烁 
" 设置 gVim 窗口初始位置及大小
if g:isGUI
    " au GUIEnter * simalt ~x                           "窗口启动时自动最大化
    winpos 100 10                                     "指定窗口出现的位置，坐标原点在屏幕左上角
    set lines=38 columns=120                          "指定窗口大小，lines为高度，columns为宽度
endif
" 设置代码配色方案
if g:isGUI
    colorscheme Tomorrow-Night-Eighties               
else
    "colorscheme Tomorrow-Night-Bright               
    colorscheme default
endif
" 显示/隐藏菜单栏、工具栏、滚动条，可用 Ctrl + F11 切换
if g:isGUI
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    nmap <silent> <c-F11> :if &guioptions =~# 'm' <Bar>
        \set guioptions-=m <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=r <Bar>
        \set guioptions-=L <Bar>
    \else <Bar>
        \set guioptions+=m <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=r <Bar>
        \set guioptions+=L <Bar>
    \endif<CR>
endif




" =============================================================================
"                          << 常用插件配置 >>
" =============================================================================



" -----------------------------------------------------------------------------
"  < a.vim 插件配置 >  用于切换C/C++头文件
" -----------------------------------------------------------------------------
" :A     ---切换头文件并独占整个窗口
" :AV    ---切换头文件并垂直分割窗口
" :AS    ---切换头文件并水平分割窗口
" :close 
" :only



" -----------------------------------------------------------------------------
"  < Align 插件配置 > 一个对齐的插件，用来——排版与对齐代码，功能强大，不过用到的机会不多
" -----------------------------------------------------------------------------



" -----------------------------------------------------------------------------
"  < auto-pairs 插件配置 > 用于括号与引号自动补全，不过会与函数原型提示插件echofunc冲突,所以我就没有加入echofunc插件
" -----------------------------------------------------------------------------




" -----------------------------------------------------------------------------
"  < BufExplorer 插件配置 > 快速轻松的在缓存中切换（相当于另一种多个文件间的切换方式）
" -----------------------------------------------------------------------------
" <Leader>be 在当前窗口显示缓存列表并打开选定文件
" <Leader>bs 水平分割窗口显示缓存列表，并在缓存列表窗口中打开选定文件
" <Leader>bv 垂直分割窗口显示缓存列表，并在缓存列表窗口中打开选定文件


" -----------------------------------------------------------------------------
"  < ccvext.vim 插件配置 > 用于对指定文件自动生成tags与cscope文件并连接
" -----------------------------------------------------------------------------
" 如果是Windows系统, 则生成的文件在源文件所在盘符根目录的.symbs目录下(如: X:\.symbs\)
" 如果是Linux系统, 则生成的文件在~/.symbs/目录下
" 具体用法可参考www.vim.org中此插件的说明
" <Leader>sy 自动生成tags与cscope文件并连接
" <Leader>sc 连接已存在的tags与cscope文件



" -----------------------------------------------------------------------------
"  < cSyntaxAfter 插件配置 > 高亮括号与运算符等
" -----------------------------------------------------------------------------
"au! BufRead,BufNewFile,BufEnter *.{c,cpp,h,java,javascript} call CSyntaxAfter()


" -----------------------------------------------------------------------------
"  < easygrep >
" -----------------------------------------------------------------------------
"let Grep_Path = '/bin/grep' 
"EasyGrep uses Vim's leader key, which is by default '\'.  For information on this key, type ":help mapleader".
"<Leader>vv  - Grep for the word under the cursor, match all occurences, like 'g*'.  See ":help gstar".
"<Leader>vV  - Grep for the word under the cursor, match whole word, like '*'.  See ":help star".
"<Leader>va  - Like vv, but add to existing list.
"<Leader>vA  - Like vV, but add to existing list.
"<Leader>vr  - Perform a global search on the word under the cursor and prompt for a pattern with which to replace it.
"<Leader>vR  - Like vr, but match whole word.
"<Leader>vo 打开设置，可以对EasyGrep进行一些设置。
"<Leader>vo  - Open an options explorer to select the files to search in and set grep options.
"let g:EasyGrepCommand = 1
"let g:EasyGrepFilesToExclude = "*.d,tags,*.o,*.bak,*~,cscope.*,*.a,*.o,*.pyc,*.bak,*.svn-base,*.swp"
"let g:EasyGrepJumpToMatch = 0
"let g:EasyGrepInvertWholeWord = 1
"nnoremap<Leader>q :Grep<CR>



" -----------------------------------------------------------------------------
"  < ctrlp.vim 插件配置 > 一个全路径模糊文件，缓冲区，最近最多使用，... 检索插件；详细帮助见 :h ctrlp
" -----------------------------------------------------------------------------
" 常规模式下输入：Ctrl + p 调用插件
let g:ctrlp_max_files = 0
let g:ctrlp_regexp = 0
let g:ctrlp_working_path_mode = '0' 
let g:ctrlp_by_filename = 1
let g:ctrlp_open_multiple_files = 'v'
let g:ctrlp_user_command = 'find %s -type f'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe " Windows
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(o|d|exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }




" -----------------------------------------------------------------------------
"  < emmet-vim（前身为Zen coding） 插件配置 > HTML/CSS代码快速编写神器，详细帮助见 :h emmet.txt
" -----------------------------------------------------------------------------




" -----------------------------------------------------------------------------
"  < indentLine 插件配置 > 用于显示对齐线，与 indent_guides 在显示方式上不同，根据自己喜好选择了
" -----------------------------------------------------------------------------
" 在终端上会有屏幕刷新的问题，这个问题能解决有更好了
" 开启/关闭对齐线
"nmap <leader>il :IndentLinesToggle<CR>
" 设置Gvim的对齐线样式
"if g:isGUI
"    let g:indentLine_char = "┊"
"    let g:indentLine_first_char = "┊"
"endif
" 设置终端对齐线颜色，如果不喜欢可以将其注释掉采用默认颜色
"let g:indentLine_color_term = 239
" 设置 GUI 对齐线颜色，如果不喜欢可以将其注释掉采用默认颜色
" let g:indentLine_color_gui = '#A4E57E'




" -----------------------------------------------------------------------------
"  < vim-javacompleteex（也就是 javacomplete 增强版）插件配置 > java 补全插件
" -----------------------------------------------------------------------------





" -----------------------------------------------------------------------------
"  < Mark--Karkat（也就是 Mark） 插件配置 > 给不同的单词高亮，表明不同的变量时很有用，详细帮助见 :h mark.txt
" -----------------------------------------------------------------------------




" " -----------------------------------------------------------------------------
" "  < MiniBufExplorer 插件配置 >  快速浏览和操作Buffer,主要用于同时打开多个文件并相与切换
" " -----------------------------------------------------------------------------
" let g:miniBufExplMapWindowNavArrows = 1     "用Ctrl加方向键切换到上下左右的窗口中去
" let g:miniBufExplMapWindowNavVim = 1        "用<C-k,j,h,l>切换到上下左右的窗口中去
" let g:miniBufExplMapCTabSwitchBufs = 1      "功能增强（不过好像只有在Windows中才有用）
"  <C-Tab> 向前循环切换到每个buffer上,并在但前窗口打开
"  <C-S-Tab> 向后循环切换到每个buffer上,并在当前窗口打开
" 在不使用 MiniBufExplorer 插件时也可用<C-k,j,h,l>切换到上下左右的窗口中去
"noremap <c-k> <c-w>k
"noremap <c-j> <c-w>j
"noremap <c-h> <c-w>h
"noremap <c-l> <c-w>l




" -----------------------------------------------------------------------------
"  < neocomplcache 插件配置 >  关键字补全、文件路径补全、tag补全等等，各种，非常好用，速度超快。
" -----------------------------------------------------------------------------
"let g:neocomplcache_enable_at_startup = 1     "vim 启动时启用插件
" let g:neocomplcache_disable_auto_complete = 1 "不自动弹出补全列表
" 在弹出补全列表后用 <c-p> 或 <c-n> 进行上下选择效果比较好




" -----------------------------------------------------------------------------
"  < nerdcommenter 插件配置 > 主要用于C/C++代码注释(其它的也行)
" -----------------------------------------------------------------------------
" 以下为插件默认快捷键，其中的说明是以C/C++为例的，其它语言类似
" <Leader>ci 以每行一个 /* */ 注释选中行(选中区域所在行)，再输入则取消注释
" <Leader>cm 以一个 /* */ 注释选中行(选中区域所在行)，再输入则称重复注释
" <Leader>cc 以每行一个 /* */ 注释选中行或区域，再输入则称重复注释
" <Leader>cu 取消选中区域(行)的注释，选中区域(行)内至少有一个 /* */
" <Leader>ca 在/*...*/与//这两种注释方式中切换（其它语言可能不一样了）
" <Leader>cA 行尾注释
"let NERDSpaceDelims = 1                     "在左注释符之后，右注释符之前留有空格




" -----------------------------------------------------------------------------
"  < nerdtree 插件配置 > 有目录村结构的文件浏览插件
" -----------------------------------------------------------------------------
" 常规模式下输入 F7 调用插件
nmap <leader>tt :NERDTreeToggle<CR>
let NERDTreeWinSize=30
let NERDTreeIgnore=['\.d$', '\.o$', '\.vim$', '\~$', '\.meta$', '\.unity$', '\.prefab$'] 



" -----------------------------------------------------------------------------
"  < omnicppcomplete 插件配置 > 用于C/C++代码补全，这种补全主要针对命名空间、类、结构、共同体等进行补全
" -----------------------------------------------------------------------------
" 使用前先执行如下 ctags 命令（本配置中可以直接使用 ccvext 插件来执行以下命令）
" ctags -R --c++-kinds=+p --fields=+iaS --extra=+q
" 我使用上面的参数生成标签后，对函数使用跳转时会出现多个选择
" 所以我就将--c++-kinds=+p参数给去掉了，如果大侠有什么其它解决方法希望不要保留呀
"set completeopt=menu                        "关闭预览窗口



" -----------------------------------------------------------------------------
"  < powerline 插件配置 > 状态栏插件，更好的状态栏效果
" -----------------------------------------------------------------------------
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set t_Co=256
let g:Powerline_symbols = 'fancy'
let g:Powerline_stl_path_style = 'full'




" -----------------------------------------------------------------------------
"  < repeat 插件配置 > 主要用"."命令来重复上次插件使用的命令
" -----------------------------------------------------------------------------




" -----------------------------------------------------------------------------
"  < snipMate 插件配置 >  用于各种代码补全，这种补全是一种对代码中的词与代码块的缩写补全
" -----------------------------------------------------------------------------
"不过有时候也会与 supertab 插件在补全时产生冲突，如果大侠有什么其它解决方法希望不要保留呀




" -----------------------------------------------------------------------------
"  < SrcExpl 插件配置 > 增强源代码浏览，其功能就像Windows中的"Source Insight"
" -----------------------------------------------------------------------------
"nmap <F8> :SrcExplToggle<CR>                "打开/闭浏览窗口
"let g:SrcExpl_jumpKey = "<ENTER>" 
"let g:SrcExpl_gobackKey = "<SPACE>"
"let g:SrcExpl_prevDefKey = "<F3>" 
"let g:SrcExpl_nextDefKey = "<F4>" 



" -----------------------------------------------------------------------------
"  < std_c 插件配置 > 用于增强C语法高亮
" -----------------------------------------------------------------------------
" 启用 // 注视风格
" let c_cpp_comments = 0



" -----------------------------------------------------------------------------
"  < surround 插件配置 > 快速给单词/句子两边增加符号（包括html标签），缺点是不能用"."来重复命令
" -----------------------------------------------------------------------------
" 不过 repeat 插件可以解决这个问题，详细帮助见 :h surround.txt



" -----------------------------------------------------------------------------
"  < Syntastic 插件配置 > 用于保存文件时查检语法
" -----------------------------------------------------------------------------





" -----------------------------------------------------------------------------
"  < Tagbar 插件配置 > 相对 TagList 能更好的支持面向对象
" -----------------------------------------------------------------------------
" 常规模式下输入 tb 调用插件，如果有打开 TagList 窗口则先将其关闭
nmap <leader>tb :TlistClose<CR>:TagbarToggle<CR>
let g:tagbar_width=30                       "设置窗口宽度
let g:tagbar_left=0                         "在左侧窗口中显示
let g:tagbar_ctags_bin='/usr/bin/ctags'



" -----------------------------------------------------------------------------
"  < TagList 插件配置 > 高效地浏览源码, 其功能就像vc中的workpace
" -----------------------------------------------------------------------------
" 那里面列出了当前文件中的所有宏,全局变量, 函数名等
" 常规模式下输入 tl 调用插件，如果有打开 Tagbar 窗口则先将其关闭
" nmap tl :TagbarClose<CR>:Tlist<CR>
" let Tlist_Show_One_File=1                   "只显示当前文件的tags
" let Tlist_Enable_Fold_Column=0              "使taglist插件不显示左边的折叠行
" let Tlist_Exit_OnlyWindow=1                 "如果Taglist窗口是最后一个窗口则退出Vim
" let Tlist_File_Fold_Auto_Close=1            "自动折叠
" let Tlist_WinWidth=30                       "设置窗口宽度
" let Tlist_Use_Right_Window=1                "在右侧窗口中显示
" let Tlist_Use_Left_Window=1                "在zuo侧窗口中显示



" -----------------------------------------------------------------------------
"  < txtbrowser 插件配置 > 用于文本文件生成标签与与语法高亮（调用TagList插件生成标签，如果可以）
" -----------------------------------------------------------------------------
"au BufRead,BufNewFile *.txt setlocal ft=txt



" -----------------------------------------------------------------------------
"  < ZoomWin 插件配置 > 用于分割窗口的最大化与还原
" -----------------------------------------------------------------------------
" 常规模式下按快捷键 <c-w>o 在最大化与还原间切换



" -----------------------------------------------------------------------------
"  < cscope 工具配置 >
" -----------------------------------------------------------------------------
" 用Cscope自己的话说 - "你可以把它当做是超过频的ctags"
"if has("cscope")
    "设定可以使用 quickfix 窗口来查看 cscope 结果
"    set cscopequickfix=s-,c-,d-,i-,t-,e-
    "使支持用 Ctrl+]  和 Ctrl+t 快捷键在代码间跳转
"    set cscopetag
    "如果你想反向搜索顺序设置为1
"    set csto=0
    "在当前目录中添加任何数据库
"    if filereadable("cscope.out")
"        cs add cscope.out
    "否则添加数据库环境中所指出的
"    elseif $CSCOPE_DB != ""
"        cs add $CSCOPE_DB
"    endif
"    set cscopeverbose
    "快捷键设置
"    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"endif





" -----------------------------------------------------------------------------
"  < ctags 工具配置 >
" -----------------------------------------------------------------------------
" 对浏览代码非常的方便,可以在函数,变量之间跳转等
set tags=tags;   "向上级目录递归查找tags文件（好像只有在Windows下才有用）




" -----------------------------------------------------------------------------
"  < vimtweak 工具配置 > 请确保以已装了工具, 这里只用于窗口透明与置顶
" -----------------------------------------------------------------------------
" 常规模式下 Ctrl + Up（上方向键） 增加不透明度，Ctrl + Down（下方向键） 减少不透明度，<Leader>t 窗口置顶与否切换
if (g:iswingows && g:isGUI)
    let g:Current_Alpha = 255
    let g:Top_Most = 0
    func! Alpha_add()
        let g:Current_Alpha = g:Current_Alpha + 10
        if g:Current_Alpha > 255
            let g:Current_Alpha = 255
        endif
        call libcallnr("vimtweak.dll","SetAlpha",g:Current_Alpha)
    endfunc
    func! Alpha_sub()
        let g:Current_Alpha = g:Current_Alpha - 10
        if g:Current_Alpha < 155
            let g:Current_Alpha = 155
        endif
        call libcallnr("vimtweak.dll","SetAlpha",g:Current_Alpha)
    endfunc

    func! Top_window()
        if  g:Top_Most == 0
            call libcallnr("vimtweak.dll","EnableTopMost",1)
            let g:Top_Most = 1
        else
            call libcallnr("vimtweak.dll","EnableTopMost",0)
            let g:Top_Most = 0
        endif
    endfunc
    "快捷键设置
    nmap <c-up> :call Alpha_add()<CR>
    nmap <c-down> :call Alpha_sub()<CR>
    nmap <leader>t :call Top_window()<CR>
endif



" =============================================================================
"                          << 以下为常用自动命令配置 >>
" =============================================================================
" 自动切换目录为当前编辑文件所在目录
"au BufRead,BufNewFile,BufEnter * cd %:p:h




" =============================================================================
"                     << windows 下解决 Quickfix 乱码问题 >>
" =============================================================================
" windows 默认编码为 cp936，而 Gvim(Vim) 内部编码为 utf-8，所以常常输出为乱码
" 以下代码可以将编码为 cp936 的输出信息转换为 utf-8 编码，以解决输出乱码问题
" 但好像只对输出信息全部为中文才有满意的效果，如果输出信息是中英混合的，那可能
" 不成功，会造成其中一种语言乱码，输出信息全部为英文的好像不会乱码
" 如果输出信息为乱码的可以试一下下面的代码，如果不行就还是给它注释掉

" if g:iswindows
"     function QfMakeConv()
"         let qflist = getqflist()
"         for i in qflist
"            let i.text = iconv(i.text, "cp936", "utf-8")
"         endfor
"         call setqflist(qflist)
"      endfunction

"      au QuickfixCmdPost make call QfMakeConv()
" endif




" =============================================================================
"                          << 其它 >>
" =============================================================================
" 注：上面配置中的"<Leader>"在本软件中设置为"\"键（引号里的反斜杠），如<Leader>t
" 指在常规模式下按"\"键加"t"键，这里不是同时按，而是先按"\"键后按"t"键，间隔在一
" 秒内，而<Leader>cs是先按"\"键再按"c"又再按"s"键；如要修改"<leader>"键，可以把
" 下面的设置取消注释，并修改双引号中的键为你想要的，如修改为逗号键。
" 上面已定义了!!!!!!!
"let mapleader = ";"

" -----------------------------------------------------------------------------
" < 文件类型编码 >
" -----------------------------------------------------------------------------
au BufNewFile,BufRead *.lua,*.txt set filetype=lua   





" ===================================================================================
"                       快捷键
" ===================================================================================
"# 命令录制 (最佳技巧，ft)
"qq     #录制到q
"       #输入一系列复杂的指令
"q      #再次按q停止录制
"@q     #执行q中存储的指令
"@@     #重复执行
"# 编辑register/录制
"ap     #把register a中的内容贴到当前位置
"       #现在你可以修改它了
"add    #删除之，重新存入register a
"@a     #执行register a中的指令




