let g:vimspectr_light_themes = [
            \ 'vimspectr0-light'  , 'vimspectr30-light' , 'vimspectr60-light' ,
            \ 'vimspectr90-light' , 'vimspectr120-light', 'vimspectr150-light',
            \ 'vimspectr180-light', 'vimspectr210-light', 'vimspectr240-light',
            \ 'vimspectr270-light', 'vimspectr300-light', 'vimspectr330-light',
            \ 'vimspectrgrey-light'
            \ ]

let g:atelier_light_themes = [
            \ 'Atelier_CaveLight',
            \ 'Atelier_DuneLight',
            \ 'Atelier_EstuaryLight',
            \ 'Atelier_ForestLight',
            \ 'Atelier_HeathLight',
            \ 'Atelier_LakesideLight',
            \ 'Atelier_PlateauLight',
            \ 'Atelier_SavannaLight',
            \ 'Atelier_SeasideLight',
            \ 'Atelier_SulphurpoolLight',
            \ ]

let g:vimspectr_dark_themes = [
            \ 'vimspectr0-dark'  , 'vimspectr30-dark' , 'vimspectr60-dark' ,
            \ 'vimspectr90-dark' , 'vimspectr120-dark', 'vimspectr150-dark',
            \ 'vimspectr180-dark', 'vimspectr210-dark', 'vimspectr240-dark',
            \ 'vimspectr270-dark', 'vimspectr300-dark', 'vimspectr330-dark',
            \ 'vimspectrgrey-dark'
            \ ]

let g:atelier_dark_themes = [
            \ 'Atelier_CaveDark',
            \ 'Atelier_DuneDark',
            \ 'Atelier_EstuaryDark',
            \ 'Atelier_ForestDark',
            \ 'Atelier_HeathDark',
            \ 'Atelier_LakesideDark',
            \ 'Atelier_PlateauDark',
            \ 'Atelier_SavannaDark',
            \ 'Atelier_SeasideDark',
            \ 'Atelier_SulphurpoolDark',
            \ ]

let g:tempus_light_themes = [
            \ 'tempus_dawn',
            \ 'tempus_day',
            \ 'tempus_fugit',
            \ 'tempus_past',
            \ 'tempus_totus'
            \ ]

let g:tempus_dark_themes = [
            \ 'tempus_autumn',
            \ 'tempus_classic',
            \ 'tempus_dusk',
            \ 'tempus_future',
            \ 'tempus_night',
            \ 'tempus_rift',
            \ 'tempus_spring',
            \ 'tempus_summer', 
            \ 'tempus_tempest',
            \ 'tempus_warp',
            \ 'tempus_winter'
            \ ]

let g:seadbird_themes = [
            \ 'greygull',
            \ 'petrel',
            \ 'seagull',
            \ 'stormpetrel'
            \ ]

"g:colorscheme_map is a list of dictionaries that specify options for
"colorschemes.  The dictionary keys are as follows:
" name : the name of the colorscheme
" comparison : If this is set to 'fuzzy' don't require an exact name match
" lightlinetheme : Specifies lightline theme to load:
"   'colorscheme': Theme name is the same as the colorscheme name
"   'colorscheme_bg' : Theme name is the same as the colorscheme name _<bg>
"      appended.
"   'dropbg' : The color scheme has Dark/Light variants that need to be
"      dropped to create the lightline theme name.
"   'substitutebg' : Part of the colorscheme name has to be substituted with
"      the bg value to create the lightline theme name.
"   The script assumes that any other value is the actual name of the
"      lightline theme to be loaded.  If no lightline theme is specified then
"      the powerline theme will be selected.
" runtime : A value of 'true' will cause the lightline theme to be sourced
"      again.  The theme values need to be recalculated because of a change in
"      the colorscheme variant.
" airlinetheme : Specifies the name of the airline theme.
"      colorscheme : the airline theme name is the sames as the colorscheme
"      name.
"      The script assumes that any other value is the name of the theme to be
"      loaded.  If no value is specified then the dark airline theme is
"      selected.
" variant_type: Specifies how to switch between different colorscheme variants
"      background: Toggle light/dark backgrounds
"      colorscheme: Use variant_base to choose different versions of the
"         colorscheme
"      colorscheme_bg: Use variant base to choose different versions of the
"         toggle to select a light and dark version of each variant.
"      materialbox_contrast: materialbox colorscheme.  Change the value of
"          g:materialbox_contrast_dark or g:materialbox_contrast_light based on
"          the current bg setting.  The background will also toggle to select
"          a light and dark version of each variant.
" variants : a list of possible variants
" variant_base: The common part of the name for all colorscheme variants
"     drop: Indicates that the variant must be removed from the colorscheme
"     before the new colorscheme is created.

