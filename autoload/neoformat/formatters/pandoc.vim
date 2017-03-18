function! neoformat#formatters#pandoc#enabled() abort
   return ['pandoc']
endfunction

function! neoformat#formatters#pandoc#pandoc() abort
   return {
            \ 'exe': 'pandoc',
            \ 'args': ['-f markdown+abbreviations+autolink_bare_uris+markdown_attribute+mmd_header_identifiers+mmd_link_attributes+tex_math_double_backslash+emoji',
            \ '-t markdown+raw_tex-native_spans-simple_tables-multiline_tables+emoji',
            \ '--normalize',
            \ '-s',
            \ '--wrap=auto',
            \ '--atx-headers',
            \ '|',
            \ "sed -e 's/\\\\\\[/[/g'", "-e 's/\\\\\\]/]/g'",],
            \ 'stdin': 1,
            \ }
endfunction

