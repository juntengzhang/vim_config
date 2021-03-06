""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   User-definded setting                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:g_author = "zhangjunteng"
let g:g_email = "deepvoice@163.com"
let g:g_copyright = "Inc. All Rights Reserved"
let g:g_description = ""
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      Plugin Install                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"The following are examples of different formats supported.
"Keep Plugin commands between vundle#begin/end.
Plugin 'itchyny/lightline.vim'
Plugin 'flazz/vim-colorschemes'

Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/bufexplorer.zip'

Plugin 'tpope/vim-commentary'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'Shougo/neocomplete.vim'

"All of your Plugins must be added before the following line

call vundle#end()            " required
filetype plugin indent on    " required
"To ignore plugin indent changes, instead use:
"filetype plugin on
"
"Brief help
":PluginList       - lists configured plugins
":PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
":PluginSearch foo - searches for foo; append `!` to refresh local cache
":PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
"see :h vundle for more details or wiki for FAQ
"Put your non-Plugin stuff after this line
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      Plugins Config                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noshowmode
try
    let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ }
catch
endtry
"
" => nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F1> :NERDTreeToggle<CR>
"圣诞节显示风格
let NERDChristmasTree=1
"指定鼠标模式（1.双击打开；2.单目录双文件；3.单击打开）
let NERDTreeMouseMode=2
"是否显示书签列表
let NERDTreeShowBookmarks=0
"设置显示忽略文件
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$', '__pycache__']
"设置NERDTree子窗口宽度
let NERDTreeWinSize=32
"设置NERDTree子窗口位置
let NERDTreeWinPos="left"
"显示隐藏文件
let NERDTreeShowHidden=1
"NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
"删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
"
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"
" => tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置显示／隐藏标签列表子窗口的快捷键。
nnoremap <F2> :TagbarToggle<CR>
"设置 tagbar 子窗口的位置出现在主编辑区的右边
let tagbar_right=1
"设置标签子窗口的宽度
let tagbar_width=32
"tagbar 子窗口中不显示冗余帮助信息
let g:tagbar_compact=1
"设置ctags快捷键，快速生成ctags文件，记得在根目录下调用
nmap cg :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
"自动找到父路径的tags文件
set tags=tags;/
"
" => Ack
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
"
cnoreabbrev Ack Ack!
"
" => bufExplorer plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>o :BufExplorer<cr>
"
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
"
" => vim-commentary
"Comment stuff out. Use gcc to comment out a line (takes a count), gc to comment out the target of a motion. gcu uncomments a set of adjacent commented lines.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python,shell,coffee set commentstring=#\ %s
autocmd FileType java,c,cpp set commentstring=//\ %s
"
" => neocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Disable AutoComplPop.
let g:acp_enableAtStartup = 0
"Use neocomplete.
let g:neocomplete#enable_at_startup = 1
"Use smartcase.
let g:neocomplete#enable_smart_case = 1
"Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
"
"Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
"
"Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
"
"Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
"
"Recommended key-mappings.
"<CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  "For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
"<TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"<C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
"
"AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1
"
"Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
"
"Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"
"Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"
"For perlomni.vim setting.
"https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          basic cfg                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Sets how many lines of history VIM has to remember
set history=500
"Set to auto read when a file is changed from the outside
set autoread
"
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set 7 lines to the cursor - when moving vertically using j/k
set so=7
"
"Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"
"Turn on the Wild menu
set wildmenu
"
"Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif
"
"Always show current position
set ruler
"
"Height of the command bar
set cmdheight=2
"
"A buffer becomes hidden when it is abandoned
set hid
"
"Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
"
"Ignore case when searching
"set ignorecase
"
"When searching try to be smart about cases 
set smartcase
"
"Highlight search results
set hlsearch
"
"Makes search act like search in modern browsers
set incsearch 
"
"Don't redraw while executing macros (good performance config)
set lazyredraw 
"
"For regular expressions turn magic on
set magic
"
"Show matching brackets when text indicator is over them
set showmatch 
"How many tenths of a second to blink when matching brackets
set mat=2
"
"No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
"
"Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif
"
"Add a bit extra margin to the left
set foldcolumn=1
"
"Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
"
"显示行号
set number
"
"高亮显示当前行
"set cursorline
"
"高亮显示当前列
"set cursorcolumn
"
"禁止折行
"set nowrap
"
"可以在buffer的任何地方使用鼠标
set mouse=a
"
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable syntax highlighting
syntax enable 
set background=dark
"
" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
"
"Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif
"
let g:solarized_termcolors=256
"
try
    colorscheme desert
    colorscheme peaksea
catch
endtry
"
"Set utf8 as standard encoding and en_US as the standard language
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,gb18030,gbk,gb2312
set fileencoding=utf-8
"
" Use Unix as the standard file type
set ffs=unix,dos,mac
"
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Turn backup off, since most stuff is in SVN, git et.c anyway...
"set nobackup
"set nowb
"set noswapfile
"
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Use spaces instead of tabs
set expandtab

