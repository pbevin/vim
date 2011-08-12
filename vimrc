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

map <Leader>t :FuzzyFinderTextMate<Enter>

" By default, this is 'lookup keyword', which I don't use except by accident.
map K <nop>

call pathogen#runtime_append_all_bundles()
filetype off

" Don't use Ex mode, use Q for formatting
map Q gq

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  autocmd BufNewFile,BufRead *.html set filetype=php
  autocmd BufNewFile,BufRead *.php set filetype=php
  autocmd BufNewFile,BufRead *.phtml set filetype=php
  autocmd BufNewFile,BufRead *.inc set filetype=php
  autocmd BufNewFile,BufRead *.class set filetype=php
  autocmd BufNewFile,BufRead *.t set filetype=perl

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


function! ReloadSnippets( snippets_dir, ft )
    if strlen( a:ft ) == 0
        let filetype = "_"
    else
        let filetype = a:ft
    endif

    call ResetSnippets()
    call GetSnippets( a:snippets_dir, filetype )
endfunction

nmap ,rr :call ReloadSnippets(snippets_dir, &filetype)<CR>

