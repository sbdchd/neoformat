function! neoformat#formatters#tex#enabled() abort
    return ['latexindent']
endfunction

function! neoformat#formatters#tex#latexindent() abort
    let opts = neoformat#utils#var_default('latexindent_opt', '')
    return {
        \ 'exe': 'latexindent',
        \ 'args': [opts, '-g /dev/stderr', '2>/dev/null'],
        \ 'stdin': 1,
        \ }
endfunction
