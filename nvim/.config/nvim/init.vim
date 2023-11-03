" (Neo)Vim config by WIZZDOM

set tabstop=4 softtabstop=4 " number of visual spaces per TAB
set shiftwidth=4 " number of spaces to use for autoindent
set expandtab " tabs are spaces
set smartindent " autoindent new lines
set exrc
set guicursor= "no gui cursor
set relativenumber " relative line numbers
set number " show line numbers
set nohlsearch " no highlight search
set hidden " hide buffers instead of closing them
set noerrorbells " no error bells
set nowrap " no line wrap
set ignorecase " ignore case
set smartcase " ignore case if search pattern is all lowercase
set noswapfile " no swap file
set nobackup " no backup file
set undodir=$HOME/.local/share/nvim/undodir " undo directory
set undofile " undo file
set incsearch " incremental search
set termguicolors " true color support
set colorcolumn=80 " column to highlight
set scrolloff=8 " number of lines to keep above and below cursor
set signcolumn=yes " always show sign column
set cmdheight=1 " command line height
set noshowmode " no show mode
set clipboard+=unnamedplus " copy to system clipboard
set mouse=a " enable mouse
syntax on " syntax highlighting
filetype plugin on " filetype plugins

if exists('g:vscode') "if using nvim inside vscode, don't load plugins

else

call plug#begin('$HOME/.local/share/nvim/plugged') "Vim plugins
Plug 'mbbill/undotree', "Undo Tree
Plug 'godlygeek/tabular', "Aligning text
"Theme
Plug 'tomasiser/vim-code-dark', "vscode theme for vim
Plug 'itchyny/lightline.vim', "bottom bar
Plug 'chrisbra/Colorizer', "colorize hex codes

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "FuzzyFinder
Plug 'vimwiki/vimwiki', "Vimwiki
Plug 'junegunn/goyo.vim', "Distraction Free Writing
Plug 'tpope/vim-commentary', "easy commenting
"Language Support
Plug 'baskerville/vim-sxhkdrc', "SXHKD Support
Plug 'plasticboy/vim-markdown', "Markdown Support
Plug 'mzlogin/vim-markdown-toc', "Markdown Table of Contents
Plug 'jvirtanen/vim-hcl', "Hashicorp Configuration Language Support
Plug 'pearofducks/ansible-vim', { 'do': './UltiSnips/generate.sh' } "Ansible Support
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } "Markdown Preview
"Nerdtree
Plug 'preservim/nerdtree' | "Nerdtree
            \ Plug 'Xuyuanp/nerdtree-git-plugin' | "Git status in nerdtree
            \ Plug 'ryanoasis/vim-devicons' "Devicons
" Other stuffs
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Conquer of Completion
Plug 'github/copilot.vim', "Github Copilot
Plug 'andweeb/presence.nvim', "Discord Rich Presence
call plug#end()


let g:codedark_conservative=0 "If you don't like many colors and prefer the conservative style of the standard Visual Studio
let g:codedark_italics=1 "Activates italicized comments (make sure your terminal supports italics)
let g:codedark_transparent=1 "Make the background transparent
let g:airline_theme = 'codedark' "If you have vim-airline, you can also enable the provided theme

colorscheme codedark "set theme
let g:lightline = {
      \ 'colorscheme': 'codedark',
      \ }
highlight Normal guibg=none

" Keymaps
let mapleader = " " "leader key
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
let g:vim_markdown_autowrite = 1 "Auto write
let g:vim_markdown_no_extensions_in_markdown = 0 "No extensions in markdown
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
let g:mkdp_port = '8080'
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


" Whitespace Highlighting
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWritePre * : %s/\s\+$//e  "remove white space trail on save
