function! neoformat#formatters#json#enabled() abort
    return ['jsbeautify', 'prettydiff', 'prettierd', 'prettier', 'jq', 'fixjson', 'denofmt', 'topiary', 'biome']
endfunction

function! neoformat#formatters#json#jsbeautify() abort
    return neoformat#formatters#javascript#jsbeautify()
endfunction

function! neoformat#formatters#json#prettydiff() abort
    return neoformat#formatters#javascript#prettydiff()
endfunction

function! neoformat#formatters#json#jq() abort
    return {
            \ 'exe': 'jq',
            \ 'args': ['.'],
            \ }
endfunction

function! neoformat#formatters#json#prettier() abort
    return {
        \ 'exe': 'prettier',
        \ 'args': ['--stdin-filepath', '"%:p"'],
        \ 'stdin': 1,
        \ 'try_node_exe': 1,
        \ }
endfunction

function! neoformat#formatters#json#prettierd() abort
    return {
        \ 'exe': 'prettierd',
        \ 'args': ['"%:p"'],
        \ 'stdin': 1,
        \ }
endfunction

function! neoformat#formatters#json#fixjson() abort
    let l:filename = fnamemodify(bufname('%'), ':t')
    return {
        \ 'exe': 'fixjson',
        \ 'args': ['--stdin-filename', l:filename],
        \ 'stdin': 1,
        \ 'try_node_exe': 1,
        \ }
endfunction

function! neoformat#formatters#json#denofmt() abort
    return {
        \ 'exe': 'deno',
        \ 'args': ['fmt','--ext','json','-'],
        \ 'stdin': 1,
        \ }
endfunction

function! neoformat#formatters#json#topiary() abort
    return {
        \ 'exe': 'topiary',
        \ 'no_append': 1,
        \ 'stdin': 1,
        \ 'args': ['format', '--merge-configuration', '--language', '"json"' ]
        \ }
endfunction

function! neoformat#formatters#json#biome() abort
    return {
        \ 'exe': 'biome',
        \ 'try_node_exe': 1,
        \ 'args': ['format', '--stdin-file-path="%:p"'],
        \ 'no_append': 1,
        \ 'stdin': 1,
        \ }
endfunction
