function! neoformat#formatters#systemverilog#enabled() abort
   return ['veribleverilogformat']
endfunction

function! neoformat#formatters#systemverilog#veribleverilogformat() abort
    return neoformat#formatters#verilog#veribleverilogformat()
endfunction
