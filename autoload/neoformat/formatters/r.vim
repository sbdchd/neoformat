function! neoformat#formatters#r#enabled() abort
    return ['styler']
endfunction

function! neoformat#formatters#r#styler() abort
    return {
        \ 'exe': 'R',
        \ 'args': ['--slave', '--no-restore', '--no-save', '-e "styler::style_text(readr::read_file((file(\"stdin\"))))"', '2>/dev/null'],
        \ 'replace': 1,
        \}
endfunction
