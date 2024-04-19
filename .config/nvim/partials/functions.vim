function! <SID>StripTrailingWhitespaces()
  let l:_s=@/
  let l:l = line('.')
  let l:c = col('.')
  %s/\s\+$//e
  let @/=l:_s
  call cursor(l:l, l:c)
endfunction

augroup strip_whitespace
  autocmd!
  autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
augroup END

function! <SID>ProfileStart() abort
  execute 'profile start profile.log'
  execute 'profile func *'
  execute 'profile file *'
endfunction

command! -bang -nargs=0 ProfileStart call <SID>ProfileStart()

function! <SID>ProfileStop() abort
  execute 'profile pause'
  execute 'noautocmd qall!'
endfunction

command! -bang -nargs=0 ProfileStop call <SID>ProfileStop()

function! <SID>SynStack()
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

command! -bang -nargs=0 SynStack call <SID>SynStack()

let s:repls = {
      \ 'elixir': 'iex -S mix',
      \ 'python': 'python3',
      \ 'ruby': 'rails console',
      \ }

function! Repl()
  if has_key(s:repls, &filetype)
    let l:repl = s:repls[&filetype]

    execute 'wincmd s | terminal ' . l:repl
  else
    echo 'no repl'
  endif
endfunction

let s:runners = {
      \ 'elixir': 'elixir',
      \ 'haskell': 'runhaskell',
      \ 'io': 'io',
      \ 'javascript': 'node',
      \ 'lua': 'lua',
      \ 'perl': 'perl',
      \ 'php': 'php',
      \ 'python': 'python',
      \ 'ruby': 'ruby',
      \ 'rust': 'cargo run',
      \ 'sh': 'sh',
      \ 'zsh': 'zsh',
      \ }

function! RunFile()
  let l:filetype = split(&filetype, '\\.')[0]

  if has_key(s:runners, l:filetype)
    let l:runner = s:runners[l:filetype]

    execute 'wincmd v | terminal ' . l:runner . ' ' . expand('%:p')
  else
    echo 'no runner'
  endif
endfunction

function! TabControl(tab_cmd, buf_cmd) abort
  exec tabpagenr('$') > 1 ? a:tab_cmd : a:buf_cmd
endfunction
