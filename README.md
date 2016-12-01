# Neoformat [![Build Status](https://travis-ci.org/sbdchd/neoformat.svg?branch=master)](https://travis-ci.org/sbdchd/neoformat)

A [Neovim](https://neovim.io) plugin for formatting code, with preliminary support for Vim.

Neoformat uses a variety of formatters for differing filetypes. Currently, Neoformat
will run a formatter _asynchronously_, and on success it will update the current
buffer with the formatted text. On a formatter failure, Neoformat will try the next
formatter defined for the filetype.

The job control is based off [vim-go's](https://github.com/fatih/vim-go).

## Basic Usage

Format the current file using its filetype

```viml
:Neoformat
```

Or specify a certain formatter (must be defined for the current filetype)

```viml
:Neoformat js-beautify
```

## Install

[vim-plug](https://github.com/junegunn/vim-plug)

```viml
Plug 'sbdchd/neoformat'
```

## Current Limitation(s)

In order to preserve marks, jumps, etc., Neoformat uses Vim's `setline()` function
to insert the formatted text. If the buffer is changed before the formatter has
completed, then the updated text will be put into the current buffer.

To prevent this, format jobs are cancelled when changing / closing the buffer.

**So don't switch buffers before the the formatting is complete!**

Note: This should be resolved when [`setbufline()`](https://github.com/vim/vim/blob/9bd547aca41799605c3a3f83444f6725c2d6eda9/runtime/doc/todo.txt#L177) is added.

By default, Neoformat reads from the current buffer, not the current file. This
can be changed via the configuration variable `g:neoformat_read_from_buffer`.

With Vim, some of the formatters do not function, e.g. remark.

## Config [Optional]

Define custom formatters.

```viml
let g:neoformat_python_autopep8 = {
            \ 'exe': 'autopep8'
            \ }

let g:neoformat_enabled_python = ['autopep8']
```

Configure enabled formatters.

```viml
let g:neoformat_enabled_python = ['autopep8', 'yapf']
```

Enable basic formatting when a filetype is not found. Disabled by default.

```viml
" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
```

Make Neoformat read from the file instead of the buffer.

```viml
let g:neoformat_read_from_buffer = 0
```

When debugging, you can enable either of following variables for extra logging.

```viml
let g:neoformat_verbose = 1 " only affects the verbosity of Neoformat
" Or
let &verbose            = 1 " also increases verbosity of the editor as a whole
```

## Supported Filetypes

- Arduino
  - [`uncrustify`](http://uncrustify.sourceforge.net),
    [`clang-format`](http://clang.llvm.org/docs/ClangFormat.html),
    [`astyle`](http://astyle.sourceforge.net)
- C
  - [`uncrustify`](http://uncrustify.sourceforge.net),
    [`clang-format`](http://clang.llvm.org/docs/ClangFormat.html),
    [`astyle`](http://astyle.sourceforge.net)
- C#
  - [`uncrustify`](http://uncrustify.sourceforge.net),
    [`astyle`](http://astyle.sourceforge.net)
- C++
  - [`uncrustify`](http://uncrustify.sourceforge.net),
    [`clang-format`](http://clang.llvm.org/docs/ClangFormat.html),
    [`astyle`](http://astyle.sourceforge.net)
- Crystal
  - `crystal tool format` (ships with [`crystal`](http://crystal-lang.org))
- CSS
  - `css-beautify` (ships with [`js-beautify`](https://github.com/beautify-web/js-beautify)),
    [`prettydiff`](https://github.com/prettydiff/prettydiff),
    [`stylefmt`](https://github.com/morishitter/stylefmt),
    [`csscomb`](http://csscomb.com)
- CSV
  - [`prettydiff`](https://github.com/prettydiff/prettydiff)
- D
  - [`uncrustify`](http://uncrustify.sourceforge.net),
    [`dfmt`](https://github.com/Hackerpilot/dfmt)
- Dart
  - [`dartfmt`](https://www.dartlang.org/tools/)
- Elm
  - [`elm-format`](https://github.com/avh4/elm-format)
- Go
  - [`gofmt`](https://golang.org/cmd/gofmt/),
    [`goimports`](https://godoc.org/golang.org/x/tools/cmd/goimports)
- Haskell
  - [`stylish-haskell`](https://github.com/jaspervdj/stylish-haskell)
- HTML
  - `html-beautify` (ships with [`js-beautify`](https://github.com/beautify-web/js-beautify)),
    [`prettydiff`](https://github.com/prettydiff/prettydiff)
- Jade
  - [`pug-beautifier`](https://github.com/vingorius/pug-beautifier)
- Java
  - [`uncrustify`](http://uncrustify.sourceforge.net),
    [`astyle`](http://astyle.sourceforge.net)
- Javascript
  - [`js-beautify`](https://github.com/beautify-web/js-beautify),
    [`prettydiff`](https://github.com/prettydiff/prettydiff),
    [`clang-format`](http://clang.llvm.org/docs/ClangFormat.html),
    [`esformatter`](https://github.com/millermedeiros/esformatter/)
- JSON
  - [`js-beautify`](https://github.com/beautify-web/js-beautify),
    [`prettydiff`](https://github.com/prettydiff/prettydiff)
- Less
  - [`csscomb`](http://csscomb.com),
    [`prettydiff`](https://github.com/prettydiff/prettydiff)
- Lua
  - [`luaformatter`](https://github.com/LuaDevelopmentTools/luaformatter)
- Markdown
  - [`remark`](https://github.com/wooorm/remark)
- Objective-C
  - [`uncrustify`](http://uncrustify.sourceforge.net),
    [`clang-format`](http://clang.llvm.org/docs/ClangFormat.html),
    [`astyle`](http://astyle.sourceforge.net)
- OCaml
  - [`ocp-indent`](http://www.typerex.org/ocp-indent.html)
- Pandoc Markdown
  - [`pandoc`][https://pandoc.org/MANUAL.html]
- Pawn
  - [`uncrustify`](http://uncrustify.sourceforge.net)
- Perl
  - [`perltidy`](http://perltidy.sourceforge.net)
- PHP
  - [`php_beautifier`](http://pear.php.net/package/PHP_Beautifier)
- Proto
  - [`clang-format`](http://clang.llvm.org/docs/ClangFormat.html)
- Pug (formally Jade)
  - [`pug-beautifier`](https://github.com/vingorius/pug-beautifier)
- Python
  - [`yapf`](https://github.com/google/yapf),
    [`autopep8`](https://github.com/hhatto/autopep8)
- Ruby
  - [`ruby-beautify`](https://github.com/erniebrodeur/ruby-beautify)
- Rust
  - [`rustfmt`](https://github.com/rust-lang-nursery/rustfmt)
- Sass
  - [`sass-convert`](http://sass-lang.com/documentation/#executables),
    [`csscomb`](http://csscomb.com)
- Scala
  - [`scalariform`](https://github.com/scala-ide/scalariform)
- SCSS
  - [`sass-convert`](http://sass-lang.com/documentation/#executables),
    [`stylefmt`](https://github.com/morishitter/stylefmt),
    [`prettydiff`](https://github.com/prettydiff/prettydiff),
    [`csscomb`](http://csscomb.com)
- Shell
  - [`shfmt`](https://github.com/mvdan/sh)
- SQL
  - `sqlformat` (ships with [sqlparse](https://github.com/andialbrecht/sqlparse))
- Typescript
  - [`tsfmt`](https://github.com/vvakame/typescript-formatter)
- VALA
  - [`uncrustify`](http://uncrustify.sourceforge.net)
- XHTML
  - [`tidy`](http://www.html-tidy.org),
    [`prettydiff`](https://github.com/prettydiff/prettydiff)
- XML
  - [`tidy`](http://www.html-tidy.org),
    [`prettydiff`](https://github.com/prettydiff/prettydiff)
