" INSTALL
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" vim +BundleInstall +qall
" https://github.com/Lokaltog/vim-powerline/wiki/Patched-fonts

set nocompatible
filetype off

" Turn On Unicode
" if has("multi_byte")
"   if &termencoding == ""
"     let &termencoding = &encoding
"   endif
"   set encoding=utf-8
"   setglobal fileencoding=utf-8
"   set fileencodings=ucs-bom,utf-8,latin1
" endif


" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Tabular'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'kchmck/vim-coffee-script'
Bundle 'Lokaltog/vim-powerline'
Bundle 'SuperTab-continued.'
Bundle 'SuperTab'
Bundle 'ap/vim-css-color'
Bundle 'kien/ctrlp.vim'


" COLORS
set t_Co=256                   " 256 colors working with OSX Terminal
let g:solarized_termcolors=256 " Use as many as we can
let g:solarized_termtrans=1    " Transparency when we can
set background=dark            " Use Dark instead of Light version
colorscheme solarized          " Solarized is NICE

" SETTINGS
let mapleader = ","
let maplocalleader = "\\"
syntax on
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
highlight ExtraWhitespace ctermbg=red guibg=red
highlight LongLine ctermbg=yellow guibg=red

autocmd BufWinEnter * let w:m2=matchadd('LongLine', '\%>120v.\+', -1)
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

com! W :w
com! WQ :wq

set autoread
set backspace=indent,eol,start
set binary
set cinoptions=:0,(s,u0,U1,g0,t0
set completeopt=menuone,preview
set hidden
set history=1000
set laststatus=2

set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮

set nolist
set showbreak=↪

set modelines=0
set noeol
set number
set relativenumber
set numberwidth=4
set ruler
set shell=/bin/zsh

set showcmd
set matchtime=2
set completeopt=longest,menuone,preview

set hlsearch
set autoindent
set tabstop=2
set textwidth=80
set shiftwidth=2
set softtabstop=2
set expandtab
set formatoptions=qrn1
set colorcolumn=+1

set visualbell
set wildignore+=bin,.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,.DS_Store,*.aux,*.out,*.toc
set wildmenu
set nowrap
set spell
set splitright
set scrolloff=4

set ignorecase
set smartcase
set incsearch

" Auto Complete ================================================================
" set complete=.,w,b,u,i,t,k
" let g:AutoComplPop_CompleteOption = '.,w,b,u,i,t,k'
" let g:AutoComplPop_IgnoreCaseOption = 0
" let g:AutoComplPop_BehaviorKeywordLength = 2

" More Auto Complete
autocmd FileType html       set omnifunc=html5complete#CompleteTags
autocmd FileType python     set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType java       set omnifunc=javacomplete#Complete
autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml        set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php        set omnifunc=phpcomplete#CompletePHP
autocmd FileType c          set omnifunc=ccomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

" Triggers
au FocusLost    * :silent! wall
au FocusLost    * :set number
au FocusGained  * :set relativenumber
au InsertEnter * :set number
au InsertLeave * :set relativenumber

" nerd*
nmap <leader>/ :call NERDComment(0, "invert")<cr>
vmap <leader>/ :call NERDComment(0, "invert")<cr>
nmap <leader>n :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

" Tabular
nmap <Leader>x= :Tabularize /=<CR>
vmap <Leader>x= :Tabularize /=<CR>
nmap <Leader>x: :Tabularize /:\zs<CR>
vmap <Leader>x: :Tabularize /:\zs<CR>

" _ Powerline
let g:Powerline_symbols = 'fancy'
let g:Powerline_cache_enabled = 1

"CtrlP
nmap <leader>f :CtrlP<cr>

" ,f for global git serach for word under the cursor (with highlight)
nmap <leader>gf :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>

" Easy Buffer Navigation =======================================================
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l

" NO Arrow Navigation
"inoremap  <Up>     <NOP>
"inoremap  <Down>   <NOP>
"inoremap  <Left>   <NOP>
"inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>


" GUI
if has('gui_running')
  set guifont=Droid\ Sans\ Mono\ Slashed\ for\ Powerline\ 22
  " set guifont=Terminus\ for\ Powerline\ 22
  set guioptions -=T
  highlight Normal guibg=#222222
endif