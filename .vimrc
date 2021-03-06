execute pathogen#infect()
syntax on
filetype plugin indent on


"setup nerdtree
map <C-n> :NERDTreeToggle<CR>

"setup notes
:let g:notes_directories = ['~/Documents/notes']
:let g:notes_suffix = '.markdown'

"setup term
set splitbelow
set splitright

"make text no longer that 80 columns
let &colorcolumn=join(range(79,80),",")

"setup fzf
set rtp+=~/.fzf

"setup lightline
set laststatus=2
