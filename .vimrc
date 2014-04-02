"
" Vundle
set nocompatible              " be iMproved
filetype off                  " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" " required! 
Bundle 'gmarik/vundle'
Bundle 'git://github.com/Lokaltog/vim-easymotion.git'
Bundle 'git://github.com/itchyny/calendar.vim.git'
Bundle 'git://github.com/jcf/vim-latex.git'
Bundle 'git://github.com/xuhdev/vim-latex-live-preview.git'
Bundle 'git://github.com/majutsushi/tagbar.git'
Bundle 'git://github.com/scrooloose/syntastic.git'
Bundle 'git://github.com/scrooloose/nerdtree.git'
Bundle 'git://github.com/Shougo/neocomplcache.vim.git'
Bundle 'git://github.com/ervandew/supertab.git'
Bundle 'git://github.com/Raimondi/delimitMate.git'
Bundle 'git://github.com/hynek/vim-python-pep8-indent.git'
Bundle 'git://github.com/zeis/vim-kolor.git'
Bundle 'git://github.com/Lokaltog/vim-powerline.git'
Bundle 'git://github.com/Shougo/unite.vim.git'
Bundle 'git://github.com/Shougo/vimproc.vim'
Bundle 'git://github.com/vim-scripts/LanguageTool.git'
"Bundle 'git://github.com/Valloric/YouCompleteMe.git'
"Bundle 'git://github.com/klen/python-mode.git'
"Bundle 'git://github.com/freitass/todo.txt-vim.git'
"Bundle 'git://github.com/kien/ctrlp.vim.git'

" Calendar
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

" CtrlP
"let g:ctrlp_cmd = 'CtrlPMixed'
"set wildignore+=*/doc/*,*.o

" EasyMotion
let g:EasyMotion_leader_key = '<Leader>'

" NERDTree
noremap <leader>z :NERDTreeToggle<CR>

" Powerline
"let g:Powerline_symbols = 'fancy'

" Syntastic
let g:syntastic_cpp_include_dirs = ['include', '../include']
let g:syntastic_cpp_compiler_options = '-std=c++11'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%{SyntasticStatuslineFlag()}
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_checker_args='--ignore=E501,E225'
let g:syntastic_enable_signs=1

" Supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" NeoCompleteCache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1

" Tagbar
noremap <leader>x :Tagbar<CR>

" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
noremap <C-p> :Unite -no-split -buffer-name=files -start-insert file_rec/async<cr>

" YouCompleteMe *REQUIRES PYTHON2.7*
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_path_to_python_interpreter = '/usr/bin/python1'
"let g:ycm_server_use_vim_stdout = 1
"let g:ycm_server_log_level = 'debug'

" Directories
set dir=~/.vim/tmp/,/var/tmp/,.
set backupdir=~/.vim/tmp/,/var/tmp,.
set undodir=~/.vim/tmp/,/var/tmp,.

" Color
colorscheme kolor

" Allow scroll
set mouse=a
noremap <ScrollWheelUp> <C-Y> <C-Y> <C-Y>
noremap <ScrollWheelDown> <C-E> <C-E> <C-E>

" Latex
let g:tex_flavor='latex'

" GUI
set guioptions-=T " Remove toolbar
set guioptions-=r " Remove right scrollbar
set guioptions-=L " Remove left scrollbar
set guifont=Terminus\ 10

" Syntax 
au BufNewFile,BufRead *.l set filetype=lisp
au BufNewFile,BufRead *.l set tabstop=2
au BufNewFile,BufRead *.l set shiftwidth=2

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
set omnifunc=syntaxcomplete#Complete
filetype plugin indent on
