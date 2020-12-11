" -- VIM CONFIGURATION (.VIMRC) --

" -- VIM PLUG Setup and LOAD --
call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'mbbill/undotree'
Plug 'godlygeek/tabular'
"Theme
Plug 'tomasiser/vim-code-dark' "vscode theme for vim
Plug 'itchyny/lightline.vim' "bottom bar
"Misc
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'vimwiki/vimwiki'
Plug 'preservim/nerdcommenter'
"Language Support
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
"Nerdtree
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase'}
" coc - Conquerer of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
" --

" Startup Settings
set mouse=a
	syntax on
    let mapleader=" "
	set noerrorbells
	set tabstop=2 softtabstop=2
	set shiftwidth=2
	set expandtab
	set smartindent
  set foldenable
	set nowrap
	set smartcase
	set noswapfile
	set nobackup
  set nowritebackup
	set incsearch
	set history=5000
	set nocompatible
	set number relativenumber
  set encoding=utf-8
	set wildmenu
	set laststatus=2
  filetype plugin on

" Colours and appearance
	colorscheme codedark
    set background=dark
    set termguicolors
    hi Normal guibg=NONE ctermbg=NONE
    let g:lightline = {
          \ 'colorscheme': 'codedark',
          \ }

" Nerdtree stuff
  let g:NERDTreeGitStatusUseNerdFonts = 1
  " open NERDTree automatically
  " autocmd StdinReadPre * let s:std_in=1
  " autocmd VimEnter * NERDTree

" Formatting/Spelling
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  autocmd FileType tex,latex,markdown setlocal spell spelllang=en_gb

" Fix splitting
  set splitbelow splitright

" Autocompletion
  set wildmode=longest,list,full

" Fix splitting
  set splitbelow splitright

" Cursor line
  set cursorline
  set cursorcolumn

" Toggle Auto Indent
  map <leader>i :setlocal autoindent<CR>
  map <leader>i :setlocal noautoindent<CR>

" Key Maps
	map <C-o> :NERDTreeToggle<CR>
	map <C-\> :Goyo<CR>
	vnoremap <C-c> "+y
	nnoremap <F5> :UndotreeToggle<CR> :UndotreeFocus<CR>
  nnoremap <Leader>i :w !ix<CR>
  nmap <space>e :CocCommand explorer<CR>
"  nnoremap <Leader> :MarkdownPreview<CR> :MarkdownPreviewStop<CR>
  map <C-_> :NERDCommenterToggle<CR>




" Persistent_undo
	set undodir=~/.vim/undodir"
	set undofile
	let g:undotree_WindowLayout = 2

" Tab-edit key-binds
  nnoremap <Leader>1 1gt<CR>
  nnoremap <Leader>2 2gt<CR>
  nnoremap <Leader>3 3gt<CR>
  nnoremap <Leader>4 4gt<CR>
  nnoremap <Leader>5 5gt<CR>

" ---Various Language Support---
"shell/zsh
  map <leader>b i#!/bin/sh<CR><CR>
  autocmd FileType *sh inoremap ,f ()<Space>{<CR><Tab><++><CR>}<CR><CR><++><Esc>?()<CR>
  autocmd FileType *sh inoremap ,i if<Space>[<Space>];<Space>then<CR><++><CR>fi<CR><CR><++><Esc>?];<CR>hi<Space>
  autocmd FileType *sh inoremap ,ei elif<Space>[<Space>];<Space>then<CR><++><CR><Esc>?];<CR>hi<Space>
  autocmd FileType *sh inoremap ,sw case<Space>""<Space>in<CR><++>)<Space><++><Space>;;<CR><++><CR>esac<CR><CR><++><Esc>?"<CR>i
  autocmd FileType *sh inoremap ,ca )<Space><++><Space>;;<CR><++><Esc>?)<CR>i


" Markdown
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

" Markdown Preview

  " set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
let g:mkdp_open_ip = ''

" specify browser to open preview page
let g:mkdp_browser = 'firefox'

" set to 1, echo preview page url in command line when open preview page
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
let g:mkdp_browserfunc = ''

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

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
" let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
" let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
  let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
  let g:mkdp_page_title = '「${name}」'

" Vimwiki markdown syntax
  let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

  " Vim Hexokinase
  let g:Hexokinase_refreshEvents = ['InsertLeave']

  let g:Hexokinase_optInPatterns = [
  \     'full_hex',
  \     'triple_hex',
  \     'rgb',
  \     'rgba',
  \     'hsl',
  \     'hsla',
  \     'colour_names'
  \ ]

  let g:Hexokinase_highlighters = ['backgroundfull']

" Markdown Edits
    let g:vim_markdown_autowrite = 1
    let g:vim_markdown_no_extensions_in_markdown = 0
    let g:vim_markdown_conceal = 0
    let g:vim_markdown_folding_disabled = 0

"Make vim colours work in alacritty
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48:2;%lu;%lu;%lum"
  	if !has('gui_running')
	    set t_Co=256
  	endif

