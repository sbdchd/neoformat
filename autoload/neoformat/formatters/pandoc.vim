function! neoformat#formatters#pandoc#enabled() abort
   return ['pandoc']
endfunction

function! neoformat#formatters#pandoc#pandoc() abort
   let l:input_flags = ['markdown',
       \ '+abbreviations',
       \ '+autolink_bare_uris',
       \ '+markdown_attribute',
       \ '+mmd_header_identifiers',
       \ '+mmd_link_attributes',
       \ '+tex_math_double_backslash',
       \ '+emoji',
       \ ]

   let l:target_flags = ['markdown',
       \ '+raw_tex',
       \ '-native_spans',
       \ '-simple_tables',
       \ '-multiline_tables',
       \ '+emoji',
       \ ]

   " The sed is to make checkboxes not get escaped.
   return {
            \ 'exe': 'pandoc',
            \ 'args': ['-f' ,
            \ join(l:input_flags,''),
            \ '-t',
            \ join(l:target_flags,''),
            \ '-s',
            \ '--wrap=auto',
            \ '--atx-headers',
            \ '|',
            \ "sed -e 's/\\\\\\[/[/g'", "-e 's/\\\\\\]/]/g'",],
            \ 'stdin': 1,
            \ }
endfunction

