function! neoformat#Neoformat(bang, user_input, start_line, end_line) abort
    let search = @/
    let view = winsaveview()
    let original_filetype = &filetype

    call s:neoformat(a:bang, a:user_input, a:start_line, a:end_line)

    let @/ = search
    call winrestview(view)
    let &filetype = original_filetype
endfunction

function! s:neoformat(bang, user_input, start_line, end_line) abort

    if !&modifiable
        return neoformat#utils#warn('buffer not modifiable')
    endif

    let using_visual_selection = a:start_line != 1 || a:end_line != line('$')

    if a:bang
        let &filetype = a:user_input
    endif

    let filetype = s:split_filetypes(&filetype)

    let using_user_passed_formatter = !empty(a:user_input) && !a:bang

    if using_user_passed_formatter
        " user passed a formatter
        let formatters = [a:user_input]
    else
        let formatters = s:get_enabled_formatters(filetype)
        if formatters == []
            call neoformat#utils#msg('formatter not defined for ' . filetype . ' filetype')
            return s:basic_format()
        endif
    endif

    for formatter in formatters

        if exists('g:neoformat_' . filetype . '_' . formatter)
            let definition = g:neoformat_{filetype}_{formatter}
        elseif s:autoload_func_exists('neoformat#formatters#' . filetype . '#' . formatter)
            let definition =  neoformat#formatters#{filetype}#{formatter}()
        else
            call neoformat#utils#log('definition not found for formatter: ' . formatter)
            if using_user_passed_formatter
                call neoformat#utils#msg('formatter definition for ' . a:user_input . ' not found')

                return s:basic_format()
            endif
            continue
        endif

        let cmd = s:generate_cmd(definition, filetype)
        if cmd == {}
            if using_user_passed_formatter
                return neoformat#utils#warn('formatter ' . a:user_input . ' failed')
            endif
            continue
        endif

        let stdin = getbufline(bufnr('%'), a:start_line, a:end_line)
        let original_buffer = getbufline(bufnr('%'), 1, '$')

        call neoformat#utils#log(stdin)

        if cmd.stdin
            let stdout = systemlist(cmd.exe, stdin)
        else
            call mkdir('/tmp/neoformat', 'p')
            call writefile(stdin, cmd.tmp_file_path)
            let stdout = systemlist(cmd.exe)
        endif

        " read from /tmp file if formatter replaces file on format
        if cmd.replace
            let stdout = readfile(cmd.tmp_file_path)
        endif

        call neoformat#utils#log(stdout)
        if !v:shell_error
            " 1. append the lines that are before and after the formatterd content
            let lines_after = getbufline(bufnr('%'), a:end_line + 1, '$')
            let lines_before = getbufline(bufnr('%'), 1, a:start_line - 1)

            let new_buffer = lines_before + stdout + lines_after
            if new_buffer != original_buffer

                call s:deletelines(len(new_buffer), line('$'))

                call setline(1, new_buffer)

                return neoformat#utils#msg(cmd.name . ' formatted buffer')
            else

                return neoformat#utils#msg('no change necessary with ' . cmd.name)
            endif
        else
            call neoformat#utils#log(v:shell_error)
            call neoformat#utils#log('trying next formatter')
        endif
    endfor
    call neoformat#utils#msg('attempted all formatters for current filetype')
endfunction

function! s:get_enabled_formatters(filetype) abort
    if exists('g:neoformat_enabled_' . a:filetype)
        return g:neoformat_enabled_{a:filetype}
    elseif s:autoload_func_exists('neoformat#formatters#' . a:filetype . '#enabled')
        return neoformat#formatters#{a:filetype}#enabled()
    endif
    return []
endfunction

function! s:deletelines(start, end) abort
    silent! execute a:start . ',' . a:end . 'delete'
endfunction

function! neoformat#CompleteFormatters(ArgLead, CmdLine, CursorPos) abort
    if a:CmdLine =~ '!'
        " https://github.com/junegunn/fzf.vim/pull/110
        " 1. globpath (find) all filetype files in neoformat
        " 2. split at new lines
        " 3. map ~/.config/nvim/plugged/neoformat/autoload/neoformat/formatters/xml.vim --> xml
        " 4. sort & uniq to eliminate dupes
        " 5. filter for input
        return filter(uniq(sort(map(split(globpath(&runtimepath,
                    \ 'plugged/neoformat/autoload/neoformat/formatters/*.vim'), '\n'),
                    \ "fnamemodify(v:val, ':t:r')"))),
                    \ "v:val =~? '^" . a:ArgLead . "'")
    endif
    if a:ArgLead =~ '[^A-Za-z0-9]'
        return []
    endif
    let filetype = s:split_filetypes(&filetype)
    return filter(s:get_enabled_formatters(filetype),
                \ "v:val =~? '^" . a:ArgLead ."'")
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
    let executable = get(a:definition, 'exe', '')
    if executable == ''
        call neoformat#utils#log('no exe field in definition')
        return {}
    endif
    if !executable(executable)
        call neoformat#utils#log('executable: ' . executable . ' is not an executable')
        return {}
    endif

    let args = get(a:definition, 'args', [])
    let args_expanded = []
    for a in args
        let args_expanded = add(args_expanded, s:expand_fully(a))
    endfor

    let no_append = get(a:definition, 'no_append', 0)
    let using_stdin = get(a:definition, 'stdin', 0)

    let filename = expand('%:t')
    let path = !using_stdin ? '/tmp/neoformat/' . fnameescape(filename) : ''

    let _fullcmd = executable . ' ' . join(args_expanded) . ' ' . (no_append ? '' : path)
    " make sure there aren't any double spaces in the cmd
    let fullcmd = join(split(_fullcmd))

    return {
        \ 'exe':       fullcmd,
        \ 'stdin':     using_stdin,
        \ 'name':      a:definition.exe,
        \ 'replace':   get(a:definition, 'replace', 0),
        \ 'tmp_file_path': path,
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
