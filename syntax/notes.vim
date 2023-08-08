" Vim syntax file
" Language:     Notes
" Maintainer:   timss
" URL:          https://github.com/timss/notes.vim
"
" Simple syntax highlighting for plain text notetaking.
"
" Quit when a syntax file was already loaded
if exists('b:current_syntax') | finish | endif

set commentstring=#%s

syn keyword notesTodo TODO FIXME NOTE README COMBAK XXX
syn match notesComment "#.*$" contains=notesTodo,notesNumber,notesIssue,notesAssignment,@notesInline

" Want: (2023), 1b, 14%, a=1, -1
" Skip: A100, a1b, a_1, a-1, a-1-2-3-4
syn match notesNumber "\([a-zA-Z]\([-_0-9]*\)\d*\)\@<!\d\+"

" FOO-123 style issue reference
syn match notesIssue "[A-Z]\{1,10\}-[0-9]\+"

" k=v, a!=b, a+=100, b==="foo", keeps value highlighting seperately
syn match notesAssignment "\w*\ze\([!+\-]\)*=\{1,3\}"

" Strings enclosed by `'", but skip things like don't or john's
syn region notesString start=+\(\w\)\@<![uU]\=\z([`'"]\)+ end="\z1" skip="\\\\\|\\\z1" contains=notesTodo,notesNumber,notesIssue,notesAssignment,@notesInline

" Markdown style > block quotes
syn match notesBlockquote ">\%(\s\|$\).*" contains=notesTodo,notesNumber,notesIssue,notesAssignment,@notesInline

hi notesTodo ctermfg=132 cterm=bold
hi def link notesComment Comment
hi def link notesNumber Constant
hi notesIssue ctermfg=110 cterm=NONE
hi def link notesAssignment Identifier
hi def link notesString String
hi def link notesBlockquote String

" Credits: https://github.com/xolox/vim-notes (modified)
syn match notesTextURL @\<www\.\(\S*\w\)\+/\?@
execute printf('syntax match notesRealURL @%s@', '\<\(mailto:\|\w\{3,}://\)\(\S*\w\)\+/\?')
syn match notesEmailAddr /\<\w[^@ \t\r]*\w@\w[^@ \t\r]\+\w\>/
syn match notesUnixPath /\k\@<![\/~]\S\+\(\/\|[^ [:punct:]]\)/
syn match notesPathLnum /:\d\+/ contained containedin=notesUnixPath
syn cluster notesInline add=notesTextURL,notesRealURL,notesEmailAddr,notesUnixPath
hi def link notesTextURL Underlined
hi def link notesRealURL Underlined
hi def link notesEmailAddr Underlined
hi def link notesUnixPath Directory
hi def link notesPathLnum Comment

let b:current_syntax = 'notes'
