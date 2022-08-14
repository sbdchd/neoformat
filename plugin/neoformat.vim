if exists("g:loaded_neoformat")
  finish
endif
let g:loaded_neoformat = 1

command! -nargs=? -bar -range=% -bang -complete=customlist,neoformat#CompleteFormatters Neoformat
            \ call neoformat#Neoformat(<bang>0, <q-args>, <line1>, <line2>)
