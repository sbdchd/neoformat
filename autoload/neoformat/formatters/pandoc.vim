function! neoformat#formatters#pandoc#enabled() abort
   return ['pandoc']
endfunction

function! neoformat#formatters#pandoc#pandoc() abort
   return {
            \ 'exe': 'pandoc',
            \ 'args': ['-f markdown+autolink_bare_uris',
            \ '-t markdown+autolink_bare_uris',
            \ '--atx-headers',
            \ '%:p',
            \ '|',
            \ "sed -e 's/\\\[/[/g'", "-e 's/\\\]/]/g'",],
            \ 'no_append': 1
            \ }
endfunction
