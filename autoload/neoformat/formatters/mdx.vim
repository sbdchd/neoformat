function! neoformat#formatters#mdx#enabled() abort
    return ['prettier']
endfunction

function! neoformat#formatters#mdx#prettier() abort
    return {
      \ 'exe': 'prettier',
      \ 'args': ['--parser', 'mdx', '--stdin', '--stdin-filepath', '"%:p"'],
      \ 'stdin': 1,
      \ }
endfunction

