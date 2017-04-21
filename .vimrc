"------------------------------------------------------------------------------
" File:     $HOME/.vimrc
" Author:   zsir <zsirkg@yahoo.com>
" Version:  0.1
"
" Based on https://github.com/s3rvac/dotfiles/blob/master/vim/.vimrc
"------------------------------------------------------------------------------

"------------------------------------------------------------------------------
" VundleVim (https://github.com/VundleVim/Vundle.vim).
"-----------------------------------------------------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" plugin on GitHub repo
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/csapprox'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'vim-scripts/peaksea'
Plugin 'tpope/vim-commentary'

" vim-scripts repos

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"------------------------------------------------------------------------------
" General.
"-----------------------------------------------------------------------------

syntax on

set t_Co=256
set magic               " 支持正则表达式等
set hidden              " 允许在未保存的buffer中切换

set number              " 显示行号

set scrolloff=10        " 垂直移动时保持n行固定
set sidescroll=5        " 水平移动时保持n列固定

set tabstop=4           " 制表符等于几个空格
set shiftwidth=4        " 制表符缩进时应用几个空格
set expandtab           " 使用扩展制表符
set autoindent          " Auto indent
set si                  " Smart indent
set smarttab

" set wrap                " 文本回滚
set fencs=utf-8,gb18030 " 打卡文件时优先选择编码格式
set ffs=unix,dos,mac    " 文件结束符
set autoread            " 自动读取文件的修改(其他软件的修改)
set nofoldenable        " 关闭折叠
set clipboard=unnamed   " 复制使用系统剪切板

set hlsearch            " 搜索时高亮
set incsearch           " 搜索输入高亮
set nowrapscan          " 关闭搜索回滚
set ignorecase          " 搜索时忽略大小写
set smartcase           " 搜索中含有大写则搜索大写

set showcmd             " 在状态栏中显示命令
set history=200         " 存储命令历史最大个数

set directory-=.        " swap文件不存储在当前文件夹

set list                " show trailing whitespace
set listchars=tab:▸\ ,trail:▫

" 关闭gvim菜单
set guioptions-=m
set guioptions-=T

" 关闭错误时声音
set noerrorbells
set novisualbell
set t_vb=

" 补全命令设置
set wildmenu
set wildignore+=*.o,*.obj,*.pyc,*.aux,*.bbl,*.blg,.git,.svn,.hg

" 状态栏
set laststatus=2        " 总是显示状态栏

"------------------------------------------------------------------------------
" Background
"-----------------------------------------------------------------------------

" 设置vim的本色方案
syntax enable
set mouse=              " 关闭鼠标使用
set background=dark
colorscheme peaksea

"------------------------------------------------------------------------------
" Map
"-----------------------------------------------------------------------------

let g:mapleader = ","

" 移动支持折行
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" 窗口切换
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" ESC
inoremap jj <Esc>

" tab切换
noremap <silent> <Left> :bp<CR>
noremap <silent> <Right> :bn<CR>
nnoremap <Leader><Leader>b :bp<CR>
nnoremap <Leader><Leader>f :bn<CR>

" 重新加载vimrc配置
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

"------------------------------------------------------------------------------
" Function.
"-----------------------------------------------------------------------------

" 自动跳转到上一次打开的位置
autocmd BufReadPost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \ exe "normal! g'\"" |
            \ endif

"------------------------------------------------------------------------------
" Plugin.
"-----------------------------------------------------------------------------

" Nerdtree
noremap <F7> :NERDTreeToggle<CR>
noremap <silent> <leader>d :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
