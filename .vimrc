set nocompatible              " required
filetype off                  " required
set nu
set backspace=indent,eol,start "

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'challenger-deep-theme/vim', {'name': 'challenger-deep'}
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'jpalardy/vim-slime'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ghifarit53/tokyonight-vim'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
" ...
let g:tokyonight_style = 'night'

let g:jedi#use_tabs_not_buffers = 1
let g:jedi#show_call_signatures = "1"
autocmd FileType python setlocal completeopt-=preview
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set foldmethod=indent
set foldlevel=99

nnoremap <space> za

au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" PEP 8 Indentation "
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

set encoding=utf-8

py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1
syntax on

if has('nvim') || has('termguicolors')
	set termguicolors
endif

colorscheme tokyonight
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": split($TMUX, ",")[0], "target_pane": ":.2"}
