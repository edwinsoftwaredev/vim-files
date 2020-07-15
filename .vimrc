syntax on

set encoding=utf8
set guifont=CaskaydiaCove_Nerd_Font:h12
set guicursor=
set nowrap
set noshowmatch
set nohlsearch
set hidden
set incsearch
set smartcase
set relativenumber
set nu
set shiftwidth=2
set tabstop=2 softtabstop=2
set expandtab
set smartindent
set exrc
set noswapfile
set backupdir=~/.vim/temp
set nobackup
set undodir=~/.vim/undodir
set undofile
set scrolloff=8
set termguicolors
set showcmd

autocmd FileType cs setlocal shiftwidth=4 tabstop=4 softtabstop=4

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=95
highlight ColorColumn ctermbg=0 guibg=lightgrey

" *********************************************************************
" Plugins installations!
"
call plug#begin('~/.vim/plugged') " <-- user directory on Windows

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'omnisharp/omnisharp-vim'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'vim-utils/vim-man'
Plug 'scrooloose/nerdtree'
Plug 'nickspoons/vim-sharpenup'
Plug 'w0rp/ale'

" I AM SO SORRY FOR DOING COLOR SCHEMES IN MY VIMRC, BUT I HAVE
"  TOOOOOOOOOOOOO
" Plug 'morhetz/gruvbox'
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes' " <-- give it a try later
Plug 'flazz/vim-colorschemes'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" All of your Plugins must be added before the following line
call plug#end()            " required
"
" ********************************************************************

" gruvbox theme constrast
let g:gruvbox_contrast_dark = 'hard'
" this enable powerline fonts symbols like the arrows for the powerline
let g:airline_powerline_fonts = 1

" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1

" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1

let g:coc_node_path = '/usr/local/bin/node'

" OmniSharp settings
let g:OmniSharp_server_stdio=1
let g:OmniSharp_server_path='/mnt/c/OmniSharp/omnisharp-roslyn/artifacts/publish/OmniSharp.Stdio.Driver/win7-x64/OmniSharp.exe'
let g:OmniSharp_translate_cygwin_wsl=1
let g:omnicomplete_fetch_full_documentation=1
let g:OmniSharp_selector_ui='fzf'
let g:ale_linters={'cs': ['OmniSharp']}
let g:OmniSharp_highlighting=2
"let g:OmniSharp_typeLookupInPreview=1
"set completeopt=longest,menuone,preview
"set completepopup=highlight:Pmenu,border:off "not recognize by neovim
"set splitbelow
let g:syntastic_cs_checkers = ['code_checker']
set completeopt-=preview

" to move upwards use: CTRL-Y
" to move downwards use: CTRL-E
let g:OmniSharp_popup_options = {
    \ 'maxwidth': 115,
    \ 'minwidth': 115,
    \ 'minheight': 15,
    \ 'maxheight': 15,
    \ 'padding': [0, 1, 0, 1]
    \}

let g:NERDTreeWinSize = 45

colorscheme gruvbox
set background=dark

"if executable('rg')
" let g:rg_derive_root='true'
"endif

let loaded_matchparen = 1
let mapleader = " "

" let g:netrw_browse_split = 2
" let g:vrfr_rg = 'true'
" let g:netrw_banner = 0
" let g:netrw_winsize = 25

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

vnoremap X "_d
inoremap <C-c> <esc>

" Vim with me
nnoremap <leader>vwm :colorscheme gruvbox<bar>:set background=dark<CR>
nmap <leader>vtm :highlight Pmenu ctermbg=gray guibg=gray

function! s:check_back_space() abort
 let col = col('.') - 1
 return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Conf 1
inoremap <silent><expr> <TAB>
         \ pumvisible() ? "\<C-n>" :
         \ <SID>check_back_space() ? "\<TAB>" :
         \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" :"\<C-h>"
inoremap <silent><expr> <C-space> coc#refresh()

"******************************************************
" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart

nnoremap <silent><leader>dv :call <SID>show_coc_docs()<CR>
fun! s:show_coc_docs()
 if &filetype == 'vim'
  execute 'h '.expand('<cword>')
 else
  call CocAction('doHover')
 endif
endfunction

" Sweet Sweet FuGITive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

map <C-n> :NERDTreeToggle<CR>

" OmniSharp mappings *********************************************************
augroup omnisharp_commands
    autocmd!
    " show type information automatically when the cursor stops moving.
    " Note that type is echoed to the Vim command  line, and will overwrite
    " any other messages in this space including e.g ALE linting messages

    " I commented this. To lookup the type I have to use the mappings
    " autocmd CursorHold *.cs OmniSharpTypeLookup
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    " the following commands are contextual, based on the cursor position
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dv :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

    " Find all code errors/warnings for the current solution and populate the
    " quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#actions#codeactions#Get('visual')<CR>

" Remane with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename
" newname`
command! -nargs=1 Rename :call OmniSharp#actions#rename#To("<args>")
nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>
"******************************************************************************

fun! TrimWhitespace()
 let l:save = winsaveview()
 keeppatterns %s/\s\+$//e
 call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()
"autocmd VimEnter,SourcePre,BufEnter,BufNew * stopinsert

" this is to desactivate the insert mode at startup
" autocmd SourcePre * stopinsert