let s:atelier_dict = {}
let s:atelier_dict.name = 'Atelier'
let s:atelier_dict.comparison = 'fuzzy'
let s:atelier_dict.lightlinetheme = 'dropbg'
let s:atelier_dict.runtime = 'true'
let s:atelier_dict.airlinetheme = 'colorscheme'
let s:atelier_dict.variant_type = 'Atelier'
let s:atelier_dict.variants = ['Cave', 'Dune', 'Estuary', 'Forest', 'Heath', 'Lakeside', 'Plateau', 'Savanna', 'Seaside', 'Sulphurpool']

let s:papercolor_dict = {}
let s:papercolor_dict.name = 'PaperColor'
let s:papercolor_dict.lightlinetheme = 'colorscheme'
let s:papercolor_dict.runtime = 'true'
let s:papercolor_dict.airlinetheme = 'colorscheme'
let s:papercolor_dict.variant_type = 'background'

let s:apprentice_dict = {}
let s:apprentice_dict.name = 'apprentice'
let s:apprentice_dict.lightlinetheme = 'colorscheme'
let s:apprentice_dict.airlinetheme = 'colorscheme'

let s:ayu_dict = {}
let s:ayu_dict.name = 'ayu'
let s:ayu_dict.lightlinetheme = 'colorscheme'
let s:ayu_dict.runtime = 'true'
let s:ayu_dict.airlinetheme = 'colorscheme'
let s:ayu_dict.variant_type = 'ayu_color'
let s:ayu_dict.variants = ['light', 'dark', 'mirage']

let s:cosmic_latte_dict = {}
let s:cosmic_latte_dict.name = 'cosmic_latte'
let s:cosmic_latte_dict.lightlinetheme = 'colorscheme_bg'
let s:cosmic_latte_dict.airlinetheme = 'colorscheme_bg'
let s:cosmic_latte_dict.variant_type = 'background'

let s:deep_space_dict = {}
let s:deep_space_dict.name = 'deep-space'
let s:deep_space_dict.lightlinetheme = 'deepspace'
let s:deep_space_dict.airlinetheme = 'colorscheme'

let s:desertink_dict = {}
let s:desertink_dict.name = 'desertink'
let s:desertink_dict.airlinetheme = 'colorscheme'

let s:dracula_dict = {}
let s:dracula_dict.name = 'dracula'
let s:dracula_dict.lightlinetheme = 'colorscheme'
let s:dracula_dict.airlinetheme = 'colorscheme'

let s:edge_dict = {}
let s:edge_dict.name = 'edge'
let s:edge_dict.lightlinetheme = 'colorscheme'
let s:edge_dict.airlinetheme = 'colorscheme'
let s:edge_dict.runtime = 'true'
let s:edge_dict.variant_type = 'edge_style'
let s:edge_dict.variants = ['default', 'aura', 'neon']

let s:flattened_dict = {}
let s:flattened_dict.name = 'flattened'
let s:flattened_dict.comparison = 'fuzzy'
let s:flattened_dict.lightlinetheme = 'colorscheme'
let s:flattened_dict.airlinetheme = 'colorscheme'
let s:flattened_dict.variant_type = 'colorscheme'
let s:flattened_dict.variant_base = 'drop'
let s:flattened_dict.variants = ['_light', '_dark']

let s:greygull_dict = {}
let s:greygull_dict.name = 'greygull'
let s:greygull_dict.airlinetheme = 'colorscheme'
let s:greygull_dict.variant_type = "colorscheme_group"
let s:greygull_dict.variants = g:seadbird_themes

let s:gruvbox_material_dict = {}
let s:gruvbox_material_dict.name = 'gruvbox-material'
let s:gruvbox_material_dict.lightlinetheme = 'colorscheme'
let s:gruvbox_material_dict.runtime = 'true'
let s:gruvbox_material_dict.airlinetheme = 'colorscheme'
let s:gruvbox_material_dict.variant_type = 'gruvbox_material_background'
let s:gruvbox_material_dict.variants = ['soft', 'medium', 'hard']

let s:hybrid_material_dict = {}
let s:hybrid_material_dict.name = 'hybrid_material'
let s:hybrid_material_dict.airlinetheme = 'colorscheme'
let s:hybrid_material_dict.variant_type = 'background'

