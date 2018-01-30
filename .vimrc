if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')

Plug 'andrewradev/splitjoin.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'alvan/vim-closetag'
Plug 'christoomey/vim-tmux-navigator'
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
Plug 'tpope/vim-abolish'
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

" Tabs and indentation
filetype plugin indent on
set autoindent
set backspace=start,indent,eol
set tabstop=2
set softtabstop=2
set shiftwidth=2
retab

" Split panes
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Misc
set autowriteall        " save file on buffer switch
set expandtab           " insert spaces when tab key is pressed
set hlsearch            " highlight all matches after entering search pattern
set incsearch           " highlight while searching
set nobackup            " get rid of annoying ~file
set noswapfile          " get rid of annoying swap file
set number              " display line numbers
set nofoldenable        " disable folding
set mouse=a             " enable the mouse(...for now)
set colorcolumn=80,100
set wildignore+=:*.jpg,*.png,*.zip,.DS_Store,./tmp/*,**/node_modules
set ruler

" Set the spacebar key as the leader
let mapleader = " "

" Git Grep (G[g]rep) the selection
vnoremap <Leader>g y:Ggrep '<C-r>"'<CR>

" Git Grep (G[g]rep) the word under the cursor
nnoremap <Leader>g :Ggrep <C-r><C-w><CR>

" Clear highlighted search results
nmap <Leader>h :nohlsearch<CR>

" Shortcuts for getting out of insert mode quickly
imap jk <esc>
imap jj <esc>j
imap kk <esc>k

" Copy selection to system clipboard
vnoremap <C-c> "+y

" Treat *.md files as Markdown instead of Modula-2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['ruby', 'bash=sh']

" Resize panes when vim is resized
autocmd VimResized * :wincmd =

" Zoom a vim pane
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>

" Reblance all open vim panes
nnoremap <leader>= :wincmd =<cr>

" NERDTree configuration
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize=25
nnoremap <C-O> :NERDTreeToggle <CR>

" vim-jsx coniguration
let g:jsx_ext_required = 0

" vim-closetag configuration
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.jsx"

" rails.vim configuration
let g:rails_projections = {
\   "app/assets/javascripts/components/*.jsx": {
\     "command": "react",
\   },
\   "app/forms/*.rb": {
\     "command": "form",
\     "affinity": "model",
\     "test":"test/forms/%i_test.rb",
\     "related":"app/controllers/%p_controller.rb",
\   }
\}

" splitjoin.vim configuration
let g:splitjoin_ruby_trailing_comma = 1
let g:splitjoin_ruby_hanging_args = 0

" Speed up CtrlP by using ag for listing files.
" https://github.com/ggreer/the_silver_searcher
if executable('ag')
  set grepprg=ag
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif
