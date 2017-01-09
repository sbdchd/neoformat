command! -nargs=? -bar -complete=customlist,neoformat#CompleteFormatters Neoformat
            \ call neoformat#Neoformat(<q-args>)