let s:hybrid_reverse_dict = {}
let s:hybrid_reverse_dict.name = 'hybrid_reverse'
let s:hybrid_reverse_dict.airlinetheme = 'colorscheme'
let s:hybrid_reverse_dict.variant_type = 'background'

let s:jellybeans_dict = {}
let s:jellybeans_dict.name = 'jellybeans'
let s:jellybeans_dict.lightlinetheme = 'colorscheme'
let s:jellybeans_dict.airlinetheme = 'colorscheme'

let s:material_dict = {}
let s:material_dict.name = 'material'
let s:material_dict.lightlinetheme = 'material_vim'
let s:material_dict.runtime = 'true'
let s:material_dict.variant_type = 'material_theme_style'
let s:material_dict.variants = ['default', 'palenight', 'ocean', 'lighter', 'darker']

let s:materialbox_dict = {}
let s:materialbox_dict.name = 'materialbox'
let s:materialbox_dict.airlinetheme = 'colorscheme'
let s:materialbox_dict.variant_type = 'materialbox_contrast'
let s:materialbox_dict.variants = ['soft', 'medium', 'hard']

let s:molokai_dict = {}
let s:molokai_dict.name = 'molokai'
let s:molokai_dict.airlinetheme = 'colorscheme'

let s:monokai_dict = {}
let s:monokai_dict.name = 'monokai'
let s:monokai_dict.airlinetheme = 'colorscheme'

let s:nord_dict = {}
let s:nord_dict.name = 'nord'
let s:nord_dict.lightlinetheme = 'colorscheme'
let s:nord_dict.airlinetheme = 'colorscheme'

let s:one_dict = {}
let s:one_dict.name = 'one'
let s:one_dict.airlinetheme = 'colorscheme'
let s:one_dict.variant_type = 'colorscheme_bg'

let s:onehalfdark_dict = {}
let s:onehalfdark_dict.name = 'onehalfdark'
let s:onehalfdark_dict.lightlinetheme = 'onehalfdark'
let s:onehalfdark_dict.variant_type = 'colorscheme'
let s:onehalfdark_dict.variant_base = 'drop'
let s:onehalfdark_dict.variants = ['light', 'dark']

let s:onehalflight_dict = {}
let s:onehalflight_dict.name = 'onehalflight'
let s:onehalflight_dict.lightlinetheme = 'onehalfdark'
let s:onehalflight_dict.variant_type = 'colorscheme'
let s:onehalflight_dict.variant_base = 'drop'
let s:onehalflight_dict.variants = ['light', 'dark']

let s:palenight_dict = {}
let s:palenight_dict.name = 'palenight'
let s:palenight_dict.lightlietheme = 'colorscheme'
let s:palenight_dict.airlinetheme = 'colorscheme'

let s:pencil_dict = {}
let s:pencil_dict.name = 'pencil'
let s:pencil_dict.lightlinetheme = 'pencil_alter'
let s:pencil_dict.airlinetheme = 'colorscheme'
let s:pencil_dict.variant_type = 'background'

let s:petrel_dict = {}
let s:petrel_dict.name = 'petrel'
let s:petrel_dict.airlinetheme = 'colorscheme'
let s:petrel_dict.variant_type = "colorscheme_group"
let s:petrel_dict.variants = g:seadbird_themes

let s:seagull_dict = {}
let s:seagull_dict.name = 'seagull'
let s:seagull_dict.airlinetheme = 'colorscheme'
let s:seagull_dict.variant_type = "colorscheme_group"
let s:seagull_dict.variants = g:seadbird_themes

let s:snow_dict = {}
let s:snow_dict.name = 'snow'
let s:snow_dict.lightlinetheme = 'colorscheme_bg'
let s:snow_dict.airlinetheme = 'colorscheme_bg'
let s:snow_dict.variant_type = 'background'

let s:space_vim_theme_dict = {}
let s:space_vim_theme_dict.name = 'space_vim_theme'
let s:space_vim_theme_dict.lightlinetheme = 'substitutebg'
let s:space_vim_theme_dict.subpat = 'theme'
let s:space_vim_theme_dict.variant_type = 'background'

let s:srcery_dict = {}
let s:srcery_dict.name = 'srcery'
let s:srcery_dict.lightlinetheme = 'colorscheme'
let s:srcery_dict.airlinetheme = 'colorscheme'

