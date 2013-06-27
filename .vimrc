" vim:fdm=marker
" Author: Jakub Sokołowski <panswiata@gmail.com>
" Source: https://github.com/PonderingGrower/dotfiles

" Preamble {{{
filetype off " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" VIM instad of VI
set nocompatible
" custom statusline
source ~/.vim/statusline.vim

" }}}
" Vundle plugin management {{{
" let Vundle manage Vundle
Bundle 'gmarik/vundle'
" original repos on github
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-surround'
Bundle 'mhinz/vim-startify'
Bundle 'ervandew/supertab'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'PProvost/vim-ps1'
Bundle 'szw/vim-tags'
Bundle 'bling/vim-bufferline'
Bundle 'vim-scripts/Align'
" Colorschemes
Bundle 'nanotech/jellybeans.vim'

" }}}
" Display configuration {{{
set background=dark

if &t_Co == 256 || has('gui_running')
    colors jellybeans
else
    colors jellybeans " Or some other 16-color scheme
endif

" graphical font
if has("gui_running")
    if has("gui_gtk2")
        set guifont=Terminus\ 10
    elseif has("gui_win32")
        set guifont=Dina:h10:cANSI
    endif
endif

set guioptions=             " Get rid of useless GUI elements

syntax on                   " File-type highlighting
filetype on                 " enable file type detection
filetype plugin on          " loading of plugin files for specific file types
filetype indent on          " loading of indent files for specific file types

set winwidth=79             " minimum window size
set winheight=20
set colorcolumn=80          " highlight this column
set nuw=4                   " Number line width
set ruler                   " Show columns and rows
set cursorline              " highlight the current line
set laststatus=2            " always show the statusline
set listchars=tab:▸\ ,eol:¬ " use less visible characters for tabstops and EOLs
set relativenumber          " Show how far each line of from the current one
set wrap                    " Text wrappingi
set linebreak               " don't break in middle of words
set showmatch               " Show matching brackets

" }}}
" Formatting settings {{{

set softtabstop=4
set shiftwidth=4
set tabstop=4
set cinoptions=>4
set expandtab               " use spaces instead of tabs
set smarttab

" }}}
" General configuration {{{

" fix slight delay after pressing ESC then O
set timeout timeoutlen=1000 ttimeoutlen=100
set modifiable
set write
set notitle                       " keep the console title unchanged
set encoding=utf-8                " encoding
set fileencoding=utf-8
"set noesckeys
"set nomodeline                   " uselessm, reading of setting from first lines in file
set lazyredraw                    " faster macros processing
set noerrorbells                  " tell vim to shut up
set visualbell
set t_vb=
set mouse=a                       " Enable the use of the mouse.
set scrolloff=5                   " number of lines you want to see in front of and after the cursor
set showcmd                       " Show (partial) command in status line.
set showmode
set showmatch                     " When a bracket is inserted, briefly jump to the matching one
set autoread                      " automatically update file changes done by other programs
set autoindent                    " Indentation settings, autoindent breaks pasted in text
set preserveindent
"set copyindent
set clipboard=unnamed             " paste the clipboard to unnamed register
set spelllang=pl,en               " spelling check
"set autochdir                    " Automatically changing working dir
set shell=zsh                     " Shell
set keywordprg=firefox\ -search   " search selected text in firefox default search with K
set shortmess=atI                 " remove message at vim start
set cmdheight=1                   " command line length
set backupdir=~/.vim/backup//     " make ~ files in:
set noswapfile                    " disable swap, set directory=~/.vim/temp//
set hlsearch                      " highlighting search results
set incsearch                     " start searching as you type
set ignorecase                    " ignore case in search patterns
set iskeyword+=_,$,@,%,#          " not word dividers
set hidden                        " buffer change, more undo
set ttyfast                       " Faster standard output
set wildmenu                      " File menu
set wildmode=list:longest,full    " ignore case when opening files
set wildignore=.so,swp,.zip,.mp3,
            \.bak,.pyc,.o,.ojb,.,a,
            \ojb.pdf,.jpg,.gif,.png,
            \.avi,.mkv,.so,.out

if has('patch072')                " check if neccessary path exists to avoid errors
    set wildignorecase            " ignore case when autocompleting paths
