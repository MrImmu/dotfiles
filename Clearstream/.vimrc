set ruler               " ruler %
set background=dark     " change font color for black backgroud
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces
set shiftwidth=4
set softtabstop=4
set showcmd             " show command in bottom bar
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set number relativenumber
colorscheme gruvbox

syntax on
filetype plugin indent on
"Get the 2-space YAML as the default when hit carriage return after the colon
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
set is hlsearch ai ic scs
nnoremap <esc><esc> :nohls<cr>
