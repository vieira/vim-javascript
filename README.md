# vim-javascript

JavaScript and TypeScript bundle for vim, this bundle provides syntax
highlighting and improved indentation.

**Note**: This is my personal fork of [pangloss/vim-javascript](https://github.com/pangloss/vim-javascript.git) that removes flow
support and adds TypeScript instead. Other than that, it should match the
origin and I will mostly be pulling from there and trying to submit any other
changes upstream.


## Installation

### Install with native package manager

      git clone https://github.com/vieira/vim-javascript.git ~/.vim/pack/vim-javascript/start/vim-javascript

since Vim 8.

### Install with [pathogen](https://github.com/tpope/vim-pathogen)

      git clone https://github.com/vieira/vim-javascript.git ~/.vim/bundle/vim-javascript

alternatively, use a package manager like [vim-plug](https://github.com/junegunn/vim-plug)

### Using with [MaxMEllon/vim-jsx-pretty](https://github.com/MaxMEllon/vim-jsx-pretty)

```bash
cd after/
cp ftplugin/typescriptreact.vim ftplugin/typescript.vim
cp syntax/typescriptreact.vim syntax/typescript.vim
```

Edit `syntax/tsx.vim` and add the block `if hlexists("tsNoise")` below the `if get(g:, 'vim_jsx_pretty_disable_tsx', 0)`:

```viml
if get(g:, 'vim_jsx_pretty_disable_tsx', 0)
  finish
endif

if hlexists("tsNoise") " vieira/vim-javascript
  runtime syntax/jsx.vim
  finish
endif
```

### Using with [jparise/vim-graphql](https://github.com/jparise/vim-graphql)

```bash
cd after/syntax/typescript
```

Edit `graphql.vim` and replace simply with:

```viml
runtime! after/syntax/javascript/graphql.vim
```


## Configuration Variables

The following variables control certain syntax highlighting plugins. You can
add them to your `.vimrc` to enable their features.

-----------------

```
let g:javascript_plugin_jsdoc = 1
```

Enables syntax highlighting for [JSDocs](http://usejsdoc.org/).

Default Value: 0

-----------------

```
let g:javascript_plugin_ngdoc = 1
```

Enables some additional syntax highlighting for NGDocs. Requires JSDoc plugin
to be enabled as well.

Default Value: 0

-----------------

```vim
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END
```

Enables code folding for javascript based on our syntax file.

Please note this can have a dramatic effect on performance.


## Indentation Specific

* `:h cino-:`
* `:h cino-=`
* `:h cino-star`
* `:h cino-(`
* `:h cino-w`
* `:h cino-W`
* `:h cino-U`
* `:h cino-m`
* `:h cino-M`
* `:h 'indentkeys'`

## Contributing

Please follow the general code style
guides (read the code) and in your pull request explain the reason for the
proposed change and how it is valuable. All p.r.'s will be reviewed by a
maintainer(s) then, hopefully, merged.

Thank you!


## License

Distributed under the same terms as Vim itself. See `:help license`.
