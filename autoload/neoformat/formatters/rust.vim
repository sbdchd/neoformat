function! neoformat#formatters#rust#enabled() abort
    return ['rustfmt']
endfunction

function! neoformat#formatters#rust#rustfmt() abort
    let opts = get(g:, 'rustfmt_edition_opt', '')
    if opts != ''
        let opts = '--edition ' . opts
    return {
        \ 'exe': 'rustfmt',
        \ 'args': [opts],
        \ 'stdin': 1,
        \ }
endfunction
