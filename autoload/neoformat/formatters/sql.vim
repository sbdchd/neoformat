function! neoformat#formatters#sql#enabled() abort
    return ['sqlformat', 'pg_format']
endfunction

function! neoformat#formatters#sql#sqlformat() abort
    return {
        \ 'exe': 'sqlformat',
        \ 'args': ['--reindent', '-'],
        \ 'stdin': 1,
        \ }
endfunction

function! neoformat#formatters#sql#pg_format() abort
    return {
        \ 'exe': 'pg_format',
        \ 'args': ['-'],
        \ 'stdin': 1,
        \ }
endfunction
