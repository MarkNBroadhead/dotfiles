set number
set cursorline
set backspace=indent,eol,start

call plug#begin('~/.vim/plugged')
Plug 'pangloss/vim-javascript'

call plug#end()

if $VIM_CRONTAB == "true"
    set nobackup
    set nowritebackup
endif
