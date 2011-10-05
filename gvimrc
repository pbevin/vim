set go-=T
set bg=dark
if &background == "dark"
    hi normal guibg=black
endif
set number

set guifont=Menlo\ Regular:h12

macmenu &File.New\ Tab key=<nop>

map ZZ :w<Enter>

colorscheme vividchalk

map <D-t> :tabnew<CR>
