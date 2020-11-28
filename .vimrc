syntax on

" To install vim plug 
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Then launch vim and tape PlugInstall
" - Avoid using standard Vim directory names like 'plugin'
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
Plug 'rhysd/vim-clang-format' 
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'oblitum/youcompleteme'
Plug 'vim-scripts/delimitMate.vim'
Plug 'junegunn/fzf'
Plug 'preservim/nerdcommenter'
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

" Command Alias
command Hexedit %!xxd
command HexeditRevert %!xxd -r

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.vim/plugged/youcompleteme/.ycm_extra_conf.py"

" NerdCommenter map leader key is '\'
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '//','right': '' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
