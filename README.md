# notes.vim

Simple syntax highlighting for plain text notetaking.

- `TODO`, `NOTE` etc.
- Numbers, but tries to be "smart" and not too noisy about what to highlight
- Issue references for GitHub, Jira etc.
- Assignments, `k=v` for variables or similar stuff
- Strings enclosed in quotes, backticks or starting with `>` like Markdown
- `#` commented lines
- URLs, emails and UNIX paths (credits to https://github.com/xolox/vim-notes)

For anything more complex probably use something like Markdown instead, or
perhaps check out https://github.com/xolox/vim-notes

## Installation

Use whatever plugin manager you prefer. I like [vim-plug](https://github.com/junegunn/vim-plug):

```
Plug 'timss/notes.vim'
```

Can also be manually installed to `~/.vim/syntax/notes.vim`.

## Usage

This plugin does not automatically apply its syntax to any specific file
extension.  
Instead, add something like this to your `~/.vimrc`, or issue `:set
ft=notes` manually or using a Vim modeline.

```viml
augroup LocalFileTypeRules
    autocmd!
    autocmd BufNewFile,BufRead *.txt set ft=notes tw=120
augroup END
```

## Example

![Example screenshot](https://i.imgur.com/NGLfLfE.png "notes.vim screenshot")

## Why

For years I used Vim's default `sh` syntax highlighting when taking quick and
dirty `.txt` notes where something like Markdown felt too restrictive, while
also wanting some highlighting to help structure the text.

At some point the highlighting of shell keywords such as `for` or `if`, words
like `don't` being treated as unenclosed strings and the lack of other common
highlighting suitable for notes became too much of a nuisance to keep up with,
and `notes.vim` was born.
