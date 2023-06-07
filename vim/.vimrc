let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'francoiscabrol/ranger.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'liuchengxu/vim-which-key'
Plug 'ruanyl/vim-gh-line'
Plug 'hashivim/vim-terraform'
Plug 'jasonccox/vim-wayland-clipboard'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jiangmiao/auto-pairs'
Plug 'gko/vim-coloresque'
Plug 'KabbAmine/vCoolor.vim'
Plug 'janko-m/vim-test'
Plug 'LnL7/vim-nix'
Plug 'tpope/vim-fugitive'
Plug 'jparise/vim-graphql'
Plug 'pearofducks/ansible-vim'
Plug 'tpope/vim-rhubarb'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

set exrc
set secure

colorscheme monokai

set encoding=UTF-8
set mouse=a

set number
set relativenumber
set cursorline
set undofile
set autoread
set expandtab
set smartindent
set nocompatible
set splitbelow
set splitright

autocmd FileType crontab setlocal nobackup nowritebackup
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType json setlocal ts=2 sts=2 sw=2
autocmd FileType zsh setlocal ts=2 sts=2 sw=2
autocmd FileType sh setlocal ts=2 sts=2 sw=2
autocmd FileType c setlocal ts=4 sts=4 sw=4
autocmd FileType typescript setlocal ts=2 sts=2 sw=2
autocmd FileType typescript.tsx setlocal ts=2 sts=2 sw=2
autocmd FileType ruby setlocal ts=2 sts=2 sw=2
autocmd FileType php setlocal ts=4 sts=4 sw=4
autocmd FileType ccpp setlocal ts=4 sts=4 sw=4
autocmd FileType xml setlocal ts=2 sts=2 sw=2
autocmd FileType css setlocal ts=2 sts=2 sw=2
autocmd FileType json syntax match Comment +\/\/.\+$+

autocmd BufEnter *.tsx set filetype=typescript.tsx
autocmd BufEnter *.jsx set filetype=javascript.jsx
autocmd BufEnter *.sls set filetype=yaml

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

inoremap jk <Esc>
tnoremap <Esc> <C-\><C-n>

set clipboard=unnamedplus

let mapleader = "\<Space>"
let maplocalleader = ","

let g:which_key_map = {}

let g:ranger_map_keys = 0 " Ranger auto maps this to <leader>f

let g:which_key_map.r = ['Ranger', 'Ranger File Browser']

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
        if (index(['vim', 'help'], &filetype) >= 0)
                execute 'h '.expand('<cword>')
        else
                call CocAction('doHover')
        endif
endfunction

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

let g:coc_global_extensions =
  \[
  \  '@yaegassy/coc-intelephense',
  \  'coc-flutter',
  \  'coc-go',
  \  'coc-prettier',
  \  'coc-tsserver'
  \]

"----- Buffers
let g:which_key_map.b = { 'name' : 'Buffers',
               \ 'n' : ['BufferNext', 'Next Buffer'],
               \ 'p' : ['BufferPrevious', 'Previous Buffer'],
               \ }

let g:which_key_map.r = ['Ranger', 'Ranger File Browser']

let g:which_key_map.f = { 'name' : 'Files',
               \ 'f' : ['Files', 'Find Files FZF'],
               \ 'g' : ['GFiles', 'Find GIT Files FZF'],
               \ 'G' : ['GFiles?', 'Find GIT Files FZF with Changes'],
               \ }

let g:which_key_map.b = { 'name' : 'Buffer',
               \ 'd' : ['bd', 'Close buffer'],
               \ }

"----- Fugitive ( Git ) 
let g:which_key_map.g = { 'name' : 'Fugitive',
               \ 'g' : ['Git', 'Call a git command'],
               \ 'b' : ['Git blame', 'Blame'],
               \ 'd' : ['Git diff', 'Git Diff'],
               \ 'l' : ['Git log', 'Git log'],
               \ 'm' : ['Git mergetool', 'Git mergetool'],
               \ 'D' : ['Git difftool', 'Git difftool'],
               \ 'c' : ['Git commit', 'Git commit'],
               \ 'B' : ['GBrowse', 'Open in browser'],
               \ 'C' : ['Commits', 'FZF Commits'],
               \ 'a' : ['BCommits', 'FZF Current Buffer Commits'],
               \ }

let g:which_key_map.w = { 'name' : 'Windows',
	       \ 'd' : ['close', 'Close Window'],
	       \ 's' : ['split', 'Horizontal Split'],
	       \ 'v' : ['vsplit', 'Vertical Split'],
	       \ 'h' : ['<C-W>h', 'Move Left'],
	       \ 'l' : ['<C-W>l', 'Move Right'],
	       \ 'j' : ['<C-W>j', 'Move Down'],
	       \ 'k' : ['<C-W>k', 'Move Up'],
	       \ 't' : ['call MaximizeToggle()', 'Close Others'],
	       \ '=': ['wincmd =', 'Resize Equally'],
	       \ }

"----- Testing
let g:which_key_map.t = { 'name' : 'Testing',
               \ 'n' : ['TestNearest', 'Nearest'],
               \ 'f' : ['TestFile', 'File'],
               \ 's' : ['TestSuite', 'Suite'],
               \ 'l' : ['TestLast', 'Last'],
               \ 'v' : ['TestVisit', 'Visit Last'],
               \ }

let g:which_key_map.m = { 'name' : 'Markdown',
               \ 'p' : ['MarkdownPreviewToggle', 'Toggle MD Preview'],
               \ }

let g:which_key_map.z = { 'name': 'FZF Fun',
               \ 'b' : [ 'Buffers', "Open Buffers" ],
               \ 'l' : [ 'BLines', "Current Buffer Lines" ],
               \ 'L' : [ 'Lines', "All Buffer Lines" ],
               \ }

nnoremap <silent> zh :History:<CR>
nnoremap <silent> zH :History/<CR>

call which_key#register('<Space>', "g:which_key_map")

nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <localleader> :<c-u>WhichKeyVisual ','<CR>

nnoremap <silent> gd :call CocActionAsync('jumpDefinition')<CR>

let test#strategy = "shtuff"
let g:shtuff_receiver = 'devrunner'
