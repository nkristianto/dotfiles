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

" Colorschemes
Plug 'rakr/vim-one'

" Code Completion
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'Raimondi/delimitMate'                     " auto-completion for quotes, parens, brackets, etc
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'

"Language Support
Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make' }
Plug 'vim-jp/vim-go-extra', { 'for': 'go' }
Plug 'exu/pgsql.vim', { 'for': 'sql' }
call plug#end()



"----[ general settings ]---------------------
set number				" show number
set title 				" let vim set the terminal title
set updatetime=100              	" redraw the status bar often
set cursorline                    	" highlight the current line for the cursor
set encoding=utf-8
set expandtab                     	" expands tabs to spaces
set list                                " show trailing whitespace
set listchars=tab:\|\ ,trail:.
set autoindent                          " take indent for new line from previous line
set smartindent                         " enable smart indentation
set nobackup noswapfile nowritebackup
set noexpandtab
set completeopt-=preview

" Set the leader button, by default mapped to '\'
let mapleader = ','

" Allow vim to set a custom font or color for a word
syntax enable

"----[ custom key map ]----------------------
nnoremap ; :

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

" language server keys
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> gt :call LanguageClient#textDocument_formatting_sync()<CR>


"----[ posgeresQL ]-----------------------
let g:sql_type_default = 'pgsql'

"----[ Airline Theme ]-----------------------
"let g:airline_theme='deus theme'
let g:airline_theme='one'

"----[ colors settings ]---------------------
"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >

if (has("termguicolors"))
  set termguicolors
endif

" One colorscheme settings
let g:one_allow_italics = 1

colorscheme one
set background=dark

"-----[ Supertab settings ]-----------------------------
let g:SuperTabDefaultCompletionType = '<c-n>'

"----[ shougo/deoplete.nvim settings ]---------------------

" Enable deoplete on startup
let g:deoplete#enable_at_startup = 1


"-----[ Delimate settings ]-----------------------------
let delimitMate_expand_cr = 1

"-----[ override file setting ]-----------------------------
autocmd FileType html,xml,ruby,sh,javascript,jsx,json,yaml,sql,vim,cmake,proto,typescript,ps1,gitconfig setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

"----[ golang settings ]---------------------

"format tab
autocmd FileType go set noexpandtab shiftwidth=4 softtabstop=4 tabstop=4

autocmd BufNewFile,BufRead *.go.tpl,*.qtpl setlocal syntax=go


" launch language servers
let g:LanguageClient_serverCommands = { 'go': ['gopls'] }

" run gofmt and goimports on save
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

let g:gofmt_command = "goimports"
autocmd FileType go autocmd BufWritePre <buffer> Fmt

