" Vim compiler plugin
" Language:     Typescript

if exists("current_compiler")
  finish
endif
let current_compiler = "typescript"

if exists(":CompilerSet") != 2
  command! -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=npx\ --quiet\ tsc
CompilerSet errorformat=%f\ %#(%l\\,%c):\ %trror\ TS%n:\ %m,
CompilerSet errorformat+=%trror\ TS%n:\ %m,
CompilerSet errorformat+=%-G%.%#
