filetype plugin on
set rnu
set nu

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible' "Sensible Defaults
Plug 'tpope/vim-fugitive' "Git pugin
Plug 'scrooloose/nerdtree' "File manager sidebar
Plug 'vim-airline/vim-airline' "Statusline
Plug 'airblade/vim-gitgutter' "Git gutter
Plug 'tpope/vim-commentary' "Commenter
Plug 'valloric/youcompleteme' 
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'scrooloose/syntastic'
call plug#end()

"NERDTree Settings
map <C-f> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"YCM
nnoremap <F2>  :YcmCompleter GoTo<CR>

nnoremap <space> :

set tabstop=4
set softtabstop=4 noexpandtab
set shiftwidth=4
set splitright
set splitbelow

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

