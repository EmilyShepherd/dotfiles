syntax enable
set autoindent
colorscheme peachpuff
set number
filetype indent on
set incsearch
set ruler
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab
set colorcolumn=73
set spelllang=en

let use_mutt_sidebar=1

autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
autocmd FileType mail set tw=72 fo+=taw spell
autocmd FileType xml syntax spell toplevel
autocmd FileType php set tabstop=4 softtabstop=4 shiftwidth=4
autocmd BufRead /etc/bind/zones/* set filetype=bindzone
