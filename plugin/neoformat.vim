command! -nargs=? -bar -complete=customlist,neoformat#CompleteFormatters Neoformat
            \ call neoformat#Start(<q-args>)
