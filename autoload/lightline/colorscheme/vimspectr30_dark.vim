let s:base00 = [ '#1a140f',  0 ] " black
let s:base01 = [ '#302820', 18 ]
let s:base02 = [ '#756758', 19 ]
let s:base03 = [ '#756758',  8 ]
let s:base04 = [ '#918579', 20 ]
let s:base05 = [ '#918579',  7 ]
let s:base06 = [ '#ede4da', 21 ]
let s:base07 = [ '#fffaf5', 15 ] " white
let s:base08 = [ '#b55a4c',  1 ] " red
let s:base09 = [ '#b5734c', 16 ] " orange
let s:base0A = [ '#b59b4c',  3 ] " yellow
let s:base0B = [ '#6d8a50',  2 ] " green
let s:base0C = [ '#508a82',  6 ] " teal
let s:base0D = [ '#6a849e',  4 ] " blue
let s:base0E = [ '#8b6a9e',  5 ] " pink
let s:base0F = [ '#b57988', 17 ] " brown

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left     = [ [ s:base00, s:base0D ], [ s:base05, s:base02 ] ]
let s:p.insert.left     = [ [ s:base01, s:base0B ], [ s:base05, s:base02 ] ]
let s:p.visual.left     = [ [ s:base00, s:base09 ], [ s:base05, s:base02 ] ]
let s:p.replace.left    = [ [ s:base00, s:base08 ], [ s:base05, s:base02 ] ]
let s:p.inactive.left   = [ [ s:base02, s:base00 ] ]

let s:p.normal.middle   = [ [ s:base07, s:base01 ] ]
let s:p.inactive.middle = [ [ s:base01, s:base00 ] ]

let s:p.normal.right    = [ [ s:base01, s:base03 ], [ s:base06, s:base02 ] ]
let s:p.inactive.right  = [ [ s:base01, s:base00 ] ]

let s:p.normal.error    = [ [ s:base07, s:base08 ] ]
let s:p.normal.warning  = [ [ s:base07, s:base09 ] ]

let s:p.tabline.left    = [ [ s:base05, s:base02 ] ]
let s:p.tabline.middle  = [ [ s:base05, s:base01 ] ]
let s:p.tabline.right   = [ [ s:base05, s:base02 ] ]
let s:p.tabline.tabsel  = [ [ s:base02, s:base0A ] ]

let g:lightline#colorscheme#vimspectr30_dark#palette = lightline#colorscheme#flatten(s:p)
