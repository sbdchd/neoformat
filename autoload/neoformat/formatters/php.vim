function! neoformat#formatters#php#enabled() abort
    return ['phpbeautifier']
endfunction

function! neoformat#formatters#php#phpbeautifier() abort
    return {
        \ 'exe': 'php_beautifier',
        \ }
endfunction
