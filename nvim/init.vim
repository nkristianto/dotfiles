call plug#begin('~/.local/share/nvim/plugged')

" Plugin for go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Colorschemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'ayu-theme/ayu-vim'
Plug 'kaicataldo/material.vim'
Plug 'rakr/vim-one'

call plug#end()



"----------------------------------------------
" General settings
"----------------------------------------------
set number				" show number
set title 				" let vim set the terminal title
set updatetime=100              	" redraw the status bar often
set ruler
set cursorline                    	" highlight the current line for the cursor
set encoding=utf-8
set expandtab                     	" expands tabs to spaces
set autoindent                          " take indent for new line from previous line
set smartindent                         " enable smart indentation
set autoread                            " reload file if the file changes on the disk

" neovim specific settings
if has('nvim')
    " Set the Python binaries neovim is using. Please note that you will need to
    " install the neovim package for these binaries separately like this for
    " example:
    " pip3.6 install -U neovim
    let g:python_host_prog = '/usr/bin/python2'
    let g:python3_host_prog = '/usr/bin/python3'
endif

" Set the leader button, by default mapped to '\'
let mapleader = ','

" Allow vim to set a custom font or color for a word
syntax enable

"----------------------------------------------
" END OF GENERAL SETTINGS
"----------------------------------------------


"----------------------------------------------
" Colors
"----------------------------------------------
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

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

"----------------------------------------------
" End Of Colors Settings
"----------------------------------------------

"----------------------------------------------
" Language Settigns
"----------------------------------------------
"----------------------------------------------
" Golang Setting
"----------------------------------------------

au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

" Enable syntax highlighting per default
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_auto_sameids = 1

"----------------------------------------------
" End Of Golang Setting
"----------------------------------------------
"----------------------------------------------
" End of Language Settings
"----------------------------------------------
