function! neoformat#formatters#typescript#enabled() abort
   return ['tsfmt', 'prettier', 'tslint', 'eslint_d']
endfunction

function! neoformat#formatters#typescript#tsfmt() abort
    return {
        \ 'exe': 'tsfmt',
        \ 'args': ['--replace', '--baseDir=%:h'],
        \ 'replace': 1
        \ }
endfunction

function! neoformat#formatters#typescript#prettier() abort
    return {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin', '--stdin-filepath', '"%:p"', '--parser', 'typescript'],
        \ 'stdin': 1
        \ }
endfunction

function! neoformat#formatters#typescript#tslint() abort
    let args = ['--fix']

    if filereadable('tslint.json')
        let args = ['-c tslint.json'] + args
    endif

    return {
        \ 'exe': 'tslint',
        \ 'args': args,
        \ 'replace': 1
        \ }
endfunction

function! neoformat#formatters#typescript#eslint_d() abort
    return {
        \ 'exe': 'eslint_d',
        \ 'args': ['--stdin', '--stdin-filename', '"%:p"', '--fix-to-stdout'],
        \ 'stdin': 1,
        \ }
endfunction
