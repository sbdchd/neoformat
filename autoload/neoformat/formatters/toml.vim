function! neoformat#formatters#toml#enabled() abort
  return ['taplo', 'topiary']
endfunction

function! neoformat#formatters#toml#taplo() abort
  return {
        \ 'exe': 'taplo',
        \ 'args': ['fmt', '-'],
        \ 'stdin': 1,
        \ 'try_node_exe': 1,
        \ }
endfunction

function! neoformat#formatters#toml#topiary() abort
    return {
        \ 'exe': 'topiary',
        \ 'stdin': 1,
        \ 'args': ['format', '--merge-configuration', '--language', '"toml"' ]
        \ }
endfunction
