set nocompatible	"not compatible with old-fashion vi mode

"vundle setup --begin--"{{{

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'				"vundle
Plugin 'mbbill/undotree'					"show undotree
Plugin 'vim-airline/vim-airline'
Plugin 'muralisc/vim-colorschemes'
Plugin 'christoomey/vim-tmux-navigator'     "navigate between tmux panes and vim splits
call vundle#end()

"vundle setup --end--"}}}

"cscope setup --begin--"{{{

function! LoadCscope()
	let db = findfile("cscope.out", ".;")
	if (!empty(db))
		let path = strpart(db, 0, match(db, "/cscope.out$"))
		set nocscopeverbose " suppress 'duplicate connection' error
		exe "cs add " . db . " " . path
		set cscopeverbose
	endif
endfunction
au BufEnter /*.{c,h} call LoadCscope()

"cscope setup --end--"}}}

"pathogen setup --begin--"{{{

" pathogen: infect '.vim/bundle' directory
"execute pathogen#infect()

"pathogen setup --end--"}}}

"custom keymap --being--"{{{

"nerdtree keymap --begin-- "{{{

noremap <leader>n :NERDTree<CR>

"nerdtree keymap --end-- "}}}

"disable arrow keys  --begin--"{{{

noremap <left>	<nop>
noremap <right> <nop>
noremap <up> 	<nop>
noremap <down>	<nop>

"disable arrow keys  --end--"}}}

"double q escape in insert mode --begin--"{{{

inoremap qq <Esc>

"double q escape in insert mode --end--"}}}

"undotree keymap --begin--"{{{

nnoremap <F5> :UndotreeToggle<cr>   "undotree keymap

"undotree keymap --end--"}}}

"vim-tmux-navigtor keymap --begin--"{{{

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <M-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-j> :TmuxNavigateDown<cr>
nnoremap <silent> <M-k> :TmuxNavigateUp<cr>
nnoremap <silent> <M-l> :TmuxNavigateRight<cr>
nnoremap <silent> <M-\> :TmuxNavigatePrevious<cr>

"vim-tmux-navigator keymap --end--"}}}
"
"custom keymap --end--"}}}

"syntax, filetype, indent etc --begin--"{{{

filetype on					"enable filetype detection
filetype indent on			"enable filetype-specific indenting
filetype plugin on			"enable filetype-specific plugins
filetype plugin indent on   "enable filetype-specific plugin indenting?
syntax on					"syntax highlight

"syntax, filetype, indent etc --end--"}}}

"set commands --begin--"{{{

set showcmd					"show (partial) cmd in the last line of the screen
set hidden 					"hide buffs instd of clsin dem w/ unwritten changes
set number					"always how line numbers
set rnu						"relative line numbering
set foldmethod=marker		"detect triple-{ style fold markers [marker indent]
set wildmenu				"tab completion for files/buffers like bash
set hlsearch				"highlight search terms
set incsearch				"show search matches as you type
set mouse=n					"enbale using mouse in normal mode
set textwidth=80			"max text width=80 columns
"set nowrap					"lines will not wrap
"set cindent				"auto indent for C
"set smartindent			"auto indenting?
set cursorline				"higlight the cursor line
"set smarttab				"insert tabs instead of SP on a line starting w/ tab
set tabstop=4				"TAB=4 SPs
set shiftwidth=4			"TAB=4 SPs
set softtabstop=4			"TAB=4 SPs while editing
set expandtab				"on pressing TAB insert 4 spaces
set ignorecase				"ignore case while searching
set directory=/var/tmp      "directory for .swp files
"set list					"for EOL chars
"set listchars=tab:▸\ ,eol:¬ "EOL chars

"set commands --end--"}}}

"color scheme, colorcolumn etc --begin--"{{{

colorscheme desert                                              "the chosen color scheme
"set colorcolumn after column 80
silent execute "set colorcolumn=" . join(range(81,267), ',')
hi CursorLine cterm=bold 	                                    "get rid of the underline because of cursorline
hi ColorColumn ctermbg=236	                                    "colorcolumn bg color

"color scheme, colorcolumn etc --end--"}}}

"vim-airline, status line --begin--"{{{

let g:airline_powerline_fonts = 1                   "prefer powerline fonts for fancy glyphics
let g:airline#extensions#whitespace#symbol = '!'    "force '!' for whitespace warnings

if !exists('g:airline_symbols')                     "populate airline symbols dictionary 
    let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = 'Ξ'                  "airline symbol for lineno

"vim-airline, status line --end--"}}}

"undotree, vimundo visualization --begin--"{{{

set undofile                "keep an undo file, for persistent undo
set undodir=~/.vim/vimundo  "the undofile location

"undotree, vimundo visualization --end--"}}}

"save and restore state of folds --begin--"{{{

au BufWinLeave .vimrc mkview            "save folds' state while exiting buffer
au BufWinEnter .vimrc silent loadview   "load saved folds' state while entering buffer

"save and restore state of folds --end--"}}}
