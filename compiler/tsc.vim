" Vim compiler plugin
" Language:     Typescript

if exists("current_compiler")
  finish
endif
let current_compiler = "typescript"

if exists(":CompilerSet") != 2
  command! -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=npx\ --quiet\ tsc\ --noEmit\ %:p
CompilerSet errorformat=%+A\ %#%f\ %#(%l\\\,%c):\ %m,%C%m
