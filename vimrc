" ***************** 全局设置 ************** "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   User-definded setting                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:g_author = "zhangjunteng"
let g:g_email = "deepvoice@163.com"
let g:g_copyright = "Inc. All Rights Reserved"
" your file description when you create a new file.
let g:g_description = ""

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
set nocompatible "关闭兼容模式
set incsearch "开启实时搜索功能
"set ignorecase "搜索忽略大小写
set wildmenu "vim命令自动补全
set autoread "文件自动更新
set laststatus=2 "总是显示状态栏
set ruler "显示光标位置
set number "显示行号
"set cursorline "高亮显示当前行
"set cursorcolumn "高亮显示当前列
set hlsearch "高亮显示搜索结果
" set nowrap "禁止折行
set backspace=2 "回退键生效
set backspace=indent,eol,start
set novisualbell
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T
 
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" 基于缩进或语法进行代码折叠
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
"设置编码
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,gb18030,gbk,gb2312
set fileencoding=utf-8
"设置paste快捷键
:set pastetoggle=<F12>
" *************** 设置全局快捷键 *****************
 
" 定义快捷键的前缀，即<Leader>
let mapleader=";"
" ************** 插件管理与设置 ************ "
 
" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasr/molokai' "主题
Plugin 'Lokaltog/vim-powerline' "status 美化
Plugin 'octol/vim-cpp-enhanced-highlight' "对c++语法高亮增强
Plugin 'majutsushi/tagbar' "taglist的增强版，查看标签，依赖于ctags
Plugin 'scrooloose/nerdtree' "文件浏览
Plugin 'neocomplcache'  "自动补全
Plugin 'dyng/ctrlsf.vim'   "全局搜索
Plugin 'vim-scripts/Conque-GDB' "gdb
" 插件列表结束
call vundle#end()
" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
"根据文件类型 自动缩进
filetype indent on
"设置主题颜色
set t_Co=256
set background=dark
colorscheme desert
"colorscheme molokai

" Powerline 设置
"" 启用缓存，加快运行速度
let g:Powerline_cache_enabled = 1
"" 设置状态栏分隔符
let g:Powerline_symbols = 'fancy'
"let Powerline_symbols = 'compatible'
let g:Powerline_symbols = 'unicode'
"设置状态栏的主题
let g:Powerline_colorscheme = 'solarized256_dark'
"" 设置状态栏显示文件的绝对路径（全路径）
"let g:Powerline_stl_path_style = 'full'

