function! neoformat#formatters#python#enabled() abort
    return ['yapf', 'autopep8', 'black', 'isort', 'docformatter', 'pyment', 'pydevf']
endfunction

function! neoformat#formatters#python#yapf() abort
    return {
                \ 'exe': 'yapf',
                \ 'args': ['--lines', '<start_line>-<end_line>'],
                \ 'stdin': 1,
                \ 'range_mode': 1,
                \ }
endfunction

function! neoformat#formatters#python#autopep8() abort
    return {
                \ 'exe': 'autopep8',
                \ 'args': ['-'],
                \ 'stdin': 1,
                \ }
endfunction


function! neoformat#formatters#python#isort() abort
    return {
                \ 'exe': 'isort',
                \ 'args': ['-', '--quiet',],
                \ 'stdin': 1,
                \ }
endfunction


function! neoformat#formatters#python#docformatter() abort
    return {
                \ 'exe': 'docformatter',
                \ 'args': ['-',],
                \ 'stdin': 1,
                \ }
endfunction

function! neoformat#formatters#python#black() abort
    return {
                \ 'exe': 'black',
                \ 'stdin': 1,
                \ 'args': ['-'],
                \ }
endfunction


function! neoformat#formatters#python#pyment() abort
    return {
                \ 'exe': 'pyment',
                \ 'stdin': 1,
                \ 'args': ['-w', '-'],
                \ }
endfunction

function! neoformat#formatters#python#pydevf() abort
    return {
                \ 'exe': 'pydevf',
                \ 'replace': 1,
                \ }
endfunction
