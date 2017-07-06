function! neoformat#formatters#php#enabled() abort
    return ['phpbeautifier', 'phpcsfixer']
endfunction

function! neoformat#formatters#php#phpbeautifier() abort
    return {
        \ 'exe': 'php_beautifier',
        \ }
endfunction

function! neoformat#formatters#php#phpcsfixer() abort
    return {
           \ 'exe': 'php-cs-fixer',
           \ 'args': ['fix', '-q'],
           \ 'replace': 1,
           \ }
endfunction
