if 0 | endif

if &compatible
  set nocompatible               
endif

set runtimepath+=~/.nvim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.nvim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'trusktr/seti.vim'
NeoBundle 'scrooloose/nerdtree'

NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'

NeoBundle 'jceb/vim-orgmode'
NeoBundle 'PotatoesMaster/i3-vim-syntax'
NeoBundle 'rpdelaney/vim-sourcecfg'
NeoBundle 'dag/vim-fish'

NeoBundle 'chrisbra/Colorizer'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

" show lines
set number
" tab size
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4

" keybindings, weird that i need to duolicate them for all modes
" ; instead of :
nmap ; :
" nerdtree
nmap <silent> <A-b> :NERDTreeToggle<CR>
nmap <silent> <A-S-b> :NERDTreeFocus<CR>
vmap <silent> <A-b> :NERDTreeToggle<CR>
vmap <silent> <A-S-b> :NERDTreeFocus<CR>
imap <silent> <A-b> :NERDTreeToggle<CR>
imap <silent> <A-S-b> :NERDTreeFocus<CR>
" ctrl-c ctrl-v ctrl-x ctrl-z
behave mswin
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
" muh windows
nmap <silent> <A-q> :q!<CR>
nmap <silent> <A-S-q> :bdelete!<CR>
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
nmap <silent> <A-Enter> :split<CR>
" select all
nmap <C-a> ggVG
" path to current file
nmap <silent> <C-u> :let @+ = expand("%:p") <bar> :echo expand('%:p')<CR>
" ctrl-s for saving
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>
" quit
noremap <silent> q :quit!<CR>
" line selection
nmap l V
nmap L dd
nmap l[ d0
nmap l] d$
" home and end
nnoremap <C-Home> <Home>
nnoremap <C-End> <End>
inoremap <C-Home> <Home>
inoremap <C-End> <End>
nnoremap <End> <C-End>
nnoremap <Home> <C-Home>
inoremap <Home> <C-Home>
inoremap <End> <C-End>
" next and prev search result
nnoremap ] n
nnoremap [ N
nnoremap <silent> <Esc> :nohl<CR><C-l>
" normie backspace usag
nnoremap <Backspace> x
nnoremap <C-Backspace> dw
" poweline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'murmur'

" colors
:let g:colorizer_auto_color = 1

