" Chaz Bailey's vimrc

" Plugin Management {{{
" Vim Plug{{{
" 
filetype off
set nocompatible
set rtp+=$HOME/.vim/bundle/Vundle.vim
call plug#begin()
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-git'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'pprovost/vim-ps1'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tcomment_vim'
Plug 'yegappan/mru'
Plug 'justinmk/vim-sneak'
Plug 'lokaltog/vim-easymotion'
Plug 'vim-scripts/EasyGrep'
Plug 'altercation/vim-colors-solarized'
Plug 'aperezdc/vim-template'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'


call plug#end()
filetype plugin indent on

" }}}
" NERDTree Config {{{
" Show hidden files and folders by default
let NERDTreeShowHidden=1

" Set the default directory to home
cd $HOME
" }}}
" CtrlP Config {{{
" }}}
" Sneak Config {{{
" Ignore Case
let g:sneak#use_ic_scs = 1
" }}}
" ShowMarks Config {{{
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let g:showmarks_enable = 1
" For marks a-z
highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=Blue
" For marks A-Z
highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed
" For all other marks
highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow
" For multiple marks on the same line.
highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen
" }}}
" Easy-Grep Config {{{
let g:EasyGrepMode=0
let g:EasyGrepCommand=1
let g:EasyGrepRecursive=1
let g:EasyGrepSearchCurrentBufferDir=1
let g:EasyGrepIgnoreCase=1
let g:EasyGrepHidden=1
let g:EasyGrepFilesToExclude=''
let g:EasyGrepAllOptionsInExplorer=1
let g:EasyGrepWindow=0
let g:EasyGrepReplaceWindowMode=0
let g:EasyGrepOpenWindowOnMatch=1
let g:EasyGrepEveryMatch=0
let g:EasyGrepJumpToMatch=1
let g:EasyGrepInvertWholeWord=0
let g:EasyGrepFileAssociationsInExplorer=0
let g:EasyGrepExtraWarnings=1
let g:EasyGrepOptionPrefix='<leader>vy'
let g:EasyGrepReplaceAllPerFile=0
" }}}
" Taglist Config {{{
if has("win32")
    let Tlist_Ctags_Cmd="$VIM_HOME/.vim/ctags.exe"
endif
" }}}
" UltiSnips Config {{{
let g:UltiSnipsExpandTrigger="<C-CR>"
let g:UltiSnipsJumpForwardTrigger="<C-tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" }}}
" Easymotion Config{{{
" Lower a-z
let g:EasyMotion_keys = 'fjdkslaghtyrueiwoqpbnvmcxz'
" }}}
" }}}
" General Key Mappings {{{
let mapleader = " "

" jj to leave insert mode
inoremap jj <Esc>

" CTRL-Backspace to delete the previous word
inoremap <C-BS> <C-W>
" CTRL-Delete to delete the next word
inoremap <C-Del> <Esc>dwi

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Move around windows quickly
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h

" }}}
" User created commands{{{

" Easily open my vimrc
command Vimrc execute "e $MYVIMRC"

" Format JSON with a python module
command FormatJSON execute "%!python -m json.tool"
" }}}
" Leader tags{{{

" Leader f to toggle folds
nnoremap <leader>f za

" Sweet ass buffer mapping. ,b to list and prepare for a buffer change
nnoremap <leader>b :buffers<CR>:buffer<Space>

" NERD Tree
nnoremap <leader>nn :NERDTreeToggle<CR>
" NERD Tree find
nnoremap <leader>nf :NERDTreeFind<CR>

" Copy & Paste
vnoremap <leader>c "+y
vnoremap <leader>p "+p

" More useful enter and backspace
nnoremap <Enter> }
nnoremap <BS> {

" }}}
" Backup {{{
" Turn off the creation of those backup files... just SAVE
set nobackup
" }}}
" Windows Specific {{{
" Uncomment the line below to get all your favourite windows bindings

if !has("unix")
    source $VIMRUNTIME\mswin.vim
else
    "    source $VIMRUNTIME/mswin.vim
endif

" }}}
" Colours {{{
" Set a colourscheme
if has('gui_running')
    set background=dark
    colorscheme solarized
else
    colorscheme desert
endif


" Enable syntax processing
syntax enable

" Allow color schemes to do bright colors without forcing bold.
"if &t_Co == 8 && $TERM !~# '^linux'
"    set t_Co=16
"endif

" }}}
" UI Config {{{
" Load filetype specific indent files and plugins
filetype plugin indent on

" Show relative line numbers and actual line number on selected line.
set relativenumber
set number

" Show ruler
set ruler

" Show last command in bottom bar
set showcmd

" Visual autocomplete for command menu
set wildmenu

" Redraw only when we need to (not in the middle of macros)
set lazyredraw

" Highlight matching [{()}]
set showmatch

" Show all whitespace
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
" set list

" Cursor as block in cygwin
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" }}}
" Spaces & Tabs {{{
" Tabs are spaces
set expandtab

" Number of visual spaces per TAB (reading)
set tabstop=4

" Number of spaces in tab when editing
set softtabstop=4

" Controls how many columns text is indented
set shiftwidth=4

" Smart indenting
set smartindent

" Auto indenting
set autoindent

" Matchit Macro for XML and HTML (Extends the power of %)
runtime! macros/matchit.vim

" }}}
" Searching {{{
" Search as characters are entered
set incsearch

" Highlight matches
set hlsearch

" Ignore case
set ignorecase

" Use the silver surfer if available
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects   .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
endif

" }}}
" Folding {{{
" Enable folding
set foldenable

" Open most folds by default (up to 10 layers)
set foldlevelstart=10

" 10 nested folds max
set foldnestmax=10

" Set folds based on syntax
set foldmethod=syntax

" Sets auto folding on xml
let g:xml_syntax_folding=1
" }}}
" Keeping vimrc organised {{{
" Turns on modeline searching. Such as for the line below it setting up the
" fold method
set modeline
" vim: foldmethod=marker:foldlevelstart=0:foldlevel=0
" }}}
