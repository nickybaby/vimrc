syntax on
set nocompatible              " required
set noswapfile
set laststatus=2
filetype off                  " required
set number
set backspace=indent,eol,start "

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'preservim/tagbar'
Plugin 'tpope/vim-sensible'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'dense-analysis/ale'
Plugin 'jremmen/vim-ripgrep'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'airblade/vim-rooter'
Plugin 'ap/vim-buftabline'
Plugin 'davidhalter/jedi-vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'challenger-deep-theme/vim', {'name': 'challenger-deep'}
Plugin 'scrooloose/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'jpalardy/vim-slime'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ghifarit53/tokyonight-vim'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
" ...
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ }
let g:tokyonight_style = 'night'
let g:slime_target="tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": "{last}"}

let g:fzrf_preview_window = ['right:50%', 'ctrl-/']

let g:jedi#show_call_signatures = "1"
autocmd FileType python setlocal completeopt-=preview
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set foldmethod=indent
set foldlevel=99

nnoremap <space> za
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
nmap <F8> :TagbarToggle<CR>

set tabstop=4
set shiftwidth=4
set softtabstop=4
set colorcolumn=120
set viminfo='25,\"50,n~/.viminfo
set encoding=utf-8
set fileencoding=utf-8
set t_Co=256


let python_highlight_all=1
if &term =~ '^\%(screen\|tmux\)'
	  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
set termguicolors
colorscheme challenger_deep
