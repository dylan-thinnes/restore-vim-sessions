fu! SessionPath()
    let hashed = system('md5sum | cut -d" " -f1 | tr -d "\n"', string(getpid()))
    return $HOME . '/.vim-sessions/' . hashed
endfunction

fu! SaveSess()
    call mkdir(SessionPath(), 'p')
    call writefile([getcwd()], SessionPath() . '/path')
    execute 'mksession! ' . SessionPath() . '/session.vim'
endfunction

fu! ClearSess()
    if v:dying == 0
        call delete(SessionPath() . '/session.vim')
        call delete(SessionPath() . '/path')
        call delete(SessionPath(), 'd')
    fi
endfunction

autocmd VimLeave * call ClearSess()
autocmd CursorHold * call SaveSess()
autocmd VimEnter * call SaveSess()

