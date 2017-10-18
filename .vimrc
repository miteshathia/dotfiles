" ========================================
" PLUGINS
" ========================================

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'                         " file navigation
Plug 'Xuyuanp/nerdtree-git-plugin'                 " shows git status in NERDTree
Plug 'airblade/vim-gitgutter'                      " git diff in gutter
Plug 'tpope/vim-fugitive'                          " git wrapper
Plug 'wincent/command-t'                           " fuzzy file search
Plug 'sheerun/vim-polyglot'                        " syntax pack
Plug 'easymotion/vim-easymotion'                   " moving around files with greater speed
Plug 'scrooloose/nerdcommenter'                    " easier commenting
Plug 'ap/vim-css-color'                            " color previews
Plug 'Yggdroot/indentLine'                         " indent lines
Plug 'dyng/ctrlsf.vim'                             " Sublime-like find in files
Plug 'w0rp/ale'                                    " async linting
Plug 'junegunn/vim-slash'                          " improved searching
Plug 'tpope/vim-surround'                          " surroundings
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
" colorschemes
Plug 'cocopon/iceberg.vim'
Plug 'rakr/vim-one'
Plug 'mathia4/gruvbox'

call plug#end()


" ========================================
" GENERAL CONFIG
" ========================================

set autoindent
set backspace=2                                    " allows backspacing
set wildmenu                                       " tab completion of menu commands
set incsearch                                      " jump to search match while typing
set list listchars=eol:¬,tab:▸\ ,trail:·           " show invisible chars
set number relativenumber                          " shows line numbers
set shiftwidth=2                                   " number of spaces for indents
set tabstop=2                                      " size of tab character in spaces
set softtabstop=2                                  " number of spaces for tab in insert mode
set expandtab                                      " tabs become spaces
set updatetime=750                                 " 250ms update time
set fillchars=""                                   " changing pane separator char
set cursorline                                     " highlights active line
set laststatus=2                                   " always show status line
set clipboard=unnamed                              " copy+pasta to and from system clipboard
set hlsearch                                       " highlight all matching search terms
set mouse=a                                        " can use mouse to scroll and select
set termguicolors                                  " truecolor
set statusline=%=%P\ %f\ %m
set omnifunc=syntaxcomplete#Complete               " IntelliSense-like autocompletion

let &colorcolumn="80,".join(range(120,373),",")    " colorcolumn at line 80 and 120+

" changes the cursor shape depending on the mode
if exists('$TMUX')
  let &t_SI="\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI="\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SR="\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
else
  let &t_SI="\<Esc>]50;CursorShape=1\x7"
  let &t_EI="\<Esc>]50;CursorShape=0\x7"
  let &t_SR="\<Esc>]50;CursorShape=2\x7"
endif

filetype plugin indent on                          " filetype detect and indent

set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox


" ========================================
" KEYMAPS
" ========================================

" make Y do what C and D do
noremap  Y       y$
" navigating more easily
noremap  <C-k>   5k
noremap  <C-j>   5j
" switching windows/panes
noremap  <Tab>   <c-w>w
noremap  <BS>    <c-w>W


" ========================================
" PLUGIN SPECIFIC
" ========================================

" nerdtree ===============================
nnoremap <Leader>nf :NERDTreeFind<CR>
nnoremap <Leader>nt :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" syntastic ==============================
let g:ale_sign_error='●'
let g:ale_sign_warning='●'

" indentLine =============================
let g:indentLine_faster=1

" ctrlsf =================================
nmap <Leader>ff <Plug>CtrlSFPrompt
vmap <Leader>ff <Plug>CtrlSFVwordPath
vmap <Leader>fF <Plug>CtrlSFVwordExec
nmap <Leader>fn <Plug>CtrlSFCwordPath
let g:ctrlsf_mapping={"vsplit": "<Space>"}

" command-t ==============================
let g:CommandTWildIgnore=&wildignore . ",*/bower_components,*/node_modules"

" vim-devicons ===========================
let g:WebDevIconsNerdTreeAfterGlyphPadding=' '
let g:WebDevIconsNerdTreeGitPluginForceVAlign=0

" nerdcommenter ==========================
let g:NERDSpaceDelims=1
let g:NERDDefaultAlign='left'

" tagbar =================================
nnoremap <Leader>tt :TagbarToggle<CR>