"Be smart when using tabs ;)
set smarttab
"
"1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
"
"Linebreak on 500 characters
set lbr
set tw=500
"
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
"
" => Visual mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Visual mode pressing * or # searches for the current selection
"Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
"
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
"map <space> /
"map <c-space> ?
"
"Disable highlight when <leader><cr> is pressed
"map <silent> <leader><cr> :noh<cr>
"
"Smart way to move between windows
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l
"
"Close the current buffer
"map <leader>bd :Bclose<cr>:tabclose<cr>gT
"
"Close all the buffers
"map <leader>ba :bufdo bd<cr>
"
"map <leader>l :bnext<cr>
"map <leader>h :bprevious<cr>
"
"Useful mappings for managing tabs
"map <leader>tn :tabnew<cr>
"map <leader>to :tabonly<cr>
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove 
map <leader>l :tabn<cr> 
"
"Let 'tl' toggle between this and the last accessed tab
"let g:lasttab = 1
"nmap <leader>tl :exe "tabn ".g:lasttab<CR>
"au TabLeave * let g:lasttab = tabpagenr()
"
"Opens a new tab with the current buffer's path
"Super useful when editing files in the same directory
"map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
"
"Switch CWD to the directory of the open buffer
"map <leader>cd :cd %:p:h<cr>:pwd<cr>
"
"Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry
"
"Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Always show the status line
set laststatus=2
"
"Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
"
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remap VIM 0 to first non-blank character
map 0 ^
"
"Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
"
if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif
"
"Delete trailing white space on save, useful for some filetypes 
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
"
if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif
"
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
"map <leader>ss :setlocal spell!<cr>
"
"Shortcuts using <leader>
"map <leader>sn ]s
"map <leader>sp [s
"map <leader>sa zg
"map <leader>s? z=
"
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
"
"Quickly open a buffer for scribble
"map <leader>q :e ~/buffer<cr>
"
"Quickly open a markdown buffer for scribble
"map <leader>x :e ~/buffer.md<cr>
"
"Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction
"
"Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         extended                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" => GUI related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set font according to system
if has("mac") || has("macunix")
    set gfn=IBM\ Plex\ Mono:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
    set gfn=IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("gui_gtk2")
    set gfn=IBM\ Plex\ Mono:h14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("linux")
    set gfn=IBM\ Plex\ Mono:h14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("unix")
    set gfn=Monospace\ 11
endif
"
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <leader>e :e! ~/.vim_runtime/my_configs.vim<cr>
"autocmd! bufwritepost ~/.vim_runtime/my_configs.vim source ~/.vim_runtime/my_configs.vim
"
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"try
"    set undodir=~/.vim_runtime/temp_dirs/undodir
"    set undofile
"catch
"endtry
"
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Smart mappings on the command line
"cno $h e ~/
"cno $d e ~/Desktop/
"cno $j e ./
"cno $c e <C-\>eCurrentFileDir("e")<cr>

"$q is super useful when browsing on the command line
"it deletes everything until the last slash
"cno $q <C-\>eDeleteTillSlash()<cr>
"
"Bash like keys for the command line
"cnoremap <C-A>		<Home>
"cnoremap <C-E>		<End>
"cnoremap <C-K>		<C-U>
"
"cnoremap <C-P> <Up>
"cnoremap <C-N> <Down>
"
" Map ½ to something useful
"map ½ $
"cmap ½ $
"imap ½ $
"
" => Parenthesis/bracket
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>
"
"Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
"
" => General abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
"
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func! DeleteTillSlash()
    let g:cmd = getcmdline()

    if has("win16") || has("win32")
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
    else
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
    endif

    if g:cmd == g:cmd_edited
        if has("win16") || has("win32")
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
        else
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
        endif
    endif

    return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            filetypes                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" => Python section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self
"
au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako
"
au FileType python map <buffer> F :set foldmethod=indent<cr>
"
au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f # --- <esc>a
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def
au FileType python set cindent
au FileType python set cinkeys-=0#
au FileType python set indentkeys-=0#
"
" => JavaScript section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent
"
au FileType javascript imap <c-t> $log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi
"
au FileType javascript inoremap <buffer> $r return
au FileType javascript inoremap <buffer> $f // --- PH<esc>FP2xi
"
function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction
"
" => CoffeeScript section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CoffeeScriptFold()
    setl foldmethod=indent
    setl foldlevelstart=1
endfunction
au FileType coffee call CoffeeScriptFold()
"
au FileType gitcommit call setpos('.', [0, 1, 1, 0])
"
" => Shell section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('$TMUX')
    if has('nvim')
        set termguicolors
    else
        set term=screen-256color
    endif
endif
"
" => Twig section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufRead *.twig set syntax=html filetype=html
"
"""""""""""""""""""""""" New file title """""""""""""""""""""
"新建.c,.h,.sh,.java,.py文件，自动插入文件头
"这里需注意，python文件拓展名为：.py，获取的文件类型为python
autocmd BufNewFile Makefile,*.py,*.cpp,*.[ch],*.sh,*.java,*.rb,*.pl exec ":call SetTitle()"
"新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G
"定义函数SetTitle，自动插入文件头
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
