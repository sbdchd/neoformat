function! neoformat#formatters#typescriptreact#enabled() abort
   return ['tsfmt', 'prettierd', 'prettier', 'prettiereslint', 'tslint', 'eslint_d', 'clangformat', 'denofmt', 'biome']
endfunction

function! neoformat#formatters#typescriptreact#tsfmt() abort
    return {
        \ 'exe': 'tsfmt',
        \ 'args': ['--replace', '--baseDir=%:h'],
        \ 'replace': 1,
        \ 'try_node_exe': 1,
        \ }
endfunction

function! neoformat#formatters#typescriptreact#prettier() abort
    return {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin-filepath', '"%:p"', '--parser', 'typescript'],
        \ 'stdin': 1,
        \ 'try_node_exe': 1,
        \ }
endfunction

function! neoformat#formatters#typescriptreact#prettierd() abort
    return {
        \ 'exe': 'prettierd',
        \ 'args': ['"%:p"'],
        \ 'stdin': 1,
        \ }
endfunction

function! neoformat#formatters#typescriptreact#prettiereslint() abort
    return {
        \ 'exe': 'prettier-eslint',
        \ 'args': ['--stdin', '--stdin-filepath', '"%:p"', '--parser', 'typescript'],
        \ 'stdin': 1,
        \ 'try_node_exe': 1,
        \ }
endfunction

function! neoformat#formatters#typescriptreact#tslint() abort
    let args = ['--fix', '--force']

    if filereadable('tslint.json')
        let args = ['-c tslint.json'] + args
    endif

    return {
        \ 'exe': 'tslint',
        \ 'args': args,
        \ 'replace': 1,
        \ 'try_node_exe': 1,
        \ }
endfunction

function! neoformat#formatters#typescriptreact#eslint_d() abort
    return {
        \ 'exe': 'eslint_d',
        \ 'args': ['--stdin', '--stdin-filename', '"%:p"', '--fix-to-stdout'],
        \ 'stdin': 1,
        \ 'try_node_exe': 1,
        \ }
endfunction

function! neoformat#formatters#typescriptreact#clangformat() abort
    return {
            \ 'exe': 'clang-format',
            \ 'args': ['-assume-filename=' . expand('%:t')],
            \ 'stdin': 1,
            \ 'try_node_exe': 1,
            \ }
endfunction

function! neoformat#formatters#typescriptreact#denofmt() abort
    return {
        \ 'exe': 'deno',
        \ 'args': ['fmt','--ext','tsx','-'],
        \ 'stdin': 1,
        \ }
endfunction

function! neoformat#formatters#typescriptreact#biome() abort
    return {
        \ 'exe': 'biome',
        \ 'try_node_exe': 1,
        \ 'args': ['format', '--stdin-file-path="%:p"'],
        \ 'no_append': 1,
        \ 'stdin': 1,
        \ }
endfunction
