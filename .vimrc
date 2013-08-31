" Vundle ----------------------------------------------------------------------
" -----------------------------------------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle (required!)
Bundle 'gmarik/vundle'

Bundle 'BonsaiDen/vim-powerline' 
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-fugitive'
Bundle 'sjl/gundo.vim'
Bundle "groenewege/vim-less"
Bundle "msanders/snipmate.vim"
Bundle "tpope/vim-markdown"
Bundle "kien/ctrlp.vim"
filetype on


" VIM UI Basics ---------------------------------------------------------------
" -----------------------------------------------------------------------------
set t_Co=256
set background=dark
colorscheme symfony
set number
syntax enable
filetype plugin on
"set guifont=Monospace\ 8

" Plugin configs --------------------------------------------------------------
" -----------------------------------------------------------------------------
let g:superTabDefaultCompletionType = "context"
let g:syntastic_stl_format = ' %E{%e ERR #%fe} ' "[%E{Err: %e #%fe}%B{, }%W{Warn: %w #%fw}]'
let g:syntastic_auto_loc_list = 2 "auto close
let g:syntastic_cpp_check_header = 1

" Nerd Tree
let NERDTreeIgnore = ['\.pyc$', '\.h\.gch$', '\.o$', '^node_modules$']
let NERDTreeShowBookmarks=1

" Super Tab
let g:SuperTabCrMapping = 1
let g:SuperTabMappingForward = '<S-tab>'
let g:SuperTabMappingBackward = '<tab>'
let g:fuf_buffer_keyDelete = '<C-d>'

" Gundo 
let g:gundo_right = 1

" Control P
set wildignore+=*.o,*.obj " ignore these files
let g:ctrlp_max_depth = 40
let g:ctrlp_max_files = 10000
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|node_modules\|\.svn$',
    \ 'file': '\.git.*\|\.exe$\|\.so$\|\.o$\|\.ghc$',
    \ }


" Options ---------------------------------------------------------------------
" -----------------------------------------------------------------------------

" Completion
set ofu=syntaxcomplete#Complete
set ofu=javascript#Complete
set completeopt=menuone

" fix clipboad mess under ubuntu (needs vim 7.3+)
set clipboard=unnamedplus
let g:clipbrdDefaultReg = '+'

" Smart tabbing / autoindenting
set undolevels=1000 " More undo history please
set autoindent " Apply auto indenting if avaialble
set virtualedit=all " Allow to edit in-place anywhere, even on blank lines
set nostartofline " During movement, try to stay on the same column even on empty lines

" UI
set laststatus=2 " Statusline setup
set scrolloff=4 " Keep 4 lines top/bottom when scrolling
set hidden " ingore background buffers with changes 
set fillchars="" " Don't show fill characters in V-split separators
set shortmess+=Iat " Skip intro message, abbreviate most other message and truncate if required

" Disable error bells and flashing
set noerrorbells
set visualbell
set t_vb=

" No backups please, we got git after all
set nobackup
set nowb
set noswapfile

" Characters / Tabs / Spaces / Indentation
set enc=utf-8 " Default encoding is UTF-8
set listchars=tab:▸\ ,eol:¬ " Show tab and eol chars
set smarttab " activate smarttabs
set shiftwidth=4 " when auto-indenting, indent by this much
set tabstop=4 " expand tabs to 4 spaces
set expandtab " turn tabkeypresses into spaces
set softtabstop=4 " treate tabkey as 4 spaces but respect hard hard tabs

set nowrap " No automatic wrappring
set equalalways " Automatically resize split windows to have the same aspect
set mouse=n " Allow mouse ONLY in normal mode (since you can scroll any window on gnome without focussing it)
set cc=80 " Yes. I like it that way.
set backspace=eol,start,indent " Make backspace jump over all charaters, can also be done via "set backspace=2"