let s:stellarized_dict = {}
let s:stellarized_dict.name = 'stellarized'
let s:stellarized_dict.lightlinetheme = 'colorscheme_bg'
let s:stellarized_dict.airlinetheme = 'colorscheme_bg'
let s:stellarized_dict.variant_type = 'background'

let s:stormpetrel_dict = {}
let s:stormpetrel_dict.name = 'stormpetrel'
let s:stormpetrel_dict.airlinetheme = 'colorscheme'
let s:stormpetrel_dict.variant_type = "colorscheme_group"
let s:stormpetrel_dict.variants = g:seadbird_themes

let s:tempus_dict = {}
let s:tempus_dict.name = 'tempus'
let s:tempus_dict.comparison = 'fuzzy'
let s:tempus_dict.variant_type = 'tempus'
let s:tempus_dict.variants = ['autumn', 'classic', 'dusk', 'future', 'night', 'rift', 'spring', 'summer', 'tempest', 'warp', 'winter', 'dawn', 'day', 'fugit', 'past', 'totus']

let s:true_dict = {}
let s:true_dict.name = 'true'
let s:true_dict.airlinetheme = 'colorscheme'

let s:typewriter_dict = {}
let s:typewriter_dict.name = 'typewriter'
let s:typewriter_dict.lightlinetheme = 'typewriter_light'
let s:typewriter_dict.airlinetheme = 'colorscheme'
let s:typewriter_dict.variant_type = 'colorscheme'
let s:typewriter_dict.variant_base = 'typewriter'
let s:typewriter_dict.variants = ['', '-night']

let s:typewriter_night_dict = {}
let s:typewriter_night_dict.name = 'typewriter-night'
let s:typewriter_night_dict.lightlinetheme = 'typewriter_dark'
let s:typewriter_night_dict.airlinetheme = 'colorscheme'
let s:typewriter_night_dict.variant_type = 'colorscheme'
let s:typewriter_night_dict.variant_base = 'typewriter'
let s:typewriter_night_dict.variants = ['', '-night']

let s:vimspectr_dict = {}
let s:vimspectr_dict.name = 'vimspectr'
let s:vimspectr_dict.comparison = 'fuzzy'
let s:vimspectr_dict.lightlinetheme = 'colorscheme'
let s:vimspectr_dict.variant_type = 'vimspectr'
let s:vimspectr_dict.variants = ['grey', '0', '30', '60', '90', '120', '150', '180', '210', '240', '270', '300', '330']

let s:vadelma_dict = {}
let s:vadelma_dict.name = 'vadelma'
let s:vadelma_dict.lightlinetheme = 'colorscheme'
let s:vadelma_dict.runtime = 'true'
let s:vadelma_dict.variant_type = 'background'

let g:colorscheme_map = [
         \ s:apprentice_dict,
         \ s:atelier_dict,
         \ s:ayu_dict,
         \ s:cosmic_latte_dict,
         \ s:deep_space_dict,
         \ s:desertink_dict,
         \ s:dracula_dict,
         \ s:edge_dict,
         \ s:flattened_dict,
         \ s:greygull_dict,
         \ s:gruvbox_material_dict,
         \ s:hybrid_material_dict,
         \ s:hybrid_reverse_dict,
         \ s:jellybeans_dict,
         \ s:materialbox_dict,
         \ s:material_dict,
         \ s:molokai_dict,
         \ s:monokai_dict,
         \ s:nord_dict,
         \ s:one_dict,
         \ s:onehalfdark_dict,
         \ s:onehalflight_dict,
         \ s:palenight_dict,
         \ s:papercolor_dict,
         \ s:pencil_dict,
         \ s:petrel_dict,
         \ s:seagull_dict,
         \ s:snow_dict,
         \ s:space_vim_theme_dict,
         \ s:srcery_dict,
         \ s:stellarized_dict,
         \ s:stormpetrel_dict,
         \ s:tempus_dict,
         \ s:true_dict,
         \ s:typewriter_dict,
         \ s:typewriter_night_dict,
         \ s:vadelma_dict,
         \ s:vimspectr_dict,
         \ ]

let g:colorscheme_groups = {}
let g:colorscheme_groups.group1 = g:vimspectr_light_themes
let g:colorscheme_groups.group2 = g:vimspectr_dark_themes
let g:colorscheme_groups.group3 = g:atelier_light_themes
let g:colorscheme_groups.group4 = g:atelier_dark_themes
let g:colorscheme_groups.group5 = g:seadbird_themes
let g:colorscheme_groups.group6 = g:tempus_light_themes
let g:colorscheme_groups.group7 = g:tempus_dark_themes 
