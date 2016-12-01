function! neoformat#formatters#sass#enabled() abort
   return ['sassconvert', 'csscomb']
endfunction

function! neoformat#formatters#sass#sassconvert() abort
    return {
            \ 'exe': 'sass-convert',
            \ 'args': ['-T sass']
            \ }
endfunction

function! neoformat#formatters#sass#csscomb() abort
    return neoformat#formatters#css#csscomb()
endfunction

