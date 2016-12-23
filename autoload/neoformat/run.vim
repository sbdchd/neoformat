let s:jobs = {}

function! s:job_id(job) abort
    " 8 is the type Job
    if type(a:job) == 8
        let i = job_getchannel(a:job)
    else
        let i = a:job
    endif
    return split(i)[1]
endfunction

function! neoformat#run#Neoformat(cmd) abort

    if has('nvim')
        let id = jobstart(a:cmd.exe, {
            \ 'on_stdout': function('s:on_stdout'),
            \ 'on_exit':   function('s:on_exit'),
            \ })
    else
        let id = s:job_id(job_start(a:cmd.exe, {
          \ 'out_cb': function('s:on_stdout_vim'),
          \ })
          \ )
    endif

    let job          = {}
    let job.stdout   = []
    let job.name     = a:cmd.name
    let job.replace  = a:cmd.replace
    let job.path     = a:cmd.path
    let job.filetype = a:cmd.filetype

    let s:jobs[id]   = job
endfunction

function! s:on_stdout(job_id, data, event) abort
    if !has_key(s:jobs, a:job_id)
        return
    endif
    let job = s:jobs[a:job_id]

    call extend(job.stdout, a:data)
endfunction

function! s:on_stdout_vim(job, data, event) abort
    let id = s:job_id(a:job)

    if !has_key(s:jobs, id)
        return
    endif

    let job = s:jobs[id]

    if a:data == 'DETACH'
        return s:on_exit(id, job.stdout, a:event)
    endif

    call extend(job.stdout, [a:data])
endfunction

function! s:on_exit(job_id, data, event) abort
    if !has_key(s:jobs, a:job_id)
        return
    endif
    let job = s:jobs[a:job_id]

    call s:update_file(job)

    unlet s:jobs[a:job_id]
endfunction

function! neoformat#run#KillAll() abort
    if empty(s:jobs)
        return
    endif

    for id in keys(s:jobs)
        if id > 0
            silent! call jobstop(id)
        endif
    endfor

    let s:jobs = {}
endfunction

function! s:update_file(job) abort
    let data      = a:job.stdout
    let filetype  = a:job.filetype
    let formatter = a:job.name

    if a:job.replace
        let data = readfile(a:job.path)
    endif

    if len(data) < 1
        call neoformat#utils#log('no data was provided by ' . formatter)
        return neoformat#NextNeoformat()
    endif

    let last = len(data) - 1
    let end  = data[last]

    " needed for some formatters that add two new lines (\n\n) at the end of files
    " ex: remark
    if end == ''
        let datalen = len(data)
    else
        let datalen = len(data) + 1
    endif

    " cleanup the end of the file
    while datalen <= line('$')
        call setline(datalen, '')
        let datalen += 1
    endwhile

    " trim trailing newlines
    let search = @/
    let view = winsaveview()
    " http://stackoverflow.com/a/7496112/3720597
    " vint: -ProhibitCommandRelyOnUser -ProhibitCommandWithUnintendedSideEffect
    silent! %s#\($\n\)\+\%$##
    " vint: +ProhibitCommandRelyOnUser +ProhibitCommandWithUnintendedSideEffect
    let @/=search
    call winrestview(view)

    " remove extra newlines at the end of formatted file data
    if end == ''
        call remove(data, last)
    endif

    " ensure file needs to be changed
    let lines = getbufline(bufnr('%'), 1, '$')
    if data ==# lines
        return neoformat#utils#msg('no change necessary with ' . formatter . ' as ' . filetype)
    endif

    " setline() is used instead of writefile() so that marks, jumps, etc. are kept
    call setline(1, data)

    return neoformat#utils#msg('formatted file with ' . formatter . ' as ' . filetype)
endfunction
