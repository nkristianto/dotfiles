call plug#begin('~/.local/share/nvim/plugged')


" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Colorschemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'ayu-theme/ayu-vim'
Plug 'kaicataldo/material.vim'
Plug 'rakr/vim-one'

" Other
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'Raimondi/delimitMate'                     " auto-completion for quotes, parens, brackets, etc
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }


"Language Support
Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make' }
Plug 'vim-jp/vim-go-extra', { 'for': 'go' }
call plug#end()



"----[ general settings ]---------------------
set number				" show number
set title 				" let vim set the terminal title
set updatetime=100              	" redraw the status bar often
set cursorline                    	" highlight the current line for the cursor
set encoding=utf-8
set expandtab                     	" expands tabs to spaces
set list                                " show trailing whitespace
set listchars=tab:\|\ ,trail:‚ñ´
set autoindent                          " take indent for new line from previous line
set smartindent                         " enable smart indentation
set autoread                            " reload file if the file changes on the disk
set nobackup noswapfile nowritebackup

" Set the leader button, by default mapped to '\'
let mapleader = ','

" Allow vim to set a custom font or color for a word
syntax enable

"----[ custom key map ]----------------------
nnoremap ; :

" disable arrow keys
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

"re map copy all
nnoremap <leader>cpall :%y+<cr>

" language server keys
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> gt :call LanguageClient#textDocument_formatting_sync()<CR>


"----[ Airline Theme ]-----------------------
"let g:airline_theme='deus theme'

"----[ colors settings ]---------------------
"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

set background=dark

" Material colorscheme settings
let g:material_theme_style = 'dark'

" Ayu colorscheme settings
let ayucolor = 'dark'

" One colorscheme settings
let g:one_allow_italics = 1

colorscheme one

" Override the search highlight color with a combination that is easier to
" read. The default PaperColor is dark green backgroun with black foreground.
"
" Reference:
" - http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
highlight Search guibg=DeepPink4 guifg=White ctermbg=53 ctermfg=White

" Toggle background with <leader>bg
map <leader>bg :let &background = (&background == "dark"? "light" : "dark")<cr>


"----[ shougo/deoplete.nvim settings ]---------------------

" Enable deoplete on startup
let g:deoplete#enable_at_startup = 1


"-----[ Delimate settings ]-----------------------------
let delimitMate_expand_cr = 1


"----[ golang settings ]---------------------
autocmd BufNewFile,BufRead *.go.tpl,*.qtpl setlocal syntax=go


" launch language servers
let g:LanguageClient_serverCommands = { 'go': ['gopls'] }

" run gofmt and goimports on save
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

let g:gofmt_command = "goimports"
autocmd FileType go autocmd BufWritePre <buffer> Fmt
