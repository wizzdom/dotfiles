" vimrc by WIZZDOM


set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set exrc
set guicursor=
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=$HOME/.local/share/nvim/undodir
set undofile
set incsearch
set termguicolors
set colorcolumn=80
set scrolloff=8
set signcolumn=yes
set cmdheight=1
set noshowmode
set mouse=a
syntax on
filetype plugin on

if exists('g:vscode')

else

call plug#begin('$HOME/.local/share/nvim/plugged')
Plug 'mbbill/undotree', 
Plug 'godlygeek/tabular',
"Theme
Plug 'tomasiser/vim-code-dark', "vscode theme for vim
Plug 'itchyny/lightline.vim', "bottom bar
Plug 'chrisbra/Colorizer',

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "FuzzyFinder
Plug 'vimwiki/vimwiki', "Vimwiki
Plug 'junegunn/goyo.vim',
Plug 'tpope/vim-commentary',
"Language Support
Plug 'baskerville/vim-sxhkdrc',
Plug 'plasticboy/vim-markdown',
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
"Nerdtree
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

colorscheme codedark
let g:lightline = {
      \ 'colorscheme': 'codedark',
      \ }
highlight Normal guibg=none

" Keymaps
let mapleader = " "
map <C-o> :NERDTreeToggle<CR>
map <C-\> :Goyo<CR>
vnoremap <C-c> "+y
nnoremap <F5> :UndotreeToggle<CR> :UndotreeFocus<CR>
nmap <Leader>e :CocCommand explorer<CR>
nnoremap <Leader>md :MarkdownPreview<CR> :MarkdownPreviewStop<CR>

" Tab-switching
nnoremap <Leader>1 1gt<CR>
nnoremap <Leader>2 2gt<CR>
nnoremap <Leader>3 3gt<CR>
nnoremap <Leader>4 4gt<CR>
nnoremap <Leader>5 5gt<CR>

" Markdown Edits
let g:vim_markdown_autowrite = 1
let g:vim_markdown_no_extensions_in_markdown = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 0
autocmd FileType markdown noremap <leader>r i---<CR>title:<Space><++><CR>author:<Space>"Dominic Connor"<CR>geometry:<CR>-<Space>top=30mm<CR>-<Space>left=20mm<CR>-<Space>right=20mm<CR>-<Space>bottom=30mm<CR>header-includes:<Space>\|<CR><Tab>\usepackage{float}<CR>\let\origfigure\figure<CR>\let\endorigfigure\endfigure<CR>\renewenvironment{figure}[1][2]<Space>{<CR><Tab>\expandafter\origfigure\expandafter[H]<CR><BS>}<Space>{<CR><Tab>\endorigfigure<CR><BS>}<CR><BS>---<CR><CR>
autocmd FileType markdown inoremap ,i ![](<++>){#fig:<++>}<Space><CR><CR><++><Esc>kkF]i
autocmd FileType markdown inoremap ,a [](<++>)<Space><++><Esc>F]i
autocmd FileType markdown inoremap ,1 #<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown inoremap ,2 ##<Space><CR><CR><++><Esc>2k<S-a  >
autocmd FileType markdown inoremap ,3 ###<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown inoremap ,4 ####<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown inoremap ,5 #####<Space><CR><CR><++><Esc>2k<S-a>
autocmd FileType markdown inoremap ,u +<Space><CR><++><Esc>1k<S-a>
autocmd FileType markdown inoremap ,o 1.<Space><CR><++><Esc>1k<S-a>
autocmd FileType markdown inoremap ,f +@fig:

" Vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                    \ 'syntax': 'markdown', 'ext': '.wiki.md'}]
" Markdown Preview
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_browser = 'firefox'
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false
    \ }
endif

let g:cssColorVimDoNotMessMyUpdatetime = 1
