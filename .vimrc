" .vimrc
" Better working with vim
" Copyright © 2016 Steven Acres

" This program is free software; you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation; either version 2 of the License, or
" (at your option) any later version.

" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
" GNU General Public License for more details.

" You should have received a copy of the GNU General Public License
" along with this program; if not, see <http://www.gnu.org/licenses/>.

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'voxpupuli/vim-puppet'
Plugin 'godlygeek/tabular'
Plugin 'jamessan/vim-gnupg'
Plugin 'vim-ruby/vim-ruby'
Plugin 'powerline/fonts'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'twitvim/twitvim.git'
Plugin 'cohlin/vim-colorschemes'
Plugin 'rakr/vim-one'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'vimperator/vimperator.vim'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'

call vundle#end()

" filetype plugin on
filetype plugin indent on
" Syntax
syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                OOhhh, purdy!                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark

" colorscheme
colorscheme lucius

" lucius _tweaks_
LuciusBlackHighContrast


" vim-airline settings
set laststatus=2
let g:airline_theme = "lucius"
let g:airline_powerline_fonts = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Paste Hotkey
set pastetoggle=<F2>

" More tabstuff
set expandtab
set smarttab
set autoindent

" Better searching
set ignorecase
set smartcase

" Turn of search hilite after search
nnoremap <CR> :nohlsearch<CR><CR>

" Keybindings for UltiSnips, all of these are ctrl + key
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Ultisnips auto-insert values from ENV
let g:snips_author  = $GIT_AUTHOR_NAME
let g:snips_email   = $GIT_AUTHOR_EMAIL
let g:snips_github  = $GIT_ORG

" Remove trailing whitespace on save
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()

" Puppet commenting vim-commentary
autocmd FileType puppet setlocal commentstring=#\ %s

" Puppet formatting
au BufNewFile,BufRead *.pp set syntax=puppet
au BufNewFile,BufRead *.pp setlocal softtabstop=2
au BufNewFile,BufRead *.pp setlocal shiftwidth=2
au BufNewFile,BufRead *.pp setlocal noexpandtab

" Vim Commentary
autocmd FileType *vimperatorrc setlocal commentstring="\ %s

" Pandoc/Markdown Madness
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]

" Python [TBRdone]

" Testing nerd commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'

" Syntastic python
let g:syntastic_python_checkers = ['flake8']

" Syntastic js
let g:syntastic_javascript_checkers = ['jshint']

" Yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" YCM Tweaks
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" YCM Ignore nothing ..
let g:ycm_filetype_blacklist = {}

" GPG
let g:GPGUseAgent = 1
let g:GPGPrimeAgent = 1

" Undo dir
set undodir=~/.vim/undodir
set undofile

" Mouse Trap
set mouse=
set ttymouse=
