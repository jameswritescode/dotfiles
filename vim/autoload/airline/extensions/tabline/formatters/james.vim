scriptencoding utf-8

let s:numbers = ['𝟬', '𝟭', '𝟮', '𝟯', '𝟰', '𝟱', '𝟲', '𝟳', '𝟴', '𝟵']

function! s:number_to_char(num) abort
    let a:numbers = split(a:num, '\zs')

    call map(a:numbers, {-> s:numbers[v:val]})

    return join(a:numbers, '')
endfunction

function! airline#extensions#tabline#formatters#james#format(bufnr, buffers)
    return s:number_to_char(a:bufnr)
                \ . '› '
                \ . fnamemodify(bufname(a:bufnr), ':t')
endfunction
