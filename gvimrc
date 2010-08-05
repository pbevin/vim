set go-=T
set bg=dark
if &background == "dark"
    hi normal guibg=black
endif
set number

macmenu &File.New\ Tab key=<nop>

map ZZ :w<Enter>

colorscheme vividchalk

