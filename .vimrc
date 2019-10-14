set nocompatible	"not compatible with old-fashion vi mode

"vundle setup --begin--"{{{

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'				"vundle
Plugin 'mbbill/undotree'					"show undotree				
Plugin 'altercation/vim-colors-solarized'
Plugin 'muralisc/vim-colorschemes'
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

nnoremap <F5> :UndotreeToggle<cr>

"undotree keymap --end--"}}}

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
set undofile				"keep an undo file (undo changes even after closing)
set undodir=~/.vim/vimundo  "the undofile location
set cursorline				"higlight the cursor line
"set smarttab				"insert tabs instead of SP on a line starting w/ tab
set tabstop=4				"TAB=4 SPs
set shiftwidth=4			"TAB=4 SPs
set softtabstop=4			"TAB=4 SPs while editing
set expandtab				"on pressing TAB insert 4 spaces
set ignorecase				"ignore case while searching
set directory=/var/tmp		"directory for .swp files
"set list					"for EOL chars
"set listchars=tab:▸\ ,eol:¬ "EOL chars
 
"set commands --end--"}}}

"save and restore state of folds --begin--"{{{

au BufWinLeave .vimrc mkview			 "save folds' state while exiting buffer
au BufWinEnter .vimrc silent loadview "load saved folds' state while entering buffer

"save and restore state of folds --end--"}}}

"color scheme, colorcolumn etc --begin--"{{{

"higlight after col=80
execute "set colorcolumn=" . join(range(81,169), ',') 
colorscheme desert 			"the chosen color scheme
hi CursorLine cterm=bold 	"get rid of the underline because of cursorline
hi ColorColumn ctermbg=236	"colorcolumn bg color

"color scheme, colorcolumn etc --end--"}}}