endif
if has('persistent_undo')         " persistend undo history
    set undofile                  " Save undo's after file closes
    set undodir=~/.vim/undo//     " where to save undo histories
    set undolevels=100            " How many undos
    set undoreload=1000           " number of lines to save for undo
endif

" save the file as root (tee must be addedd as NOPASSWD to sudoers)
command! -bar -nargs=0 Sw :silent exe 'write !sudo tee % >/dev/null' | silent edit!

" }}}
" Folding settings {{{

set foldenable
set foldlevel=0
set foldmethod=syntax
set foldnestmax=2

" }}}
" Programming settings {{{

compiler gcc                      " real men use gcc
set makeprg=make\ -j6\ --silent   " default compilation command

" Different compiler depending on type of file
autocmd FileType c set makeprg=make\ --silent
autocmd FileType c set cindent
" Format for errors in QuickList
autocmd FileType java set errorformat=%A%f:%l:\ %m,%-Z%p^,%C\ \ :\ %m,%-C%.%#
autocmd FileType cpp set errorformat=%f:%l:%c:\ %m
" per file syntax
autocmd BufRead,BufNewFile .pentadactylrc set filetype=vim

" }}}
" Plugin configuration {{{

" Syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs  = 1

" NERDTree
let NERDTreeWinPos = "right"
let NERDTreeWinSize = 30

" Don't make comments italic
let g:jellybeans_overrides = {
            \ 'Comment':{ 'cterm': 'italic' },
            \ 'Todo':   { 'gui' : 'bold', 'guibg': 'ff0000', 'cterm': '224'},
            \}

highlight Normal ctermbg=NONE " use terminal background
highlight nonText ctermbg=NONE " use terminal background
let g:jellybeans_use_lowcolor_black = 0

" Startify
let g:startify_unlisted_buffer = 0

" DelimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let delimitMate_smart_quotes = 0

" SuperTab
let g:SuperTabDefaultCompletionType = "context"

" TagBar
set tags=./tags;/
let g:tagbar_left = 1
let g:tagbar_width = 30
let g:tagbar_ctags_bin="/usr/bin/ctags"

" Stop CtrlP from recalculating on files on start
let g:ctrlp_cache_dir = $HOME.'/.vim/temp/ctrlp'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'raw'
let g:ctrlp_regexp = 0
let g:ctrlp_root_markers = ['.root', '.git', 'COPYING' ]
let g:ctrlp_custom_ignore = {
	        \ 'dir':  '\v[\/]\.(git|hg|svn)$',
	        \ 'file': '\v\.(exe|so|dll|tmp|temp|swp|o)$',
	        \ }

" EasyMotion leader
let g:EasyMotion_leader_key = '<Space>'

" }}}
" General Key Mappings {{{

" Changing leader to space
let mapleader = "\<Space>"
" don't let space do anything else
nnoremap <SPACE> <Nop>

" Toggle pastemode, doesn't indent
set pastetoggle=<F8>

" For closing tags in HTML
iabbrev </ </<C-X><C-O>

" help in new vertical split
cnoremap hlp rightb vert help

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Fast saving
nmap <c-s> :w!<cr>

" save and compile
map mm :w<CR>:Make<CR>

" remove annoying comman-line window
nnoremap q: :q

" for moving in wrapped lines
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" search results in the centre of the screen
nmap n nzz
nmap N Nzz

" Learn to use hjkl
nnoremap <up> ddkP
nnoremap <down> ddp
nnoremap <left> gv<
nnoremap <right> gv>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" easier navigation between splits
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" paste with ctrl+v from clipboard in insert mode
inoremap <c-v> <c-r>+
"nnoremap <c-v> "+p
" paste to clipboard with ctrl+c in visual mode
vnoremap <c-c> "+y

" easier navigation through tabs
nnoremap <c-Tab>   :tabnext<CR>
nnoremap <c-s-Tab> :tabprevious<CR>

" }}}
" <Leader> bindings {{{

" paste and sellect
nnoremap <leader>o p`[v`]
nnoremap <leader>O P`[v`]

" append a semicolon
nnoremap <leader>; A;<Esc>

