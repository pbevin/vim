set go-=T
set bg=dark
if &background == "dark"
    hi normal guibg=black
endif
set number

set guifont=Menlo\ Regular:h14

macmenu &File.New\ Tab key=<nop>

map ZZ :w<Enter>

colorscheme vividchalk

map <D-t> :tabnew<CR>

" I usually hit F1 by mistake meaning F2.
map <F1> <nop>

