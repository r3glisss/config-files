syntax on

" To install vim plug 
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Then launch vim and tape PlugInstall
" - Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'rhysd/vim-clang-format' 
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'oblitum/youcompleteme'

call plug#end()
	
set tabstop=2     " visual spaces for TAB character
set softtabstop=2 " number of spaces in tab for editing
set expandtab     " insert spaces instead of TAB character
set shiftwidth=2  " number of spaces to introduce on return for control structures, functions, etc

set mouse=""
set background=dark
set paste
set number
set showcmd
set ignorecase

" Always show statusline
set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&encoding},                " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=0x%-8B\                      " current char
set statusline+=%-10.(%l,%c%V%)\ %<%P        " offset

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" Powerline
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" C synthax
let g:ycm_global_ycm_extra_conf="~/.vim/.ycm_extra_conf.py"

" Command Alias
command Hexedit %!xxd
command HexeditRevert %!xxd -r