" strip all trailing whitespaces in current file
nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>;

" easier access to substitution
nnoremap <leader>S :%s//<left>

" Window management
" split vertical and switch
nnoremap <leader>s <C-w>v<C-w>l
" split horizontal and switch
nnoremap <leader>d <C-w>s<C-w>l
" close buffer but leave active pane open
nnoremap <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" Edit .vimrc and erfresh configuration
nnoremap <leader>v :source ~/.vimrc<CR>
nnoremap <leader>V :vsp ~/.vimrc<CR>
nnoremap <leader>C :vsp ~/.vim/notes.txt<CR>

" switch between buffers
nnoremap <leader>h :bprevious<CR>
nnoremap <leader>l :bnext<CR>
" toggle last two buffers
nnoremap <leader>u <c-^>

" roggle showing of newline and tab characters
nnoremap <leader>i :set list!<CR>

" CtrlP mappings
nnoremap <Tab>      :CtrlPMixed<CR>
nnoremap <leader>pp :CtrlP<Space>
nnoremap <leader>pc :CtrlP %:p:h<CR>
nnoremap <leader>pr :CtrlPRoot<CR>
nnoremap <leader>pt :CtrlPBufTagAll<CR>
nnoremap <leader>pl :CtrlPLine<CR>
nnoremap <leader>pq :CtrlPQuickfix<CR>
nnoremap <leader>pb :CtrlPBuffer<CR>
nnoremap <leader>pm :CtrlPMRUFiles<CR>
nnoremap <leader>po :CtrlPLastMode --dir<CR>

" re-run last CtrlP command
nnoremap <leader><leader> :CtrlP<Up><CR>

" set current dir to that of current file
nnoremap <leader>g :cd %:p:h<CR>:pwd<CR>

" open Errors pane from Syntastic
nnoremap <leader>x :Errors<CR>

" focus the current fold
nnoremap <leader>z zMzvzz

" add new line above and bellow current line
nnoremap <silent> <leader>[ :<C-U>call <SID>AddLines(1)<CR>
nnoremap <silent> <leader>] :<C-U>call <SID>AddLines(0)<CR>

" }}}
" Git bindings {{{

" fugitive git bindings
nnoremap ga :Git add %<CR><CR>
nnoremap gs :Gstatus<CR>
nnoremap gc :Gcommit<CR>i
nnoremap gd :Gdiff<CR>
nnoremap ge :Gedit<CR>
nnoremap gr :Gread<CR>
nnoremap gw :Gwrite<CR><CR>
nnoremap gl :Glog<CR>
nnoremap gm :Gmove<Space>
nnoremap gb :Git branch<Space>
nnoremap gco :Git checkout<Space>
nnoremap gps :Dispatch git push<CR>
nnoremap gpl :Dispatch git pull<CR>

" }}}
" Fxx bindings {{{

nnoremap <F12> :set guifont=Inconsolata\ 12<CR>
nnoremap <F11> :set guifont=terminus\ 8<CR>
nnoremap <F10> :SyntasticToggleMode<CR>
nnoremap <F9> :nohl<CR>
nnoremap <F8> :Make!<CR>
nnoremap <F7> :Copen<CR>
nnoremap <F6> :tabclose<CR>
nnoremap <F5> :tabnew<CR>
nnoremap <F4> :source ~/.vim/session/default<cr>
nnoremap <F3> :mksession! ~/.vim/session/default<cr>
nnoremap <F2> :NERDTreeToggle %:p:h<CR>
nnoremap <F1> :TagbarToggle<CR>

" }}}
" autocmd settings {{{
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

" Check awesome configuration after every write
autocmd BufWritePost $HOME/.config/awesome/rc.lua !awesome -k

augroup DisableMappings
    " remove mapping made by align plugin
    autocmd! VimEnter * :unmap <space>swp
augroup END
" }}}
" Functions {{{

" Add []<space> mappings for adding empty lines
fun! s:AddLines(before)
  let cnt = (v:count>0) ? v:count : 1
  call append(line('.')-a:before, repeat([''], cnt))
  silent! call repeat#set((a:before ? '[ ' : '] '), cnt)
endf

" }}}
