function! neoformat#formatters#powershell#enabled() abort
    return ['PowerShellBeautifier']
endfunction

function! neoformat#formatters#powershell#PowerShellBeautifier() abort
    return {
        \ 'exe'   : 'Edit-DTWBeautifyScript',
        \ 'args'  : ["-IndentType FourSpaces", "-StandardOutput"],
        \ 'stdin' : 0,
        \ }
endfunction
