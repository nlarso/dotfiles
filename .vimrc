if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'kien/ctrlp.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'vim-ruby/vim-ruby'
Plug 'tomtom/tcomment_vim'
Plug 'ekalinin/Dockerfile.vim'

call plug#end()

" Colors
syntax enable
set t_Co=256
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

set autowriteall        " save file on buffer switch
set colorcolumn=81      " highlight 81st column to discourage long lines
set expandtab           " insert spaces when tab key is pressed
set hlsearch            " highlight all matches after entering search pattern
set incsearch           " highlight while searching
set nobackup            " get rid of annoying ~file
set noswapfile          " get rid of annoying swap file
set number              " display line numbers

" Tabs and indentation
filetype indent on
set autoindent
set backspace=start,indent,eol
set tabstop=2
set softtabstop=2
set shiftwidth=2
retab
set expandtab

" Set the leader from \ to '
let mapleader = "'"

" Toggle NERDTree
nnoremap <C-O> :NERDTreeToggle <CR>

" Close all but current buffer
nnoremap <leader>B :1,999bd<CR><C-^>

" Git Grep (G[g]rep) the selection
vnoremap <Leader>g y:Ggrep '<C-r>"'<CR>

" Git Grep (G[g]rep) the word under the cursor
nnoremap <Leader>g :Ggrep <C-r><C-w><CR>

" Clear highlighted search results
nmap <Leader>h :nohlsearch<cr>

" Shortcuts for getting out of insert mode quickly
imap jk <esc>
imap jj <esc>j
imap kk <esc>k

" Highlight 81st column to discourage long lines.
set colorcolumn=81

" Fix indentation across page
map <Leader>i mmgg=G'm<CR>
