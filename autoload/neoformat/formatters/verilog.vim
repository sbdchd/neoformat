function! neoformat#formatters#verilog#enabled() abort
   return ['veribleverilogformat']
endfunction

function! neoformat#formatters#verilog#veribleverilogformat() abort
    return {
            \ 'exe': 'verible-verilog-format',
            \ }
endfunction
