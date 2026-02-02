" Colorscheme: Standard
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "standard"

set background=dark
set notermguicolors
set cursorline

let s:accent = get(g:, 'sds_accent', 11)

if exists('$SDS_ACCENT')
    let s:accent = $SDS_ACCENT
endif

function! SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

hi SDS_Normal           ctermfg=NONE
hi SDS_NormalDim        ctermfg=8
hi SDS_NormalDimItalic  ctermfg=8 cterm=italic
hi SDS_NormalDimBold    ctermfg=8 cterm=bold
hi SDS_NormalBold       ctermfg=NONE cterm=bold
hi SDS_NormalBright     ctermfg=15
hi SDS_NormalBrightBold ctermfg=15 cterm=bold

exe 'hi SDS_Accent ctermfg=' . s:accent
hi SDS_Error            ctermfg=1 ctermbg=NONE
hi SDS_Success          ctermfg=2
hi SDS_Warning          ctermfg=3
hi SDS_Info             ctermfg=6

hi SDS_Visual           ctermfg=0 ctermbg=15
hi SDS_VisualDim        ctermfg=8 ctermbg=0
hi SDS_Search           ctermfg=0 ctermbg=7
hi SDS_CurSearch        ctermfg=0 ctermbg=15
hi SDS_ColorColumn      ctermbg=0 ctermfg=7 cterm=NONE

" =============================================================================
" Standard groups
" =============================================================================

hi! link Normal SDS_Normal
hi! link Visual SDS_Visual
hi! link Search SDS_Search
hi! link CurSearch SDS_CurSearch
hi! link ColorColumn SDS_ColorColumn
hi! link String SDS_Accent
hi! link Error SDS_Error

" =============================================================================
" UI
" =============================================================================

hi! link CursorLine SDS_Normal
hi! link LineNr SDS_NormalDim
hi! link CursorLineNr SDS_Normal
hi! link StatusLine SDS_Search
hi! link StatusLineNC SDS_VisualDim
hi! link VertSplit SDS_NormalDim
hi! link SignColumn SDS_NormalDim
hi! link Folded SDS_NormalDim
hi! link FoldColumn SDS_NormalDim
hi! link NonText SDS_NormalDim
hi! link Whitespace SDS_NormalDim
hi! link EndOfBuffer SDS_NormalDim

hi! link Pmenu SDS_VisualDim
hi! link PmenuSel SDS_Visual
hi! link PmenuSbar SDS_NormalDim
hi! link PmenuThumb SDS_Normal

hi! link Tabline SDS_VisualDim
hi! link TablineSel SDS_Visual
hi! link TablineFill Tabline

hi! link Title SDS_NormalBright
hi! link Directory SDS_Normal
hi! link MatchParen SDS_NormalBright
hi! link ModeMsg SDS_Normal
hi! link MoreMsg SDS_Success
hi! link Question SDS_Success

hi! link IncSearch SDS_Visual
hi! link Substitute SDS_Search
hi! link VisualNOS SDS_Visual
hi! link QuickFixLine SDS_Accent
hi! link qfFileName SDS_NormalBold
hi! link qfLineNr SDS_NormalDim
hi! link qfSeparator SDS_NormalDim
hi! link qfError SDS_Error
hi! link qfWarning SDS_Warning

hi! link ErrorMsg SDS_Error
hi! link WarningMsg SDS_Warning

" =============================================================================
" Syntax
" =============================================================================

hi! link Comment SDS_NormalDimItalic
hi! link Constant SDS_NormalBrightBold
hi! link Identifier SDS_NormalBold
hi! link Statement SDS_NormalDim
hi! link PreProc SDS_NormalDim
hi! link Type SDS_NormalDimBold
hi! link Special SDS_NormalBold
hi! link Delimiter SDS_Normal
hi! link Underlined SDS_Warning
hi! link Function SDS_Normal
hi! link Operator SDS_NormalBold

hi! link Keyword Statement
hi! link Conditional Statement
hi! link Repeat Statement
hi! link Label Statement
hi! link Exception Statement

hi! link Character String
hi! link Quote String
hi! link Todo String
hi! link Number Constant
hi! link Boolean Constant
hi! link Float Constant

hi! link SpecialComment SDS_NormalDimItalic

hi! link DiffAdd SDS_Success
hi! link DiffChange SDS_Info
hi! link DiffDelete SDS_Error
hi! link DiffText SDS_Normal

hi! link Added SDS_Success
hi! link Changed SDS_Info
hi! link Removed SDS_Error
hi! link DiffAdded SDS_Success
hi! link DiffRemoved SDS_Error
hi! link DiffChanged SDS_Info
hi! link DiffNewFile SDS_Success
hi! link DiffOldFile SDS_Normal
hi! link DiffFile SDS_Info
hi! link DiffLine SDS_Info
hi! link DiffIndexLine SDS_Normal

hi! link xmlTag SDS_NormalDim
hi! link xmlTagName SDS_NormalDim
hi! link xmlAttrib SDS_NormalDim
hi! link htmlTagName SDS_Normal
hi! link markdownCodeDelimiter SDS_Success
hi! link markdownLinkDelimiter SDS_Normal
hi! link sqlType SDS_Accent
hi! link sqlKeyword SDS_NormalDim
hi! link sqlStatement SDS_NormalDim
hi! link sqlVariable SDS_NormalDim
hi! link makeSpecial SDS_NormalDim
hi! link pythonOperator Statement

hi! link phpAlpineString SDS_Accent
hi! link phpAlpineDelimiter SDS_NormalDim

hi! link gitcommitComment SDS_NormalDim
hi! link gitcommitSummary SDS_Normal
hi! link gitcommitOverflow SDS_Warning
hi! link gitcommitHeader SDS_NormalDim
hi! link gitcommitSelectedType SDS_Success
hi! link gitcommitSelectedFile SDS_Normal
hi! link gitcommitDiscardedType SDS_Error
hi! link gitcommitDiscardedFile SDS_Normal
hi! link gitcommitUntrackedFile SDS_NormalDim

