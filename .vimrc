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
:set textwidth=80
:set colorcolumn=+1
