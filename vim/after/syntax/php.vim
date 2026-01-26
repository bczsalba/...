unlet! b:current_syntax
syntax include @jsAll syntax/javascript.vim
let b:current_syntax = "php"

let s:alpinePatterns = [
    \ 'x-data', 'x-init', 'x-show', 'x-text', 'x-html',
    \ 'x-model', 'x-if', 'x-for', 'x-effect',
    \ 'x-bind:[a-zA-Z\-]*', ':[a-zA-Z\-]*',
    \ 'x-on:[a-zA-Z\-]*', '@[a-zA-Z\-]*'
\ ]

for pat in s:alpinePatterns
    for q in ['"', "'"]
        execute 'syntax region alpineJS matchgroup=htmlArg'
            \ . ' start=+' . pat . '=' . q . '+'
            \ . ' skip=+<?.*?>+'
            \ . ' end=+' . q . '+'
            \ . ' contains=@jsAll,phpRegion,phpRegionAsp,phpRegionSc'
            \ . ' containedin=htmlTag,phpStringDouble,phpStringSingle keepend extend'
    endfor
endfor
