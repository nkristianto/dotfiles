" This vim config is based on github.com/rnd/dotfiles

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.nvim/plugged')


" UI
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Code Completion
Plug 'Raimondi/delimitMate'                     " auto-completion for quotes, parens, brackets, etc
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'

" Language Support
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make' }
Plug 'vim-jp/vim-go-extra', { 'for': 'go' }
Plug 'exu/pgsql.vim', { 'for': 'sql' }
call plug#end()

"----[ general settings ]---------------------
set number " show number
set relativenumber
set title " let vim set the terminal title
set updatetime=100 " redraw the status bar often
set encoding=utf-8
set expandtab " expands tabs to spaces
set list " show trailing whitespace
set listchars=tab:\|\ ,trail:~
set autoindent " take indent for new line from previous line
set smartindent " enable smart indentation
set nobackup noswapfile nowritebackup
set noexpandtab
set completeopt-=preview

" Set the leader button, by default mapped to '\'
let mapleader = ','

" Allow vim to set a custom font or color for a word
syntax enable

"----[ custom key map ]----------------------
nnoremap ; :

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l


" disable arrow keys
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

"re map copy all
nnoremap <leader>cpall :%y+<cr>

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
let g:go_gocode_unimported_packages = 1
let g:go_auto_type_info = 1

au FileType go nmap <Leader>r <Plug>(go-rename)
au FileType go nmap gd <Plug>(go-def)
inoremap <C-b> <C-x><C-o>

"----[ posgeresQL ]-----------------------
let g:sql_type_default = 'pgsql'

"----[ Airline Theme ]-----------------------
let g:airline_theme='one'

set background=dark
colorscheme pablo
hi Comment ctermfg=244

"-----[ Supertab settings ]-----------------------------
let g:SuperTabDefaultCompletionType = '<c-n>'

"----[ shougo/deoplete.nvim settings ]---------------------

" Enable deoplete on startup
let g:deoplete#enable_at_startup = 1

call deoplete#custom#option({
\ 'auto_complete_delay': 0,
\ 'auto_refresh_delay': 10,
\})

"-----[ Delimate settings ]-----------------------------
let delimitMate_expand_cr = 1

"-----[ override file setting ]-----------------------------
autocmd FileType html,xml,ruby,sh,javascript,jsx,json,yaml,sql,vim,cmake,proto,typescript,ps1,gitconfig setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

"----[ golang settings ]---------------------

"format tab
autocmd FileType go set noexpandtab shiftwidth=4 softtabstop=4 tabstop=4
autocmd BufNewFile,BufRead .go.tpl,.qtpl,*.gunk setlocal syntax=go
autocmd FileType go,gunk autocmd BufWritePre <buffer> Fmt
