"""""""""""""""""""""
" set
""""""""""""""""""""""""""""""
"syntax on   " syntax highlighting on
filetype indent on
filetype plugin indent on
set smartindent

set t_Co=256    " set number of colors
set cursorline
set nocompatible
set hidden
set path+=~/project/app/**

" use ripgrep instead of terminal grep when running the :grep command
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" display line number before each line
set relativenumber number

" for search
set hlsearch
set incsearch

" when the last window will have a status line
set laststatus=2    " 2 for always

" set tab size
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

set mouse=a

" fix backspace doesn't work in insert mode
set backspace=indent,eol,start

" use gq to split lines to fit textwidth
" why 74? to fit split window
set textwidth=74

" where to find tag file
" set tags+=../tags
set tags=./tags,tags;


""""""""""""""""""""""""""""""
" set variable
""""""""""""""""""""""""""""""
let mapleader=" "

" disable YCM, to enable it just comment this line
" let g:loaded_youcompleteme = "1"



""""""""""""""""""""""""""""""
" key mappings
""""""""""""""""""""""""""""""
" nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>n :NERDTree<CR>:set relativenumber number<CR>

" mapping for formmating code(use astyle)
nnoremap <silent> <Leader>a mm:%!astyle<CR>`mmmzz

" no highlight search
nnoremap <silent> <Leader><CR> :nohlsearch<CR>

" for save and exit
noremap <C-s> :w<CR>
noremap <C-q> :q<CR>
noremap <C-x> :x<CR>
noremap <Leader>z <C-w>_<C-w>\|
noremap R :source%<CR>

inoremap <C-H> <BS>
inoremap jj <Esc>

" for wsl
" but now wsl2 in win11 enables vim to use clipboard
" so just discard this
" " For copy code to windows clipboard
" " in visual mode, pipe the current selection to
" " terminal command clip.exe.
" " Text piped to clip.exe goes to the Windows clipboard.
" vnoremap <C-C> :w !clip.exe<CR><CR>
vnoremap <C-C> "+y

" quickly commented
noremap <C-/> I// <Esc>
vnoremap / I// <Esc>

nnoremap <Leader>cur :echo expand('%')<CR>

""""""""""""""""""""""""""""""
" plugin management
""""""""""""""""""""""""""""""
call plug#begin()

" how to disable a plugin without uninstalling it
" Plug 'developer/foo-plugin', {'on': []}

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'sonph/onehalf', {'rtp': 'vim'}
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'
" Disable a plugin
" Plug 'ycm-core/YouCompleteMe', {'on': []}
Plug 'ycm-core/YouCompleteMe'
" Plug 'tabnine/YouCompleteMe'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'luochen1990/rainbow'
call plug#end()



""""""""""""""""""""""""""""""
" configurations for vim-rainbow
""""""""""""""""""""""""""""""
"let g:rainbow_active=1



""""""""""""""""""""""""""""""
" configurations for lightline
""""""""""""""""""""""""""""""
let g:lightline = {
            \ 'colorscheme': 'nord',
            \ }



""""""""""""""""""""""""""""""
" Configurations for ycm
""""""""""""""""""""""""""""""

" This option controls for which Vim filetypes (see :h filetype) should YCM be turned off. 
let g:ycm_filetype_blacklist = {
      \ 'tagbar': 1,
      \ 'notes': 1,
      \ 'markdown': 1,
      \ 'netrw': 1,
      \ 'unite': 1,
      \ 'text': 1,
      \ 'vimwiki': 1,
      \ 'pandoc': 1,
      \ 'infolog': 1,
      \ 'leaderf': 1,
      \ 'mail': 1,
      \ 'asm': 1,
      \}

let g:ycm_enable_semantic_highlighting=1
let g:ycm_confirm_extra_conf = 0

" When this option is set to '1', YCM will auto-close the 'preview' window after
" the user accepts the offered completion string.
" To manually close scratch preview window quickly
" Ctrl-z may work, more details refer to :help :pclose
let g:ycm_autoclose_preview_window_after_completion=1


" hide/show the signature help popup
" This works well in YCM, but not in tabnine
" In tabnine you can try <C-y>
let g:ycm_key_list_stop_completion = ['<C-y>', '<C-q>']
imap <C-q> <Plug>(YCMToggleSignatureHelp)

nmap <leader>yfw <Plug>(YCMFindSymbolInWorkspace)
nmap <leader>yfd <Plug>(YCMFindSymbolInDocument)

" So you can use subcommand for YcmCompleter command less verbose
" nnoremap <leader>y :YcmCompleter<Space>
" vnoremap <leader>y :YcmCompleter<Space>

"H1--------------------------------
" Subcommands for YcmCompleter

"H2--------------------------------
" GoTo Commands
" Ctrl-o jump back, Ctrl-i jump forward

" GoToInclude subcommand.
" GoToDeclaration
" GoToDefinition
" GoTo -- Perform the "most sensible" GoTo operation.
" GoToReference
nmap <leader>ef :YcmCompleter<Space>GoToDefinition<CR>
nmap <leader>ec :YcmCompleter<Space>GoToDeclaration<CR>
nmap <leader>]  :YcmCompleter<Space>GoTo<CR>


"H2--------------------------------
" Semantic Information Commands

" GetType
" GetDoc
" GetParent

"H2--------------------------------
" Refactoring commands

" FixIt
" Format
nnoremap M :YcmCompleter<Space>Format<CR>
vnoremap M :YcmCompleter<Space>Format<CR>

" Popup not automatically displayed at the cursor location
let g:ycm_auto_hover = ""
nmap <leader>d <plug>(YCMHover)

noremap <leader>sd :YcmShowDetailedDiagnostic<CR>

" highlighted lines but no signs in the Vim gutter in diagnostic display
" set signcolumn=no



""""""""""""""""""""""""""""""
" Configurations for nord colorscheme
""""""""""""""""""""""""""""""

" Activate nord colorscheme
let filetype_name = strpart(expand("%"), stridx(expand("%"), "."))
if filetype_name != ".sh"
  colorscheme nord
endif



""""""""""""""""""""""""""""""
" Configurations fzf.vim
""""""""""""""""""""""""""""""
nnoremap <silent> <Leader>ff :Files<CR>
nnoremap <silent> <Leader>fg :Rg<CR>

" Note
" <C-v> to open vertical split
" <C-x> to open split
" <C-t> to open in a new tab

""""""""""""""""""""""""""""""
" Configurations - rainbow
""""""""""""""""""""""""""""""
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
