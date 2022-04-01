execute pathogen#infect()
syntax on
filetype plugin indent on

"setup term
set splitbelow
set splitright

"setup fzf
set rtp+=~/.fzf

"setup lightline
set laststatus=2

"make delete work as backspace in insert mode
set backspace=2

map <leader>p :call InsertLine()<CR>

function! InsertLine()
  let trace = expand("breakpoint()")
  execute "normal o".trace
endfunction
set regexpengine=0

"line numbers
set nu

call plug#begin()
 Plug 'tpope/vim-commentary'
 Plug 'scrooloose/nerdtree'
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'junegunn/fzf.vim'
 Plug 'itchyny/lightline.vim'
 Plug 'tpope/vim-fugitive'
call plug#end()

"" fzf.vim
"" Quickly find and open a recently opened file
map <leader>o :Buffers<CR>
map <leader>j :GFiles<CR>
map <leader>J :Files<CR>
map <leader>r :Rg<CR>

map <leader>f :History<CR>
map <leader>l :Lines<CR>
map <leader>s :Snippets<CR>
map <leader>; :Commands<CR>
map <leader>m :Maps<CR>
map <leader>t :NERDTreeToggle<CR>

let NERDTreeShowHidden=1

