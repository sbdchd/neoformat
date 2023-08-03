function! neoformat#formatters#swift#enabled() abort
    return ['swiftformat', 'swift_format']
endfunction

function! neoformat#formatters#swift#swiftformat() abort
    return {
        \ 'exe': 'swiftformat',
        \ 'stdin': 1
        \ }
endfunction

function! neoformat#formatters#swift#swift_format() abort
    return {
        \ 'exe': 'swift-format',
        \ 'stdin': 1
        \ }
endfunction
