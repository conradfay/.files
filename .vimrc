" Vundle
set nocompatible              " be iMproved
filetype off                  " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" " required! 
Bundle 'gmarik/vundle'
Bundle 'git://github.com/freitass/todo.txt-vim.git'
Bundle 'git://github.com/Lokaltog/vim-easymotion.git'
Bundle 'git://github.com/itchyny/calendar.vim.git'
Bundle 'git://github.com/kien/ctrlp.vim.git'
Bundle 'git://github.com/jcf/vim-latex.git'
Bundle 'git://github.com/xuhdev/vim-latex-live-preview.git'
Bundle 'git://github.com/majutsushi/tagbar.git'
Bundle 'git://github.com/scrooloose/syntastic.git'
Bundle 'git://github.com/scrooloose/nerdtree.git'
Bundle 'git://github.com/Valloric/YouCompleteMe.git'
Bundle 'git://github.com/Raimondi/delimitMate.git'
Bundle 'git://github.com/hynek/vim-python-pep8-indent.git'
Bundle 'git://github.com/zeis/vim-kolor.git'
Bundle 'git://github.com/Lokaltog/vim-powerline.git'
Bundle 'git://github.com/Shougo/unite.vim.git'
Bundle 'git://github.com/Shougo/vimproc.vim'
"Bundle 'git://github.com/klen/python-mode.git'

" Calendar
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" CtrlP
let g:ctrlp_cmd = 'CtrlPMixed'
set wildignore+=*/doc/*,*.o

" Syntastic
let g:syntastic_cpp_include_dirs = ['include', '../include']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%{SyntasticStatuslineFlag()}
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_checker_args='--ignore=E501,E225'
let g:syntastic_enable_signs=1
"let g:syntastic_auto_loc_list=1

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

" NERDTree
map <C-S-z> :NERDTreeToggle<CR>

" Tagbar
map <C-S-x> :Tagbar<CR>

" Powerline
"let g:Powerline_symbols = 'fancy'

" Directories
set dir=~/.vim/tmp/,/var/tmp/,.
set backupdir=~/.vim/tmp/,/var/tmp,.
set undodir=~/.vim/tmp/,/var/tmp,.

" Color
colorscheme kolor

" Allow scroll
set mouse=a
map <ScrollWheelUp> <C-Y> <C-Y> <C-Y>
map <ScrollWheelDown> <C-E> <C-E> <C-E>

" GUI
set guioptions-=T " Remove toolbar
set guioptions-=r " Remove right scrollbar
set guioptions-=L " Remove left scrollbar
set guifont=Terminus\ 10

" Misc Options
set encoding=utf-8 " Necessary to show Unicode glyphs
set hlsearch
set textwidth=80
set clipboard=unnamed
set shiftwidth=4
set tabstop=4
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
