function! neoformat#formatters#caddyfile#enabled() abort
   return ['caddyformat']
endfunction

function! neoformat#formatters#caddyfile#caddyformat() abort
    return {
            \ 'exe': 'caddy',
            \ 'args': ['fmt', '-'],
            \ 'stdin': 1,
            \ }
endfunction
