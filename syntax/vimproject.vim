"==============================================================================
"       FileName: vimproject.vim
"           Desc: Vim syntax file to highlight .vimproject
"         Author: Zhao Cai
"          Email: caizhaoff@gmail.com
"       HomePage: 
"        Version: 0.1
"   Date Created: Mon Sep 05, 2011  05:56PM
"  Last Modified: Mon Sep 05, 2011  06:02PM
"        History:
"==============================================================================

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
    syntax clear
elseif exists ("b:current_syntax")
    finish
endif

" case off
syn case ignore
syntax match projectDescriptionDir '^\s*.\{-}=\s*\(\\ \|\f\|:\|"\)\+' contains=projectDescription,projectWhiteError
syntax match projectDescription    '\<.\{-}='he=e-1,me=e-1            contained nextgroup=projectDirectory contains=projectWhiteError
syntax match projectDescription    '{\|}'
syntax match projectDirectory      '=\(\\ \|\f\|:\)\+'                contained
syntax match projectDirectory      '=".\{-}"'                         contained
syntax match projectScriptinout    '\<in\s*=\s*\(\\ \|\f\|:\|"\)\+'   contains=projectDescription,projectWhiteError
syntax match projectScriptinout    '\<out\s*=\s*\(\\ \|\f\|:\|"\)\+'  contains=projectDescription,projectWhiteError
syntax match projectComment        '#.*'
syntax match projectCD             '\<CD\s*=\s*\(\\ \|\f\|:\|"\)\+'   contains=projectDescription,projectWhiteError
syntax match projectFilterEntry    '\<filter\s*=.*"'                  contains=projectWhiteError,projectFilterError,projectFilter,projectFilterRegexp
syntax match projectFilter         '\<filter='he=e-1,me=e-1           contained nextgroup=projectFilterRegexp,projectFilterError,projectWhiteError
syntax match projectFlagsEntry     '\<flags\s*=\( \|[^ ]*\)'          contains=projectFlags,projectWhiteError
syntax match projectFlags          '\<flags'                          contained nextgroup=projectFlagsValues,projectWhiteError
syntax match projectFlagsValues    '=[^ ]* 'hs=s+1,me=e-1             contained contains=projectFlagsError
syntax match projectFlagsError     '[^rtTsSwl= ]\+'                   contained
syntax match projectWhiteError     '=\s\+'hs=s+1                      contained
syntax match projectWhiteError     '\s\+='he=e-1                      contained
syntax match projectFilterError    '=[^"]'hs=s+1                      contained
syntax match projectFilterRegexp   '=".*"'hs=s+1                      contained
syntax match projectFoldText       '^[^=]\+{'


" Define the default hightlighting.
if version >= 508 || !exists("did_vimproject_syn_inits")
    if version < 508
        let did_vimproject_syn_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif
    HiLink projectDescription  Identifier
    HiLink projectScriptinout  Identifier
    HiLink projectFoldText     Identifier
    HiLink projectComment      Comment
    HiLink projectFilter       Identifier
    HiLink projectFlags        Identifier
    HiLink projectDirectory    Constant
    HiLink projectFilterRegexp String
    HiLink projectFlagsValues  String
    HiLink projectWhiteError   Error
    HiLink projectFlagsError   Error
    HiLink projectFilterError  Error


    delcommand HiLink
endif
let b:current_syntax = "vimproject"

" vim: set ts=4 :