" Search and Highlighting
set wrapscan " Automatically search from the top if nothing is found
set magic 
set showmatch " Show matches
set hlsearch " Highlight search
set incsearch " Apply search pattern on each keystroke
set ignorecase  " Ignore casing by default
set smartcase " Require casing in case any upper case character is in the pattern

" Folding
set nofoldenable "dont fold by default
set foldmethod=indent "fold based on indent
set foldnestmax=1 "deepest fold is 10 levels
set foldlevel=1 "this is just what i use

" All other options
set ttyfast " assume fast terminal
set lazyredraw " Don't redraw while in macros

" Command line completion options
set wildmenu " Enable auto complete
set wildmode=list:longest,full "show all, select longest first

" Spelling dict file
set spellfile=~/.vim/dict.add



" Mappings --------------------------------------------------------------------
" -----------------------------------------------------------------------------

" ESC is aweful to hit, Shift+3 (paragraph) is way more convinient on a GER layout
noremap! <silent> § <ESC>
vnoremap <silent> § <ESC>
snoremap <silent> § <ESC>

" Remap sharp S to insert opening and closing braces with indent and cursor
" placed between them
inoremap ß {<CR>}<ESC>ko<Tab>

" Inserting blank lines is useful too
nnoremap <silent> <c-o> o<ESC>k

" Jump to last edited line, useful at times
nnoremap <silent> ü '.

" Command T and syntastic Error list
nmap <silent> <C-o> :CtrlPBuffer<CR>
nnoremap <silent> <C-e> :Errors<CR>

" Speedier movements
nnoremap <silent> <S-k> 3k
vnoremap <silent> <S-k> 3k
nnoremap <silent> <S-j> 3j
vnoremap <silent> <S-j> 3j

" I always manage to hit these at random, so fix / ignore it
nnoremap <silent> + <nop>
command! W w
command! E e

" Surround plugin
"nmap ö ysw

" Quicker selects
nmap Ü viB
nmap Ä vi]

" Remap umlauts for fast insertion of common characters
imap ö [
imap ä {
inoremap Ö -><ESC>a

" Don't loose selection when indenting or outdenting
vnoremap <silent> > >gv
vnoremap <silent> < <gv

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
" use nmap otherwise insert mode with snipmate breaks on n / N / *
" it also centers the window on the search when using either n or N
nmap N Nzz
nmap n nzz
nmap * *N

" F Key Mappings
nnoremap <silent> <F4> :nohl<CR> 
nnoremap <silent> <F5> :GundoToggle<CR>
nnoremap <silent> <F7> :NERDTreeToggle<CR>
nnoremap <silent> <F2> :so ~/.vimrc<CR>

" Print out highlight group for colorscheme editing
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


" Automatically highlight the cursorline when changing windows / buffers
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
autocmd BufWinEnter * setlocal cursorline
autocmd BufWinLeave * setlocal nocursorline

" Get rid of the window command prefix making navigation a lot faster
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

" Strip trailing whitespace on save
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    " active / deactive for tabs
    "%s/\s\s\s\s/\t/ge
    call cursor(l, c)
endfun
autocmd BufWritePre *.js :call <SID>StripTrailingWhitespaces()

" Per file type
autocmd Filetype jade setlocal ts=2 sw=2 expandtab
autocmd Filetype yaml setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal tags=./tags,~/.vim/tags/javascript/tags 

" Leader key stuff
let mapleader = ","

" ,f ,w etc
let g:EasyMotion_leader_key = '<Leader>'

" Close buffer fully
nmap <silent> <Leader>bd :bd!<CR>

"map q <Nop>
nmap <silent> <Leader>q <C-w>c<CR>
nmap <silent> <Leader>m '
nmap <silent> <Leader>q @

" Join via <leader> J
vmap <silent> <Leader>J :join<CR>


" Create a Default Layout (since sessions don't play nicely with NerdTree) ----
" -----------------------------------------------------------------------------
function! s:onStart()
    :NERDTree
    wincmd p
    wincmd v
endfunction

function! g:Setup()
    autocmd VimEnter * call s:onStart()
endfunction

