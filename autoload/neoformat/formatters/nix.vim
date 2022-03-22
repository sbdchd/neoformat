function! neoformat#formatters#nix#enabled() abort
    return ['nixfmt', 'nixpkgsfmt', 'alejandra']
endfunction

function! neoformat#formatters#nix#nixfmt() abort
    return {
        \ 'exe': 'nixfmt',
        \ 'stdin': 1,
        \ }
endfunction

function! neoformat#formatters#nix#nixpkgsfmt() abort
    return {
        \ 'exe': 'nixpkgs-fmt',
        \ 'stdin': 1,
        \ }
endfunction

function! neoformat#formatters#nix#alejandra() abort
    return {
        \ 'exe': 'alejandra',
        \ 'args': ['--quiet'],
        \ 'stdin': 1,
        \ }
endfunction
