" Vundle setup:
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/Vundle.vim'
Bundle 'tpope/vim-coffee-script'
Bundle 'tpope/vim-commentary'
Bundle 'elixir-lang/vim-elixir'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'jsx/jsx.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'sheerun/vim-polyglot'
Bundle 'vividchalk.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'
Bundle 'Align'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-surround'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'ekalinin/Dockerfile.vim'

call vundle#end()            " required
filetype plugin indent on    " required



syntax on

set hlsearch
set incsearch
set expandtab
set ruler
set showcmd
set ignorecase
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set autoread
set cursorline
set relativenumber

hi CursorLine term=bold cterm=bold guibg=Grey40

" let g:airline_powerline_fonts = 1
" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif
" let g:airline_symbols.space = "\ua0"

nmap <Leader>t :e ~/Dropbox/Things\ To\ Do.md<Enter>

" By default, this is 'lookup keyword', which I don't use except by accident.
map K <nop>

" \r => sync with nerd tree
map <leader>r :NERDTreeFind<cr>
map <Leader>aa :Align =><cr>

nnoremap <cr> :noh<CR><CR>:<backspace>
nnoremap <F5> :e ~/.vimrc<CR>

filetype off

" Don't use Ex mode, use Q for formatting
map Q gq

function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>


" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  autocmd BufNewFile,BufRead *.jbuilder set filetype=ruby
  autocmd BufNewFile,BufRead *.html set filetype=php
  autocmd BufNewFile,BufRead *.php set filetype=php
  autocmd BufNewFile,BufRead *.phtml set filetype=php
  autocmd BufNewFile,BufRead *.inc set filetype=php
  autocmd BufNewFile,BufRead *.class set filetype=php
  autocmd BufNewFile,BufRead *.t set filetype=perl
  autocmd BufNewFile,BufRead *.rs set filetype=rust
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown

  " Remove trailing spaces on save
  autocmd BufWritePre * :%s/\s\+$//e

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  au FocusLost * silent! wa
endif

map <F2> :NERDTreeToggle<CR>


" function! ReloadSnippets( snippets_dir, ft )
"     if strlen( a:ft ) == 0
"         let filetype = "_"
"     else
"         let filetype = a:ft
"     endif

"     call ResetSnippets()
"     call GetSnippets( a:snippets_dir, filetype )
" endfunction

" nmap ,rr :call ReloadSnippets(snippets_dir, &filetype)<CR>

nmap <F1> :set invnumber<CR>

hi normal guibg=black
colorscheme vividchalk
set cursorline
hi CursorLine  guibg=#404040 ctermbg=235 cterm=none gui=none

function! HandleURI()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ )">,;:]*')
  echo s:uri
  if s:uri != ""
    exec "!open \"" . s:uri . "\""
  else
    echo "No URI found in line."
  endif
endfunction
map <Leader>w :call HandleURI()<CR>

" :so % to reload this file
