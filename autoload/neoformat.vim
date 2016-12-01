function! neoformat#Start(user_formatter) abort
    let s:current_formatter_index = 0
    call neoformat#Neoformat(a:user_formatter)
endfunction

function! neoformat#Neoformat(user_formatter) abort
    let s:vim_jobcontrol = !has('nvim') && has('job') && has('patch-7-4-1590')
    if !(has('nvim') || s:vim_jobcontrol)
        return neoformat#utils#warn('Neovim, or Vim with job control, is currently required to run this plugin')
    endif

    if !empty(a:user_formatter)
        let formatter = a:user_formatter
    else
        let filetype = s:split_filetypes(&filetype)
        let formatters = s:get_enabled_formatters(filetype)
        if formatters == []
            call neoformat#utils#msg('formatter not defined for ' . filetype . ' filetype')
            return s:basic_format()
        endif

        if s:current_formatter_index >= len(formatters)
            call neoformat#utils#msg('attempted all formatters available for current filetype')
            return s:basic_format()
        endif

        let formatter = formatters[s:current_formatter_index]
    endif

    if exists('g:neoformat_' . filetype . '_' . formatter)
        let definition = g:neoformat_{filetype}_{formatter}
    elseif s:autoload_func_exists('neoformat#formatters#' . filetype . '#' . formatter)
        let definition =  neoformat#formatters#{filetype}#{formatter}()
    else
        call neoformat#utils#log('definition not found for formatter: ' . formatter)
        if !empty(a:user_formatter)
            call neoformat#utils#msg('formatter definition for ' . a:user_formatter . ' not found')
            return s:basic_format()
        endif
        return neoformat#NextNeoformat()
    endif

    let cmd = s:generate_cmd(definition, filetype)
    if cmd == {}
        if !empty(a:user_formatter)
            return neoformat#utils#log('user specified formatter failed')
        endif
        return neoformat#NextNeoformat()
    endif

    return neoformat#run#Neoformat(cmd)
endfunction

function! s:get_enabled_formatters(filetype) abort
    if exists('g:neoformat_enabled_' . a:filetype)
        return g:neoformat_enabled_{a:filetype}
    elseif s:autoload_func_exists('neoformat#formatters#' . a:filetype . '#enabled')
        return neoformat#formatters#{a:filetype}#enabled()
    endif
    return []
endfunction

function! neoformat#CompleteFormatters(ArgLead, CmdLine, CursorPos) abort
    if a:ArgLead =~ '[^A-Za-z0-9]'
        return []
    endif
    let filetype = s:split_filetypes(&filetype)
    return filter(s:get_enabled_formatters(filetype),
                \ "v:val =~? '^" . a:ArgLead ."'")
endfunction

function! neoformat#NextNeoformat() abort
    call neoformat#utils#log('trying next formatter')
    let s:current_formatter_index += 1
    return neoformat#Neoformat('')
endfunction

function! s:autoload_func_exists(func_name) abort
    try
        call eval(a:func_name . '()')
    catch /^Vim\%((\a\+)\)\=:E117/
        return 0
    endtry
    return 1
endfunction

function! s:split_filetypes(filetype) abort
    if a:filetype == ''
        return ''
    endif
    return split(a:filetype, '\.')[0]
endfunction

function! s:generate_cmd(definition, filetype) abort
    let cmd = get(a:definition, 'exe', '')
    if cmd == ''
        call neoformat#utils#log('no exe field in definition')
        return {}
    endif
    if !executable(cmd)
        call neoformat#utils#log('cmd: ' . cmd . ' is not an executable')
        return {}
    endif

    let args = get(a:definition, 'args', [])
    let args_expanded = []
    for a in args
        let args_expanded = add(args_expanded, s:expand_fully(a))
    endfor

    let replace   = get(a:definition, 'replace')
    let no_append = get(a:definition, 'no_append')

    if !exists('g:neoformat_read_from_buffer')
        let g:neoformat_read_from_buffer = 1
    endif

    if isdirectory('/tmp/') && g:neoformat_read_from_buffer
        if !isdirectory('/tmp/neoformat/')
            call mkdir('/tmp/neoformat/')
        endif

        " get the last path component, the filename
        let filename = expand('%:t')
        let path     = '/tmp/neoformat/' . fnameescape(filename)
        let data     = getbufline(bufnr('%'), 1, '$')
        call writefile(data, path)
    else
        " /Users/sloth/documents/example.vim
        let path = fnameescape(expand('%:p'))
    endif

    if no_append
        let path = ''
    endif

    let _fullcmd = cmd . ' ' . join(args_expanded) . ' ' . path
    " make sure there aren't any double spaces in the cmd
    let fullcmd = join(split(_fullcmd))

    return {
        \ 'exe':       fullcmd,
        \ 'name':      a:definition.exe,
        \ 'no_append': no_append,
        \ 'path':      path,
        \ 'replace':   replace,
        \ 'filetype':  a:filetype
        \ }
endfunction

function! s:expand_fully(string) abort
    return substitute(a:string, '%\(:[a-z]\)*', '\=expand(submatch(0))', 'g')
endfunction

function! s:basic_format() abort
    call neoformat#utils#log('running basic format')
    if !exists('g:neoformat_basic_format_align')
        let g:neoformat_basic_format_align = 0
    endif

    if !exists('g:neoformat_basic_format_retab')
        let g:neoformat_basic_format_retab = 0
    endif

    if !exists('g:neoformat_basic_format_trim')
        let g:neoformat_basic_format_trim = 0
    endif

    if g:neoformat_basic_format_align
        call neoformat#utils#log('aligning with basic formatter')
        let v = winsaveview()
        silent! execute 'normal gg=G'
        call winrestview(v)
    endif
    if g:neoformat_basic_format_retab
        call neoformat#utils#log('converting tabs with basic formatter')
        retab
    endif
    if g:neoformat_basic_format_trim
        call neoformat#utils#log('trimming whitespace with basic formatter')
        " http://stackoverflow.com/q/356126
        let search = @/
        let view = winsaveview()
        " vint: -ProhibitCommandRelyOnUser -ProhibitCommandWithUnintendedSideEffect
        silent! %s/\s\+$//e
        " vint: +ProhibitCommandRelyOnUser +ProhibitCommandWithUnintendedSideEffect
        let @/=search
        call winrestview(view)
    endif
endfunction
