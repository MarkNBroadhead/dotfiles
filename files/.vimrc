set number
set cursorline
set backspace=indent,eol,start

call plug#begin('~/.vim/plugged')
Plug 'pangloss/vim-javascript'

call plug#end()

# Fix for crontab editing in macOS https://superuser.com/questions/359580/error-adding-cronjobs-in-mac-os-x-lion
if $VIM_CRONTAB == "true"
    set nobackup
    set nowritebackup
endif
