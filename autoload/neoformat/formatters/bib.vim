function! neoformat#formatters#bib#enabled() abort
    return ['bibclean', 'bibtextidy']
endfunction

function! neoformat#formatters#bib#bibclean() abort
    return {
                \ 'exe': 'bibclean',
                \ 'stdin': 1,
                \ }
endfunction

function! neoformat#formatters#bib#bibtextidy() abort
    return {
                \ 'exe': 'bibtex-tidy',
                \ 'stdin': 1,
                \ }
endfunction
