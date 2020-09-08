let g:vimspectr_light_themes = [
                             \ 'vimspectr0-light'  , 'vimspectr30-light' , 'vimspectr60-light' ,
                             \ 'vimspectr90-light' , 'vimspectr120-light', 'vimspectr150-light',
                             \ 'vimspectr180-light', 'vimspectr210-light', 'vimspectr240-light',
                             \ 'vimspectr270-light', 'vimspectr300-light', 'vimspectr330-light',
                             \ 'vimspectrgrey-light'
                             \ ]

let g:atelier_light_themes   = [
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

let g:vimspectr_dark_themes  = [
                             \ 'vimspectr0-dark'  , 'vimspectr30-dark' , 'vimspectr60-dark' ,
                             \ 'vimspectr90-dark' , 'vimspectr120-dark', 'vimspectr150-dark',
                             \ 'vimspectr180-dark', 'vimspectr210-dark', 'vimspectr240-dark',
                             \ 'vimspectr270-dark', 'vimspectr300-dark', 'vimspectr330-dark',
                             \ 'vimspectrgrey-dark'
                             \ ]

let g:atelier_dark_themes    = [
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

let g:seabird_themes         = [
                             \ 'greygull',
                             \ 'petrel',
                             \ 'seagull',
                             \ 'stormpetrel'
                             \ ]

"g:colorscheme_map is a list of dictionaries that specify options for
"colorschemes.  The dictionary keys are as follows:
" name : the name of the colorscheme
" comparison : If this is set to 'fuzzy' don't require an exact name match
" variants : a list of possible variants

function! AtelierMap (key,val) dict
  if &background == 'light'
    let l:back = 'Light'
  else
    let l:back = 'Dark'
  endif
  return self.name . '_' . a:val . l:back
endfunction

function! AtelierLightlineTheme() dict
  if &background == 'Light'
    let l:lightlinetheme = split (g:colors_name, "Light")
  else
    let l:lightlinetheme = split (g:colors_name, "Dark")
  endif
  return l:lightlinetheme
endfunction

function! FlattenedMap (key,val) dict
  return self.name . a:val
endfunction

function! SeagullAirlineTheme() dict
  return 'seagull'
endfunction

function! TypewriterMap (key,val) dict
  return 'typewriter' . a:val
endfunction

function! TypewriterLightlineTheme() dict
  return 'typewriter_light'
endfunction

function! TypewriterNightLightlineTheme() dict
  return 'typewriter_dark'
endfunction

function! TypewriterNightAirlineTheme() dict
  return 'typewriter'
endfunction

function! VimspectrMap (key,val) dict
  return self.name . a:val . '-' . &background
endfunction

let g:colorscheme_map = [
                        \ {
                        \ 'name'              : 'Atelier',
                        \ 'comparison'        : 'fuzzy',
                        \ 'variants'          : ['Cave', 'Dune', 'Estuary', 'Forest', 'Heath', 'Lakeside', 'Plateau', 'Savanna', 'Seaside', 'Sulphurpool'],
                        \ 'dark_tag'          : 'Dark',
                        \ 'light_tag'         : 'Light',
                        \ 'NextVariant'       : function('colorschemefunctions#NextColorschemeVariantMap'),
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \ 'LightlineTheme'    : function('AtelierLightlineTheme'),
                        \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ 'ToggleScheme'      : function('colorschemefunctions#ToggleColorscheme'),
                        \ 'Map'               : function('AtelierMap'),
                        \ },
                        \ {
                        \ 'name'              : 'apprentice',
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ },
                        \ {
                        \ 'name'                : 'ayu',
                        \ 'variants'            : ['light', 'dark', 'mirage'],
                        \ 'style_variable_name' : 'g:ayucolor',
                        \ 'NextVariant'         : function('colorschemefunctions#NextStyleVariant'),
                        \ 'StatusColorscheme'   : function('colorschemefunctions#StatusColorschemeStyle'),
                        \ 'LightlineTheme'      : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \ 'AirlineTheme'        : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ },
                        \ {
                        \ 'name'              : 'cosmic_latte',
                        \ 'NextVariant'       : function('colorschemefunctions#NextBackgroundVariant'),
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorschemeBackground'),
                        \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorschemeBackground'),
                        \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorschemeBackground'),
                        \ 'ToggleScheme'      : function('colorschemefunctions#ToggleBackground'),
                        \ },
                        \ {
                        \ 'name'              : 'deep-space',
                        \ 'tr_from'           : '-',
                        \ 'tr_to'             : '_',
                        \ 'pat'               : '-',
                        \ 'sub'               : '',
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorschemeSub'),
                        \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorschemeTR'),
                        \ },
                        \ {
                        \ 'name'              : 'desertink',
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ },
                        \ {
                        \ 'name'              : 'desertink',
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ },
                        \ {
                        \ 'name'              : 'dracula',
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ },
                        \ {
                        \ 'name'                : 'edge',
                        \ 'variants'            : ['default', 'aura', 'neon'],
                        \ 'style_variable_name' : 'g:edge_style',
                        \ 'NextVariant'         : function('colorschemefunctions#NextStyleVariant'),
                        \ 'StatusColorscheme'   : function('colorschemefunctions#StatusColorschemeStyle'),
                        \ 'LightlineTheme'      : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \ 'AirlineTheme'        : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ 'ToggleScheme'        : function('colorschemefunctions#ToggleBackground'),
                        \ },
                        \ {
                        \ 'name'              : 'flattened',
                        \ 'comparison'        : 'fuzzy',
                        \ 'variants'          : ['_light', '_dark'],
                        \ 'NextVariant'       : function('colorschemefunctions#NextColorschemeVariantMap'),
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \ 'ToggleScheme'      : function('colorschemefunctions#ToggleColorscheme'),
                        \ 'Map'               : function('FlattenedMap'),
                        \ },
                        \ {
                        \ 'name'              : 'forest-night',
                        \ 'dark_tag'          : 'dark',
                        \ 'light_tag'         : 'light',
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ 'ToggleScheme'      : function('colorschemefunctions#ToggleColorscheme'),
                        \ },
                        \ {
                        \ 'name'              : 'greygull',
                        \ 'variants'          : g:seabird_themes,
                        \ 'NextVariant'       : function('colorschemefunctions#NextColorschemeVariant'),
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \ 'AirlineTheme'      : function('SeagullAirlineTheme'),
                        \ },
                        \ {
                        \ 'name'                : 'gruvbox-material',
                        \ 'variants'            : ['soft', 'medium', 'hard'],
                        \ 'style_variable_name' : 'g:gruvbox_material_background',
                        \ 'tr_from'             : '-',
                        \ 'tr_to'               : '_',
                        \ 'NextVariant'         : function('colorschemefunctions#NextStyleVariant'),
                        \ 'StatusColorscheme'   : function('colorschemefunctions#StatusColorschemeStyle'),
                        \ 'LightlineTheme'      : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \ 'AirlineTheme'        : function('colorschemefunctions#AirlineThemeColorschemeTR'),
                        \ 'ToggleScheme'        : function('colorschemefunctions#ToggleBackground'),
                        \ },
                        \ {
                        \ 'name'              : 'iceberg',
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ },
                        \ {
                        \ 'name'              : 'jellybeans',
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ },
                        \ {
                        \ 'name'                : 'material',
                        \ 'variants'            : ['default', 'palenight', 'ocean', 'lighter', 'darker'],
                        \ 'style_variable_name' : 'g:material_theme_style',
                        \ 'suffix'              : '_vim',
                        \ 'NextVariant'         : function('colorschemefunctions#NextStyleVariant'),
                        \ 'StatusColorscheme'   : function('colorschemefunctions#StatusColorschemeStyle'),
                        \ 'LightlineTheme'      : function('colorschemefunctions#LightlineThemeColorschemeSuffix'),
                        \ 'AirlineTheme'        : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ },
                        \ {
                        \ 'name'                : 'materialbox',
                        \ 'variants'            : ['soft', 'medium', 'hard'],
                        \ 'style_variable_name' : (&background == 'dark') ? 'g:materialbox_contrast_dark' : 'g:materialbox_contrast_light',
                        \ 'NextVariant'         : function('colorschemefunctions#NextStyleVariant'),
                        \ 'StatusColorscheme'   : function('colorschemefunctions#StatusColorschemeStyle'),
                        \ 'AirlineTheme'        : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ 'ToggleScheme'        : function('colorschemefunctions#ToggleBackground'),
                        \ },
                        \ {
                        \ 'name'              : 'nord',
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ },
                        \ {
                        \ 'name'              : 'one',
                        \ 'NextVariant'       : function('colorschemefunctions#NextBackgroundVariant'),
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorschemeBackground'),
                        \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ 'ToggleScheme'      : function('colorschemefunctions#ToggleBackground'),
                        \ },
                        \ {
                        \ 'name'              : 'palenight',
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ },
                        \ {
                        \ 'name'              : 'PaperColor',
                        \ 'NextVariant'       : function('colorschemefunctions#NextBackgroundVariant'),
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorschemeBackground'),
                        \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorschemeLower'),
                        \ 'ToggleScheme'      : function('colorschemefunctions#ToggleBackground'),
                        \ },
                        \ {
                        \ 'name'              : 'pencil',
                        \ 'NextVariant'       : function('colorschemefunctions#NextBackgroundVariant'),
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorschemeBackground'),
                        \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ 'ToggleScheme'      : function('colorschemefunctions#ToggleBackground'),
                        \ },
                        \ {
                        \ 'name'              : 'petrel',
                        \ 'variants'          : g:seabird_themes,
                        \ 'NextVariant'       : function('colorschemefunctions#NextColorschemeVariant'),
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \ 'AirlineTheme'      : function('SeagullAirlineTheme'),
                        \ },
                        \ {
                        \ 'name'              : 'pop-punk',
                        \ 'tr_from'           : '-',
                        \ 'tr_to'             : '_',
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorschemeTR'),
                        \ },
                        \ {
                        \ 'name'              : 'seagull',
                        \ 'variants'          : g:seabird_themes,
                        \ 'NextVariant'       : function('colorschemefunctions#NextColorschemeVariant'),
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ },
                        \ {
                        \ 'name'                : 'sonokai',
                        \ 'variants'            : ['default', 'atlantis', 'andromeda', 'maia'],
                        \ 'style_variable_name' : 'g:sonokai_style',
                        \ 'NextVariant'         : function('colorschemefunctions#NextStyleVariant'),
                        \ 'StatusColorscheme'   : function('colorschemefunctions#StatusColorschemeStyle'),
                        \ 'LightlineTheme'      : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \ 'AirlineTheme'        : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ },
                        \ {
                        \ 'name'              : 'snow',
                        \ 'NextVariant'       : function('colorschemefunctions#NextBackgroundVariant'),
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorschemeBackground'),
                        \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorschemeBackground'),
                        \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorschemeBackground'),
                        \ 'ToggleScheme'      : function('colorschemefunctions#ToggleBackground'),
                        \ },
                        \ {
                        \ 'name'              : 'space_vim_theme',
                        \ 'pat'               : 'theme',
                        \ 'NextVariant'       : function('colorschemefunctions#NextBackgroundVariant'),
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorschemeBackground'),
                        \ 'ToggleScheme'      : function('colorschemefunctions#ToggleBackground'),
                        \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorschemeSubBackground')
                        \ },
                        \ {
                        \ 'name'              : 'srcery',
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ },
                        \ {
                        \ 'name'              : 'stellarized',
                        \ 'NextVariant'       : function('colorschemefunctions#NextBackgroundVariant'),
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorschemeBackground'),
                        \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorschemeBackground'),
                        \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorschemeBackground'),
                        \ 'ToggleScheme'      : function('colorschemefunctions#ToggleBackground'),
                        \ },
                        \ {
                        \ 'name'              : 'stormpetrel',
                        \ 'variants'          : g:seabird_themes,
                        \ 'NextVariant'       : function('colorschemefunctions#NextColorschemeVariant'),
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \ 'AirlineTheme'      : function('SeagullAirlineTheme'),
                        \ },
                        \ {
                        \ 'name'              : 'tokyo-metro',
                        \ 'pat'               : '-',
                        \ 'sub'               : '',
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorschemeSub'),
                        \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorschemeSub'),
                        \ },
                        \ {
                        \ 'name'              : 'typewriter',
                        \ 'variants'          : ['', '-night'],
                        \ 'NextVariant'       : function('colorschemefunctions#NextColorschemeVariantMap'),
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \ 'LightlineTheme'    : function('TypewriterLightlineTheme'),
                        \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ 'Map'               : function('TypewriterMap'),
                        \ },
                        \ {
                        \ 'name'              : 'typewriter-night',
                        \ 'variants'          : ['', '-night'],
                        \ 'NextVariant'       : function('colorschemefunctions#NextColorschemeVariantMap'),
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \ 'LightlineTheme'    : function('TypewriterNightLightlineTheme'),
                        \ 'AirlineTheme'      : function('TypewriterNightAirlineTheme'),
                        \ 'Map'               : function('TypewriterMap'),
                        \ },
                        \ {
                        \ 'name'              : 'vimspectr',
                        \ 'comparison'        : 'fuzzy',
                        \ 'variant_type'      : 'vimspectr',
                        \ 'variants'          : ['grey', '0', '30', '60', '90', '120', '150', '180', '210', '240', '270', '300', '330'],
                        \ 'dark_tag'          : 'dark',
                        \ 'light_tag'         : 'light',
                        \ 'tr_from'           : '-',
                        \ 'tr_to'             : '_',
                        \ 'NextVariant'       : function('colorschemefunctions#NextColorschemeVariantMap'),
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorschemeTR'),
                        \ 'ToggleScheme'      : function('colorschemefunctions#ToggleColorscheme'),
                        \ 'Map'               : function('VimspectrMap'),
                        \ },
                        \ {
                        \ 'name'              : 'vadelma',
                        \ 'NextVariant'       : function('colorschemefunctions#NextBackgroundVariant'),
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorschemeBackground'),
                        \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \ 'ToggleScheme'      : function('colorschemefunctions#ToggleBackground'),
                        \ },
                        \ ]


let g:colorscheme_groups        = {}
let g:colorscheme_groups.group1 = g:vimspectr_light_themes
let g:colorscheme_groups.group2 = g:vimspectr_dark_themes
let g:colorscheme_groups.group3 = g:atelier_light_themes
let g:colorscheme_groups.group4 = g:atelier_dark_themes
let g:colorscheme_groups.group5 = g:seabird_themes
