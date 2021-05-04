filetype plugin on
set smartindent

set rnu
set nu
nnoremap <space> :

" Better window navigation
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" Use alt + hjkl to resize windows
nnoremap <silent> <M-j>    :resize -2<CR>
nnoremap <silent> <M-k>    :resize +2<CR>
nnoremap <silent> <M-h>    :vertical resize -2<CR>
nnoremap <silent> <M-l>    :vertical resize +2<CR>

set mouse=a

set tabstop=4
set softtabstop=4 noexpandtab
set shiftwidth=4
set splitright
set splitbelow

set clipboard+=unnamedplus
set smartcase
set ignorecase

autocmd TermOpen * setlocal nonumber norelativenumber

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set fileformat=unix |

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |


" Terminal Function
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

" Toggle terminal on/off (neovim)
nnoremap <A-t> :call TermToggle(12)<CR>
inoremap <A-t> <Esc>:call TermToggle(12)<CR>
tnoremap <A-t> <C-\><C-n>:call TermToggle(12)<CR>

" Terminal go back to normal mode
tnoremap <leader><esc> <C-\><C-n>

" Plugins
call plug#begin()
        Plug 'morhetz/gruvbox'
        " Plug 'neoclide/coc.nvim', {'branch': 'release'}
		Plug 'Shougo/deoplete.nvim'
        Plug 'preservim/nerdtree'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'tpope/vim-commentary'
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'ryanoasis/vim-devicons'
		Plug 'deoplete-plugins/deoplete-jedi'
		Plug 'dense-analysis/ale'
call plug#end()
autocmd vimenter * ++nested colorscheme gruvbox

" NERDTree configs
nnoremap <C-t> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" vim-airline configs
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='gruvbox'
let g:airline#extensions#ale#enabled = 1

" fzf configs
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
noremap <C-p> :FZF<cr>

" Deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr> <C-Space> deoplete#manual_complete()
let g:deoplete#sources#jedi#show_docstring = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Ale
let g:ale#statusline#Count = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_fixers = {'python':['yapf', 'isort'], '*':['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fix_on_save=1
