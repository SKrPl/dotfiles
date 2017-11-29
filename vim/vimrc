" Pathogen for easy management of vim plugins runtimepath
execute pathogen#infect()

" Syntax highlighting
syntax on

filetype plugin indent on

" Allows project specific vim configuration
set exrc

" Write commands would be execute on project specific .vimrc file
set secure

"========== Common VIM settings ==========

" Line number
set number

" Shows matching brackets
set showmatch

" Incremental search
set incsearch

" Shows matching commands in command mode when TAB is pressed
set wildmenu

"=========================================

"========== NERDTree: A file system explorer ==========

"Opening VIM by specifying a file
autocmd vimenter * NERDTree

"Opening VIM without specifying a file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"======================================================

