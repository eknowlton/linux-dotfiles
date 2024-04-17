call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'francoiscabrol/ranger.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'liuchengxu/vim-which-key'
Plug 'ruanyl/vim-gh-line'
Plug 'hashivim/vim-terraform'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'jiangmiao/auto-pairs'
Plug 'gko/vim-coloresque'
Plug 'KabbAmine/vCoolor.vim'
Plug 'janko-m/vim-test'
Plug 'LnL7/vim-nix'
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'jparise/vim-graphql'
Plug 'pearofducks/ansible-vim'
Plug 'tpope/vim-rhubarb'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'peitalin/vim-jsx-typescript'
Plug 'honza/vim-snippets'
Plug 'mlaursen/vim-react-snippets'
Plug 'diepm/vim-rest-console'
Plug 'preservim/nerdcommenter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'wellle/context.vim'
Plug 'nvie/vim-flake8'
Plug 'psliwka/vim-smoothie'
Plug 'mechatroner/rainbow_csv'
Plug 'jasonccox/vim-wayland-clipboard'

call plug#end()

set exrc
set secure

colorscheme monokai
set lazyredraw

set encoding=UTF-8
set mouse=a

set updatetime=300
set signcolumn=yes

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
set hlsearch

autocmd FileType crontab setlocal nobackup nowritebackup
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType json setlocal ts=2 sts=2 sw=2
autocmd FileType zsh setlocal ts=2 sts=2 sw=2
autocmd FileType sh setlocal ts=2 sts=2 sw=2
autocmd FileType c setlocal ts=4 sts=4 sw=4
autocmd FileType typescript setlocal ts=2 sts=2 sw=2
autocmd FileType typescript.tsx setlocal ts=2 sts=2 sw=2
autocmd FileType typescriptreact setlocal ts=2 sts=2 sw=2
autocmd FileType ruby setlocal ts=2 sts=2 sw=2
autocmd FileType php setlocal ts=4 sts=4 sw=4
autocmd FileType ccpp setlocal ts=4 sts=4 sw=4
autocmd FileType xml setlocal ts=2 sts=2 sw=2
autocmd FileType css setlocal ts=2 sts=2 sw=2
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 cursorcolumn
autocmd FileType json syntax match Comment +\/\/.\+$+

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

autocmd BufEnter *.sls set filetype=yaml

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

inoremap jk <Esc>
tnoremap <Esc> <C-\><C-n>

set clipboard+=unnamedplus

vnoremap <C-c> "+
nnoremap <C-c> "+

let mapleader = "\<Space>"
let maplocalleader = ","

let g:which_key_map = {}

let g:ranger_map_keys = 0 " Ranger auto maps this to <leader>f
let g:ranger_open_new_tab = 1

let g:which_key_map.r = ['Ranger', 'Ranger File Browser']

set foldmethod=syntax
set foldlevel=3

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
        if (index(['vim', 'help'], &filetype) >= 0)
                execute 'h '.expand('<cword>')
        else
                call CocAction('doHover')
        endif
endfunction

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-@> coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

let g:coc_global_extensions =
  \[
  \  '@yaegassy/coc-intelephense',
  \  '@yaegassy/coc-tailwindcss3',
  \  'coc-deno',
  \  'coc-docker',
  \  'coc-flutter',
  \  'coc-go',
  \  'coc-highlight',
  \  'coc-html',
  \  'coc-jedi',
  \  'coc-json',
  \  'coc-markdownlint',
  \  'coc-prettier',
  \  'coc-rust-analyzer',
  \  'coc-snippets',
  \  'coc-solargraph',
  \  'coc-tsserver',
  \  'coc-xml',
  \  'coc-yaml'
  \]


let g:which_key_map.r = ['Ranger', 'Ranger File Browser']

let g:which_key_map.f = { 'name' : 'Files',
               \ 'f' : ['Files', 'Find Files FZF'],
               \ 'b' : ['Buffers', 'Find Buffers FZF'],
               \ 'g' : ['GFiles', 'Find GIT Files FZF'],
               \ 'G' : ['GFiles?', 'Find GIT Files FZF with Changes'],
               \ }

let g:fzf_action = { 'enter': 'tab split' }

nnoremap <left> gT
nnoremap <up> gT
nnoremap <right> gt
nnoremap <down> gt

"----- Buffers
let g:which_key_map.b = { 'name' : 'Buffer',
               \ 'd' : ['bd', 'Close buffer'],
               \ 'n' : ['bnext', 'Next buffer'],
               \ 'p' : ['bprev', 'Previous buffer'],
               \ 'J' : ['%!jq .', 'Format Json']
               \ }

"----- Fugitive ( Git ) 
let g:which_key_map.g = { 'name' : 'Fugitive',
               \ 'g' : ['Git', 'Call a git command'],
               \ 'b' : ['Git blame', 'Blame'],
               \ 'd' : ['Gdiffsplit', 'GIT Diff'],
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
	       \ 'n' : ['bnext', 'Next Buffer'],
	       \ 'p' : ['bprevious', 'Previous Buffer'],
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

" GoTo code navigation
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)

" Formatting selected code
nmap <silent>cfs <Plug>(coc-format-selected)

" Symbol renaming
nmap <silent>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap keys for applying code actions at the cursor position
nmap <leader>ca  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>cas  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>cac  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line
nmap <leader>cl <Plug>(coc-codelens-action)

xnoremap <silent> <C-@> :w !wl-copy<CR><CR>
nnoremap <C-@> :call system("wl-copy", @")<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

let test#strategy = "shtuff"
let g:shtuff_receiver = 'devrunner'
let test#python#runner = 'djangotest'

source ~/.vim/large-file.vim
