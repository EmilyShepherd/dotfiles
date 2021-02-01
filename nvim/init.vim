syntax enable
set autoindent
colorscheme desert
set number
filetype indent on
set incsearch
set ruler
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set colorcolumn=73
set spelllang=en

let use_mutt_sidebar=1

autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
autocmd FileType mail set tw=72 fo+=taw spell
autocmd FileType html set tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType xml set tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType xml syntax spell toplevel
autocmd FileType xslt set tabstop=2 softtabstop=2 shiftwidth=2
autocmd BufRead /etc/bind/zones/* set filetype=bindzone
