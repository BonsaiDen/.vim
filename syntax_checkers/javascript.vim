if exists("loaded_javascript_syntax_checker")
    finish
endif
let loaded_javascript_syntax_checker = 1

" bail if the user doesnt have jshint installed
if !executable("jshint")
    finish
endif

" Formatter for VIM loc list format
if !exists("g:syntastic_jshint_reporter")
    let g:syntastic_jshint_reporter = "~/.vim/syntax_checkers/javascript.js"
endif

" Defaults in case there is no .jshintrc in the project / on the system
if !exists("g:syntastic_jshint_conf")
    let g:syntastic_jshint_conf = "~/.vim/syntax_checkers/.jshintrc"
endif

function! SyntaxCheckers_javascript_GetLocList()

    let result = ''
    let pivot = expand('%:p')

    " Find the next parent .jshintrc file
    while pivot != fnamemodify(pivot, ':h')
        let pivot = fnamemodify(pivot, ':h')
        let config = pivot.'/.jshintrc'
        if len(glob(config))
            let result = config
            break
        endif
    endwhile

    " Fallback to default configuration if required
    if result == ''
        let jsconf = " --config ".g:syntastic_jshint_conf

    else
        let jsconf = " --config ".result
    endif

    " Run the exporter
    let makeprg = "jshint ".shellescape(expand('%'))." --reporter ".g:syntastic_jshint_reporter.jsconf

    " Format stuff
    let errorformat='%f @ %l:%c %m'
    return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })

endfunction

