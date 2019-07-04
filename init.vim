

" Call Vim-Plug -- My Plugin Manager
call plug#begin()



Plug 'scrooloose/nerdtree' "Trying out nerdtree as a replacement for bolt.vim
Plug 'arakashic/chromatica.nvim', { 'do': ':UpdateRemotePlugins'} "Chromatica -- syntax highlighting
" Plug 'neoclide/coc.nvim', {'branch': 'release'} "intellisense (can't install
" nodejs)
" Plug 'valloric/youcompleteme' "Replacement for coc.vim, used for autocomplete, got rid of this because it doesn't work well for C
Plug 'neomake/neomake' "Automatically compiles the code when you write the buffer (:w)
Plug 'airblade/vim-gitgutter' "Adds a git diff indicator in the gutter (on the left)
Plug 'vim-airline/vim-airline' "Adds the colorful bar at the bottom of the screen
"Plug 'junegunn/fzf' "Command line fuzzy finder
Plug 'ctrlpvim/ctrlp.vim' "I didn't like fzf very much, so trying out ctrlp 
Plug 'tpope/vim-surround' "Easily create and delete surrounds (brackets, quotes)
Plug 'Yggdroot/indentLine' "Creates the vertical bars showing start and end of functions
Plug 'junegunn/goyo.vim' "Allows for much simpler text writing in vim (for writing papers, not code) 


call plug#end()

" Set the all-important leader command (used in Normal Mode)
let mapleader= ","

let g:indentLine_char = '|' "This sets the vertical bar to always be the pipe symbol
let g:indentLine_enabled = 1 "Make sure the lines are always enabled


let g:ctrlp_map = '<leader>c' " Change my keybind for ctrlp to be <leader>c
let g:ctrlp_cmd = 'CtrlP'

map <leader>n :NERDTreeToggle<CR>

call neomake#configure#automake('w') "Uses neomake to compile the code right after you write the buffer


set showmatch           " Show matching brackets.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=4           " Render TABs using this many spaces.
set shiftwidth=4        " Indentation amount for < and > commands.

set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
    set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
    set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.

" Toggles the relative numbering instead of absolute
function! NumberToggle()
	if(&relativenumber == 1)
		set nornu
		set number
	else
		set rnu
	endif
endfunc

" Set the toggle key for the relative numbering
nnoremap <leader>r :call NumberToggle()<cr>


" Improve the search and replace function

set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>
