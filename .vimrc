" Vundle
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" " required! 
Bundle 'gmarik/vundle'
Bundle 'EasyMotion'
Bundle 'git://github.com/jcf/vim-latex.git'
Bundle 'git://github.com/xuhdev/vim-latex-live-preview.git'
Bundle 'git://github.com/majutsushi/tagbar.git'
Bundle 'git://github.com/kien/ctrlp.vim.git'
Bundle 'git://github.com/Valloric/YouCompleteMe.git'
Bundle 'git://github.com/scrooloose/syntastic.git'

" CtrlP
let g:ctrlp_cmd = 'CtrlPMixed'
set wildignore+=*/doc/*,*.o

" Syntastic
let g:syntastic_cpp_include_dirs = ['include', '../include']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
"let g:syntastic_auto_loc_list=1

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0


" Keybindings
map <C-S-z> :NERDTreeToggle<CR>
map <C-S-x> :Tagbar<CR>

" Settings
colorscheme kolor
set guioptions-=T
set guifont=Monospace\ 10
"set background=dark
set clipboard=unnamed
set shiftwidth=2
set tabstop=2
set smartindent
set expandtab
set wildmenu
set backspace=indent,eol,start
set ruler
set number
set undofile
set statusline=
syntax on
filetype plugin indent on
