" http://vim.wikia.com/wiki/Change_the_color_scheme
" colorscheme morning
" http://vim.wikia.com/wiki/Switch_color_schemes
colorscheme elflord
set mouse=a
set clipboard=unnamed

" 修改backspace的工作模式
set backspace=indent,eol,start

" 字体
set guifont=Monaco:h15
" set guifont=Courier\ New:h15
" set guifont=Lucida_Console:h15

" 设置vim的编码识别序列 http://www.zhihu.com/question/22363620/answer/21199296
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1

" 显示行数
set number
" 显示光标位置, :help ruler
" set ruler

" tab缩进
set expandtab
set tabstop=8
set shiftwidth=4
set softtabstop=4

" 搜索高亮
set hlsearch
" search ignore character case
set ignorecase

" Disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

" 插入状态下paste和nopaste状态的切换
set pastetoggle=<F9>

" 快速切换窗口
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h
map <C-f> <C-w>v

" tab快捷键设置 http://vim.wikia.com/wiki/Alternative_tab_navigation
" tab navigation like firefox
nnoremap <C-t>     :tabnew<CR>

" set auto load file when be edited by other program
" set autoread

" set cmdheight=2

" show status
" set laststatus=2
" http://got-ravings.blogspot.hk/2008/08/vim-pr0n-making-statuslines-that-own.html
" set statusline=%<%F\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

" https://github.com/tpope/vim-pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" https://github.com/scrooloose/nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

autocmd FileType python noremap <buffer> <C-b> :exec '!python' shellescape(@%, 1)<CR>