"""""""""""""""""""""""" New file title """"""""""""""""""""""""
" 新建.c,.h,.sh,.java,.py文件，自动插入文件头
" 这里需注意，python文件拓展名为：.py，获取的文件类型为python
autocmd BufNewFile Makefile,*.py,*.cpp,*.[ch],*.sh,*.java,*.rb,*.pl exec ":call SetTitle()"
" 新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G
" 定义函数SetTitle，自动插入文件头
function! SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."),"\#########################################################################")
        call append(line(".")+1, "\# @File Name:    ".expand("%"))
        call append(line(".")+2, "\# @Author:       ".g:g_author)
        call append(line(".")+3, "\# @Mail:         ".g:g_email)
        call append(line(".")+4, "\# @Created Time: ".strftime("%a, %m/%d/%Y, %X"))
        call append(line(".")+5, "\# @Copyright:    ".g:g_copyright)
        call append(line(".")+6, "\# @Description:  ".g:g_description)
        call append(line(".")+7, "\#########################################################################")
        call append(line(".")+8, "")
    "python的文件后缀系统获取的是python
    elseif &filetype == 'python'
        call setline(1,"\#!/usr/bin/env python")
        call append(line("."),"\# -*- coding: utf-8 -*-")
        call append(line(".")+1,"\"\"\"")
        call append(line(".")+2, "@File Name:    ".expand("%"))
        call append(line(".")+3, "@Author:       ".g:g_author)
        call append(line(".")+4, "@Mail:         ".g:g_email)
        call append(line(".")+5, "@Created Time: ".strftime("%a, %m/%d/%Y, %X"))
        call append(line(".")+6, "@Copyright:    ".g:g_copyright)
        call append(line(".")+7, "@Description:  ".g:g_description)
        call append(line(".")+8, "\"\"\"")
        call append(line(".")+9, "")
    elseif &filetype == 'ruby'
        call setline(1,"\#!/usr/bin/env ruby")
        call setline(2,"\# -*- coding: utf-8 -*-")
        call setline(3, "\# @File: ".expand("%"))
        call setline(4, "\# @Author: ".g:g_author)
        call setline(5, "\# @Mail: ".g:g_email)
        call setline(6, "\# @Created: ".strftime("%a, %m/%d/%Y, %X"))
        call setline(7, "\# @Copyright: ".g:g_copyright)
        call setline(8, "\# @Description: ".g:g_description)
        call setline(9, "")
        call setline(10, "")
    elseif expand("%") == "Makefile"
        call setline(1,"\#########################################################################")
        call append(line("."), "\# @File Name:    ".expand("%"))
        call append(line(".")+1, "\# @Author:     ".g:g_author)
        call append(line(".")+2, "\# @Mail:       ".g:g_email)
        call append(line(".")+3, "\# @Created Time: ".strftime("%a, %m/%d/%Y, %X"))
        call append(line(".")+4, "\# @Copyright:    ".g:g_copyright)
        call append(line(".")+5, "\# @Description:  ".g:g_description)
        call append(line(".")+6, "\#########################################################################")
        call append(line(".")+7, "CC=gcc")
        call append(line(".")+8, "CFLAGS= -Wall -c")
        call append(line(".")+9, "\.PHONY: clean")
        call append(line(".")+10, "")
    else
        call setline(1, "\/*************************************************************************")
        call append(line("."), " * @File Name:    ".expand("%"))
        call append(line(".")+1, " * @Author:       ".g:g_author)
        call append(line(".")+2, " * @Mail:         ".g:g_email)
        call append(line(".")+3, " * @Created Time: ".strftime("%a, %m/%d/%Y, %X"))
        call append(line(".")+4, " * @Copyright:    ".g:g_copyright)
        call append(line(".")+5, " * @Description:  ".g:g_description)
        call append(line(".")+6, " *************************************************************************/")
        call append(line(".")+7, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+7, "#include <iostream>")
        call append(line(".")+8, "using namespace std;")
        call append(line(".")+9, "")
    endif
    if &filetype == 'c'
        call append(line(".")+7, "#include <stdio.h>")
        call append(line(".")+8, "int main()")
        call append(line(".")+9, "{")
        call append(line(".")+10, "     ")
        call append(line(".")+11, "    return 0;")
        call append(line(".")+12, "}")
    endif
    if &filetype == 'java'
        call append(line(".")+8,"public class  ClassName {")
        call append(line(".")+9,"")
        call append(line(".")+10,"")
        call append(line(".")+11,"}")
    endif
    "新建文件后，自动定位到文件末尾
    "exec ":normal G"
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        Plugin Setting                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置tagbar
" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_right=1
" " 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
nnoremap <F2> :TagbarToggle<CR>
" " 设置标签子窗口的宽度
let tagbar_width=28
" " tagbar 子窗口中不显示冗余帮助信息
let g:tagbar_compact=1
"设置 ctags 对哪些代码标识符生成标签
"
"设置ctags快捷键，快速生成ctags文件，记得在根目录下调用
nmap cg :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"自动找到父路径的tags文件
set tags=tags;/
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <F1> :NERDTreeToggle<CR>
" 圣诞节显示风格
let NERDChristmasTree=1
" 指定鼠标模式（1.双击打开；2.单目录双文件；3.单击打开）
let NERDTreeMouseMode=2
" 是否显示书签列表
let NERDTreeShowBookmarks=0
" 设置显示忽略文件
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=28
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 如果没有指定文件，则自动打开NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
" 如果只有NERTree打开，则关闭vim
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
 
"cpp-enhanced-highlight
"高亮类，成员函数，标准库和模板
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1

"neocomplcache
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1

" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1

" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1

" When you input 'ho-a',neocomplcache will select candidate 'a'.
let g:neocomplcache_enable_quick_match = 1
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions',
    \ 'css' : $VIMFILES.'/dict/css.dic',
    \ 'php' : $VIMFILES.'/dict/php.dic',
    \ 'javascript' : $VIMFILES.'/dict/javascript.dic'
    \ }
" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 0
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" 使用 ctrlsf.vim
" 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
" 使用ag作为底层搜索，加快速度
let g:ctrlsf_ackprg = 'ag'
nnoremap <F3> :CtrlSF<CR>
" 显示在窗口底部
let g:ctrlsf_position = 'bottom'
" 显示的上下文行数
let g:ctrlsf_context = '-B 5 -A 3'
" 按回车不会自动关闭窗口
let g:ctrlsf_auto_close = 0
" ctrl+f快速打开搜索
nmap <C-F> <Plug>CtrlSFPrompt

"Conque GDB
nmap <F5> :ConqueGdb<CR>
"待调试文件位于屏幕上方
let g:ConqueGdb_SrcSplit = 'above'
"保存历史
let g:ConqueGdb_SaveHistory = 1
"修改Conque GDB的Leader键
let g:ConqueGdb_Leader = ','
"总是显示颜色
let g:ConqueTerm_Color = 2
"程序结束运行时，关闭Conque GDB窗口
let g:ConqueTerm_CloseOnEnd = 1
"Conque Term配置错误时显示警告信息
let g:ConqueTerm_StartMessages = 0
