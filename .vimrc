
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'google/vim-colorscheme-primary'
Plugin 'chriskempson/base16-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""
"Plugins for vim:
	" syntastic
	" NERDTree
	" vim-airline
	" undotree

" use pathogen!
set nocp
call pathogen#infect()
set lazyredraw
set laststatus=2

" set guifont=Source\ Code\ Pro\ for\ Powerline
set guifont=Meslo\ LG\ M\ DZ\ Regular\ for\ Powerline
set encoding=utf-8
let g:airline_theme	= 'solarized'
let g:airline_enable_branch	= 1
let g:airline_enable_syntastic = 1
let g:airline_powerline_fonts	= 1
let g:Powerline_symbols = 'fancy'

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" No longer need this garbage with the right font! (Go Meslo)
" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'

" show multiple buffers in same tab
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" disable silly LaTeX magical additions
let g:Imap_UsePlaceHolders = 0
let g:Imap_FreezeImap=1

" vim-latex suite settings
filetype plugin on
filetype indent on
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
set pastetoggle=<F2>

func! WordProcessorMode()
    setlocal formatoptions=t1
    setlocal textwidth=80
    map j gj
    map k gk
    setlocal smartindent
    setlocal spell spelllang=en_us
    setlocal noexpandtab
endfu
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

"Misc"
nnoremap S :SyntasticToggleMode<CR>
nnoremap SC :SyntasticCheck<CR>
" map N :NERDTree<CR>
map NT :NERDTreeToggle<CR>
map NS :NERDTreeMirror<CR>
map NQ :NERDTreeClose<CR>
map NB :Bookmark<Space>
map NBO :OpenBookmark<CR>
map NBQ :ClearAllBookmarks<CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_loc_list_height = 3

"Nerdtree
" autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

""" Requires colors """
" set background=light
" colorscheme primary
" colorscheme base16-default
" colorscheme hybrid
" colorscheme gruvbox
colorscheme solarized
set background=dark

"""""" ------------------------------------------- """"""
"""""" Barebones Vim settings without any packages """"""
"""""" ------------------------------------------- """"""

" Make Vim more useful
set nocompatible

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
" Set color scheme!¬
set clipboard=unnamed

" Enhance command-line completion
set wildmenu

" Allow cursor keys in insert mode
set esckeys

" Allow backspace in insert mode
set backspace=indent,eol,start

" Optimize for fast terminal connections
set ttyfast

" Add the g flag to search/replace by default
set gdefault

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Enable syntax highlighting
syntax on

" Enable line numbers
set number

" Highlight searches
set hlsearch

" Highlight dynamically as pattern is typed
set incsearch
set mouse=a

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show the current mode
set showmode

" Show the filename in the window titlebar
set title

" Show the (partial) command as it’s being typed
set showcmd

" Start scrolling three lines before the horizontal window border
set scrolloff=2

" enable 256 colors
set t_Co=256

" syntax enable
" set background=dark
colorscheme zellner

" Unsets the last search pattern register by hitting return
nnoremap <CR> :noh<CR><CR>

" Prefernces for buffer manipulation:
" New empty buffer
let mapleader = ","
nmap <Leader>T :enew<CR>

" Move to the next buffer
nmap <Leader>l :bnext<CR>

" Move to the previous buffer
nmap <Leader>h :bprevious<CR>

" Close current buffer and move to previous one
nmap <Leader>bq :bp <BAR> bd #<CR>

"Show all open buffers and their status
nmap <Leader>bl :ls<CR>

"Buffer mappings"
nnoremap <C-Up> <C-W><C-J>
nnoremap <C-Down> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>
nnoremap <C-O> <C-W><S-T>
nnoremap <F4> :bd<CR>
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <C-S-Right> :bnext<CR>
nnoremap <C-S-Left> :bprevious<CR>
nnoremap [v :vsplit<Space>
nnoremap [s :set splitright<CR>
nnoremap [ns :set nosplitright<CR>

set noexpandtab
set visualbell
set smartindent
set autoindent

" Set spellcheck on/off
" set spell

" size of a hard tabstop
set tabstop=2

" size of an "indent"
set shiftwidth=2

set softtabstop=2
set expandtab

" Automatically remove trailing whitespace
autocmd FileType c,cpp,java,php,python,markdown,matlab,lua,javascript,html,vim,zsh,sh autocmd BufWritePre <buffer> %s/\s\+$//e

" Set color column at 80 chars
set colorcolumn=80
