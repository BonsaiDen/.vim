if !exists("main_syntax")
    if version < 600
        syntax clear
    elseif exists("b:current_syntax")
        finish
    endif
    let main_syntax = 'emblem'
endif

if version < 600 && exists("emblem_fold")
    unlet emblem_fold
endif

syn sync fromstart
syn sync maxlines=100

syn cluster emNotInterpolated   contains=@emModule,@emModifier,@emStatement,@emComment,@emTodo

" Comments
syn keyword emTodo              contained TODO FIXME XXX
syn match   emComment           "--.*$" contains=emTodo,@Spell
syn region  emComment           matchgroup=emComment start="---" end="---" contains=emTodo,@Spell

" Take care of the shebang
syn match   emComment           "\%^#!.*"

" Strings
syn match   emSpecial           "\\\d\d\d\|\\."
syn region  emStringS           start=+'+  skip=+\\\\\|\\'+  end=+'\|$+ contains=emSpecial,emInterpolation
syn region  emStringR           start=+`+  skip=+\\\\\|\\`+  end=+`\|$+

"Interpolation
syn region  emInterpolation     matchgroup=emInterpolationLimit start="#{" end="}" contained contains=ALLBUT,@emNotInterpolated

" Numbers
syn match   emNumber	        "\-\=\<0x\x\+\>"
syn match   emNumber            "\-\=\<\d\+[eE][+-]\=\d\+\>"
syn match   emNumber            "\-\=\<\%([1-9]\d*\|0\)\>"

" Other stuff
syn match   emSpecialCharacter  "'\\.'"
syn match   emNormal            "\."
syn match   emThis              /@\%(\I\i*\)\?/

" Keywords and operators
syn keyword emModule            import export from as extern
syn keyword emType              void bool int float string list map struct type interface
syn keyword emStatement         if elif else for scope ret yield match case loop each leave try except finally raise 
syn keyword emBoolean           true false
syn keyword emOperator          in is new del
syn match   emOperator          "#"
syn keyword emModifier          async mutable static public private

" The rest
syn match   emBraces            "[{}\[\]]"
syn match   emParens            "[()]"

if version >= 508 || !exists("did_em_syntax_inits")

    if version < 508
        let did_em_syntax_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif

    HiLink emTodo               Todo
    HiLink emComment            Comment

    HiLink emSpecial            Special
    HiLink emStringS            String
    HiLink emStringR            String
           
    HiLink emNumber             Number

    HiLink emSpecialCharacter   Special
    HiLink emNormal             Normal
    HiLink emThis               Identifier

    HiLink emModule             Member
    HiLink emType               Type
    HiLink emStatement          Statement

    HiLink emBoolean            Boolean  

    HiLink emOperator           Operator
    HiLink emModifier           Keyword

    HiLink emError              Error
    
    HiLink emBraces             Function
    HiLink emSpecial            Special
    HiLink emInterpolationLimit Delimiter

    delcommand HiLink

endif

let b:current_syntax = "emblem"

" vim: et ts=4 sw=4

