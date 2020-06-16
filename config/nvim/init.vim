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
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'ervandew/supertab'
" Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'natebosch/vim-lsc'
"Plug 'natebosch/vim-lsc-dart'

" Code Format
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'alvan/vim-closetag'     " auto close html tags
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" Language Support
" Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
" Plug 'zchee/deoplete-go', { 'for': 'go', 'do': 'make' }
Plug 'vim-jp/vim-go-extra', { 'for': 'go' }
Plug 'exu/pgsql.vim', { 'for': 'sql' }
Plug 'elmcast/elm-vim', { 'for': 'elm' }  "https://github.com/ElmCast/elm-vim
Plug 'mattn/emmet-vim', {'for': 'html'}
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'posva/vim-vue', {'for': 'vue'}
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }
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

"re map copy to clipboard
nnoremap <leader>cpall :%y+<cr>

"let g:go_def_mapping_enabled = 0
"let g:go_def_mode='gopls'
"let g:go_info_mode='gopls'
"let g:go_fmt_command = "goimports"
"let g:go_highlight_types = 1
"let g:go_gocode_unimported_packages = 1
"let g:go_auto_type_info = 1
"let g:go_fmt_fail_silently = 0
"let g:go_list_type = "quickfix"
let g:closetag_filenames = '*.html,*.xml, *.vue'
let g:prettier#autoformat = 0
let g:airline#extensions#hunks#enabled=0
"let g:lsc_auto_map = v:true " dart lsc

"au FileType go nmap <Leader>r <Plug>(go-rename)
inoremap <C-b> <C-x><C-o>

" nmap <C-\> :GoImplements<cr>

"----[ posgeresQL ]-----------------------
let g:sql_type_default = 'pgsql'

"----[ Airline Theme ]-----------------------
let g:airline_theme='papercolor'

set background=dark
"colorscheme pablo
colorscheme novum
hi Comment ctermfg=244

"-----[ Supertab settings ]-----------------------------
" let g:SuperTabDefaultCompletionType = '<c-n>'

"----[ shougo/deoplete.nvim settings ]---------------------

" Enable deoplete on startup
" let g:deoplete#enable_at_startup = 1

" call deoplete#custom#option({
" \ 'auto_complete_delay': 0,
" \ 'auto_refresh_delay': 10,
" \})
"

" Coc Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <C-]> <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"-----[ Delimate settings ]-----------------------------
let delimitMate_expand_cr = 1

"-----[ Elm Lnguage ]-----------------------------
let g:elm_syntastic_show_warnings = 1

"----[ glaive + codefmt ]---------------------------
call glaive#Install()

augroup autoformat_settings
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
augroup END
"---------------------------------------------------

" Format Identation
autocmd FileType html,vue,js,xml,ruby,sh,javascript,jsx,json,yaml,sql,vim,cmake,proto,typescript,ps1,gitconfig setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType go set noexpandtab shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType dart set noexpandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType html let b:delimitMate_matchpairs = "(:),[:],{:}"

" Syntax Type
autocmd BufNewFile,BufRead .go.tpl setlocal syntax=go
autocmd BufNewFile,BufRead *.gunk setlocal filetype=gunk syntax=go
autocmd BufNewFile,BufRead *.qtpl setlocal syntax=go
autocmd BufNewFile,BufRead *.elm setlocal filetype=elm
autocmd BufNewFile,BufRead *.html setlocal filetype=html
autocmd BufNewFile,BufRead *.js setlocal filetype=javascript
autocmd BufNewFile,BufRead *.vue setlocal filetype=vue

" Code Format
autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
