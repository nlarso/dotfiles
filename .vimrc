if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

Plug 'andrewradev/splitjoin.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'alvan/vim-closetag'
Plug 'ekalinin/Dockerfile.vim'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'kien/ctrlp.vim'
Plug 'mxw/vim-jsx'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'slim-template/vim-slim'
Plug 'tmhedberg/matchit'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-ruby/vim-ruby'

call plug#end()

" Colors
syntax enable
set t_Co=256
set background=dark
let g:solarized_termcolors=16
colorscheme solarized
set colorcolumn=81

" Tabs and indentation
filetype plugin indent on
set autoindent
set backspace=start,indent,eol
set tabstop=2
set softtabstop=2
set shiftwidth=2
retab
set expandtab

" Misc
set autowriteall        " save file on buffer switch
set expandtab           " insert spaces when tab key is pressed
set hlsearch            " highlight all matches after entering search pattern
set incsearch           " highlight while searching
set nobackup            " get rid of annoying ~file
set noswapfile          " get rid of annoying swap file
set number              " display line numbers

" Set the leader from \ to '
let mapleader = "'"

" Toggle NERDTree
nnoremap <C-O> :NERDTreeToggle <CR>

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

" Treat *.md files as Markdown instead of Modula-2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['ruby', 'bash=sh']

" vim-jsx coniguration
let g:jsx_ext_required = 0

" vim-closetag configuration
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.jsx"

" rails.vim configuration
let g:rails_projections = {
\   "app/assets/javascripts/components/*.jsx": {
\     "command": "react",
\   }
\}
