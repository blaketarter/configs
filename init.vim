" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()

"General Plugins
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'blueshirts/darcula'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tomtom/tcomment_vim'
" Plug 'scrooloose/syntastic'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'pgdouyon/vim-accio'
Plug 'rking/ag.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

"Git Plugins
Plug 'mhinz/vim-signify'

"HTML and CSS Plugins
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
Plug 'Valloric/MatchTagAlways'
Plug 'digitaltoad/vim-jade'

"Javascript Plugins
Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node'
Plug 'ain/vim-npm'
Plug 'ain/vim-bower'
Plug 'kchmck/vim-coffee-script'
Plug 'Chiel92/vim-autoformat'

"Java/Android/Gradle plugins
Plug 'artur-shaik/vim-javacomplete2'
Plug 'idanarye/vim-vebugger'
Plug 'tfnico/vim-gradle'

"Host
Plug 'neovim/node-host', {'do':'npm install'}

"I made this
Plug '~/Plugins/CSSBeautifier.nvim', {'do':'npm install'}

call plug#end()

colorscheme darcula

syntax on
set number
set tabstop=2
set expandtab
set shiftwidth=2
set smartcase
set hlsearch
"set autoindent
set incsearch
set clipboard+=unnamedplus
set noswapfile
set list listchars=tab:»·,trail:·,nbsp:·
set numberwidth=5
set number
:se mouse+=a
set tabstop=2
set expandtab
set shiftwidth=2
set smartcase
set hlsearch
set incsearch
set whichwrap+=<,>,h,l,[,]
set background=dark
set noswapfile
set undofile
set undodir=~/.vim/undodir
let g:NumberToggleTrigger="<F2>"
let mapleader=","
set scrolloff=10
noremap U :redo<cr>
set showcmd

"Better indent
vnoremap < <gv
vnoremap > >gv

"Alt + Left and Right switch buffers
"nnoremap <silent> <M-Right> :bnext<CR>
"nnoremap <silent> <M-Left> :bprevious<CR>
"nnoremap <silent> <M-Del> :bd

"Some nice mappings for ag
nnoremap <C-p> :FZF<ENTER>

"Automatically go back to where you were last editing this file
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" |
  \ endif

"Automatically load .vimrc changes
au BufWritePost init.vim so $MYVIMRC

"Make TComment work as I expect
noremap <leader>/ :TComment <CR>
vmap <leader>/ :TCommentBlock<CR>

"Nertree Toggle
map <C-n> :NERDTreeToggle<CR>
nnoremap <Alt-Left> <C-W><C-H>
nnoremap <Alt-Right> <C-W><C-L>

let g:airline_theme="zenburn"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_sep = ''

" HTML/CSS/Markdown/Octopress Stuff

let g:user_emmet_install_global = 0

autocmd FileType html,css,eruby EmmetInstall
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css,scss,sass setlocal iskeyword+=-
au BufReadPost *.vue set syntax=html
au BufReadPost *.hbs set syntax=html

"Syntastic Settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['eslint']

autocmd! BufWritePost *.java Accio gradle assembleDebug

"Setup Javacomplete2 as omnifunc
autocmd FileType java setlocal omnifunc=javacomplete#Complete

autocmd FileType java nnoremap <F8> :call javacomplete#imports#Add()<CR>
autocmd FileType java nnoremap <F6> :call javacomplete#imports#RemoveUnused()<CR>
autocmd FileType java nnoremap <F7> :call javacomplete#imports#AddMissing()<CR>
" let g:syntastic_mode_map = { 'passive_filetypes': ['java'] }

let NERDTreeShowHidden=1

"Setup project specific vim files
set exrc
set secure
