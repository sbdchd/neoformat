function! neoformat#formatters#ocaml#enabled() abort
    return ['ocamlformat', 'ocpindent', 'topiary']
endfunction

function! neoformat#formatters#ocaml#ocpindent() abort
    return {
        \ 'exe': 'ocp-indent',
        \ }
endfunction

function! neoformat#formatters#ocaml#ocamlformat() abort
    return {
        \ 'exe': 'ocamlformat',
        \ 'no_append': 1,
        \ 'stdin': 1,
        \ 'args': ['--name', '"%:p"', '-']
        \ }
endfunction

function! neoformat#formatters#ocaml#topiary() abort
    return {
        \ 'exe': 'topiary',
        \ 'stdin': 1,
        \ 'args': ['format', '--merge-configuration', '--language', '"ocaml"' ]
        \ }
endfunction
