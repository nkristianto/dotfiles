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
Plug 'Raimondi/delimitMate'                     " auto-completion for quotes, parens, brackets, etc
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }


"Language Support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'zchee/deoplete-go', { 'do': 'make'}      " Go auto completion
call plug#end()



"----[ general settings ]---------------------
set number				" show number
set title 				" let vim set the terminal title
set updatetime=100              	" redraw the status bar often
set cursorline                    	" highlight the current line for the cursor
set encoding=utf-8
set expandtab                     	" expands tabs to spaces
set list                                " show trailing whitespace
set listchars=tab:\|\ ,trail:▫
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

let g:deoplete#sources#go#gocode_binary = $HOME.'/go/bin/gocode'
let g:deoplete#sources#go#source_importer = 1

"-----[ Delimate settings ]-----------------------------
let delimitMate_expand_cr = 1


"----[ zchee/deoplete-go settings ]---------------------

" Enable completing of go pointers
let g:deoplete#sources#go#pointer = 1

" Enable autocomplete of unimported packages
let g:deoplete#sources#go#unimported_packages = 1

"----[ golang settings ]---------------------

au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

"Mapping
au FileType go nmap <leader>gt :GoDeclsDir<cr>
au FileType go nmap <F12> <Plug>(go-def)
au FileType go nmap <leader>gdv <Plug>(go-def-vertical)
au FileType go nmap <leader>gdh <Plug>(go-def-split)

" Enable syntax highlighting per default
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1

" Highlight variable uses
let g:go_auto_sameids = 1

" Run goimports when running gofmt
let g:go_fmt_command = "goimports"

" Show type information
let g:go_auto_type_info = 1

" Set whether the JSON tags should be snakecase or camelcase.
let g:go_addtags_transform = "snakecase"
