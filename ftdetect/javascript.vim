fun! s:SelectJavascript()
  if getline(1) =~# '^#!.*/bin/\%(env\s\+\)\?node\>'
    set ft=javascript
  endif
endfun

autocmd BufNewFile,BufRead *.{js,mjs,jsm,es,es6,jsx},Jakefile setfiletype javascript|compiler eslint
autocmd BufNewFile,BufRead * call s:SelectJavascript()
