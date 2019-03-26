function! neoformat#formatters#r#enabled() abort
    return ['styler']
endfunction

function! neoformat#formatters#r#styler() abort
    return {
        \ 'exe': 'R',
        \ 'args': ['-e "library(styler)"', '-e "style_file(\"%:p\")"'],
        \ 'replace': 1,
        \}
endfunction
