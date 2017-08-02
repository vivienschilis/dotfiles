let b:goimports_vendor_compatible = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

" let g:syntastic_go_checkers = ['go', 'golint', 'errcheck', 'govet']
let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']
let g:go_metalinter_excludes = ['return value not checked', 'uses unkeyed fields']
let b:go_metalinter_autosave = 1

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
