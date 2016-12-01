function! neoformat#formatters#ocaml#enabled() abort
    return ['ocpindent']
endfunction

function! neoformat#formatters#ocaml#ocpindent() abort
    return {
        \ 'exe': 'ocp-indent',
        \ }
endfunction
