" -----------------------------------------------------------------------------
" Plugins
" ----------------------------------------------------------------------------- 
" To install vim plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Then launch vim and tape PlugInstall
" - Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
Plug 'rhysd/vim-clang-format' 
Plug 'scrooloose/nerdtree',
Plug 'vim-scripts/AutoComplPop',
Plug 'jiangmiao/auto-pairs',
Plug 'junegunn/fzf'
call plug#end()

" Enable syntax highlighting	
syntax on

" Project syntax
set tags=./.tags;/

" -----------------------------------------------------------------------------
" Basic Settings
"   Research any of these by running :help <setting>
" -----------------------------------------------------------------------------
set autoindent
set autoread
set tabstop=2     " visual spaces for TAB character
set softtabstop=2 " number of spaces in tab for editing
set expandtab     " insert spaces instead of TAB character
set shiftwidth=2  " number of spaces to introduce on return for control structures, functions, etc
set mouse=a
set cursorline
set number
set showcmd
set ignorecase
colorscheme elflord 

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
"set t_Co=256
set rtp+=/home/cyrilb/.local/lib/python2.7/site-packages/powerline/bindings/vim

" -----------------------------------------------------------------------------
" Command Alias
" -----------------------------------------------------------------------------
command Hexedit %!xxd
command HexeditRevert %!xxd -r

" -----------------------------------------------------------------------------
" Plugin settings, mappings and autocommands
" -----------------------------------------------------------------------------
" Autocomplete plugin
set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c
let g:acp_enableAtStartup = 1"

" Navigate the complete menu items like CTRL+n / CTRL+p would.
inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"

" Select the complete menu item like CTRL+y would.
" inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"
inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"

" Cancel the complete menu item like CTRL+e would.
inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>"

" Navigation between the tabs
nnoremap <C-Left> :tabprevious<CR>                                                                            
nnoremap <C-Right> :tabnext<CR>

" This open the nerdtree on the right
" let g:NERDTreeWinPos = "right"

" Custom netrw configuration like Nerdtree
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END

" FZF remapping
nnoremap <C-f> :FZF<CR>"


