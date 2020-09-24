let g:colorscheme_groups = {
                           \  'vimspectr_light_themes' : [
                           \                               'vimspectr0-light'  , 'vimspectr30-light' , 'vimspectr60-light' ,
                           \                               'vimspectr90-light' , 'vimspectr120-light', 'vimspectr150-light',
                           \                               'vimspectr180-light', 'vimspectr210-light', 'vimspectr240-light',
                           \                               'vimspectr270-light', 'vimspectr300-light', 'vimspectr330-light',
                           \                               'vimspectrgrey-light'
                           \                              ],
                           \  'atelier_light_themes'   : [
                           \                               'atelier_cavelight',
                           \                               'atelier_dunelight',
                           \                               'atelier_estuarylight',
                           \                               'atelier_forestlight',
                           \                               'atelier_heathlight',
                           \                               'atelier_lakesidelight',
                           \                               'atelier_plateaulight',
                           \                               'atelier_savannalight',
                           \                               'atelier_seasidelight',
                           \                               'atelier_sulphurpoollight',
                           \                             ],
                           \  'vimspectr_dark_themes'  : [
                           \                               'vimspectr0-dark'  , 'vimspectr30-dark' , 'vimspectr60-dark' ,
                           \                               'vimspectr90-dark' , 'vimspectr120-dark', 'vimspectr150-dark',
                           \                               'vimspectr180-dark', 'vimspectr210-dark', 'vimspectr240-dark',
                           \                               'vimspectr270-dark', 'vimspectr300-dark', 'vimspectr330-dark',
                           \                               'vimspectrgrey-dark'
                           \                             ],
                           \  'atelier_dark_themes'    : [
                           \                               'atelier_cavedark',
                           \                               'atelier_dunedark',
                           \                               'atelier_estuarydark',
                           \                               'atelier_forestdark',
                           \                               'atelier_heathdark',
                           \                               'atelier_lakesidedark',
                           \                               'atelier_plateaudark',
                           \                               'atelier_savannadark',
                           \                               'atelier_seasidedark',
                           \                               'atelier_sulphurpooldark',
                           \                             ],
                           \  'seabird_themes'         : [
                           \                               'greygull',
                           \                               'petrel',
                           \                               'seagull',
                           \                               'stormpetrel'
                           \                             ],
                           \ }

"g:colorscheme_map is a list of dictionaries that specify options for colorschemes.  All keys but name and StatusColorscheme are optional.  The dictionary keys are as follows:
" name                : the name of the colorscheme
" comparison          : If this is set to 'fuzzy' don't require an exact name match
" variants            : a list of possible variants
" dark_tag/light_tag  : strings to be used in colorschemefunctions#ToggleColorscheme
" style_variable_name : name of style variable to be used in colorschemefunctions#NextStyleVariant and colorschemefunctions#ToggleColorschemeStyle
" default_style       : default style variant
" pre_commands        : list of commands to run before setting the colorscheme, intended to set configuration variables for the scheme.
" tr_from/tr_to       : strings to be used in colorschemefunctions#AirlineThemeColorschemeTR and colorschemefunctions#LightlineThemeColorschemeTR
" pat/sub             : strings to be used in colorschemefunctions#AirlineThemeColorschemeSub and colorschemefunctions#LightlineThemeColorschemeSub
" suffix              : string to be used in colorschemefunctions#AirlineThemeColorschemeSuffix and colorschemefunctions#LightlineThemeColorschemeSuffix
" pat                 : string to be used in colorschemefunctions#AirlineThemeColorschemeSubBackground and colorschemefunctions#LightlineThemeColorschemeSubBackground
" NextVariant         : funcref to choose next colorscheme variant
" DefaultVariant      : funcref to generate statement to set default colorscheme style
" StatusColorscheme   : funcref to create colorscheme name to be placed in the status bar
" LightlineTheme      : funcref to choose the lightline colorscheme
" AirlineTheme        : funcref to choose the airline theme
" ToggleScheme        : funcref to toggle between light and dark versions of the colorscheme
" Map                 : funcref for map function to be used in colorschemefunctions#NextColorschemeVariantMap
" All keys but name and StatusColorscheme are optional.

let g:colorscheme_map = [
                        \ {
                        \   'name'              : 'Atelier',
                        \   'comparison'        : 'fuzzy',
                        \   'variants'          : ['Cave', 'Dune', 'Estuary', 'Forest', 'Heath', 'Lakeside', 'Plateau', 'Savanna', 'Seaside', 'Sulphurpool'],
                        \   'dark_tag'          : 'Dark',
                        \   'light_tag'         : 'Light',
                        \   'NextVariant'       : function('colorschemefunctions#NextColorschemeVariantMap'),
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \   'LightlineTheme'    : function('myfunctions#AtelierLightlineTheme'),
                        \   'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \   'ToggleScheme'      : function('colorschemefunctions#ToggleColorscheme'),
                        \   'Map'               : function('myfunctions#AtelierMap'),
                        \ },
                        \ {
                        \   'name'              : 'atlas',
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \   'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \ },
                        \ {
                        \   'name'              : 'apprentice',
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \   'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \   'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ },
                        \ {
                        \   'name'                : 'ayu',
                        \   'variants'            : ['light', 'dark', 'mirage'],
                        \   'style_variable_name' : 'g:ayucolor',
                        \   'default_style'       : 'light',
                        \   'NextVariant'         : function('colorschemefunctions#NextStyleVariant'),
                        \   'DefaultVariant'      : function('colorschemefunctions#DefaultStyleVariant'),
                        \   'StatusColorscheme'   : function('colorschemefunctions#StatusColorschemeStyle'),
                        \   'LightlineTheme'      : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \   'AirlineTheme'        : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \   'ToggleScheme'        : function('colorschemefunctions#ToggleColorschemeStyle'),
                        \ },
                        \ {
                        \   'name'              : 'base16',
                        \   'comparison'        : 'fuzzy',
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \   'AirlineTheme'      : function('myfunctions#Base16AirlineTheme'),
                        \ },
                        \ {
                        \   'name'              : 'cosmic_latte',
                        \   'NextVariant'       : function('colorschemefunctions#NextBackgroundVariant'),
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorschemeBackground'),
                        \   'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorschemeBackground'),
                        \   'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorschemeBackground'),
                        \   'ToggleScheme'      : function('colorschemefunctions#ToggleBackground'),
                        \ },
                        \ {
                        \   'name'              : 'deep-space',
                        \   'tr_from'           : '-',
                        \   'tr_to'             : '_',
                        \   'pat'               : '-',
                        \   'sub'               : '',
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \   'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorschemeSub'),
                        \   'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorschemeTR'),
                        \ },
                        \ {
                        \   'name'              : 'desertink',
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \   'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ },
                        \ {
                        \   'name'              : 'deus',
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \   'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ },
                        \ {
                        \   'name'              : 'distinguished',
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \   'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ },
                        \ {
                        \   'name'              : 'dogrun',
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \   'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \ },
                        \ {
                        \   'name'              : 'dracula',
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \   'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \   'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ },
                        \ {
                        \   'name'                : 'edge',
                        \   'variants'            : ['default', 'aura', 'neon'],
                        \   'style_variable_name' : 'g:edge_style',
                        \   'default_style'       : 'default',
                        \   'NextVariant'         : function('colorschemefunctions#NextStyleVariant'),
                        \   'DefaultVariant'      : function('colorschemefunctions#DefaultStyleVariant'),
                        \   'StatusColorscheme'   : function('colorschemefunctions#StatusColorschemeStyle'),
                        \   'LightlineTheme'      : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \   'AirlineTheme'        : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \   'ToggleScheme'        : function('colorschemefunctions#ToggleBackground'),
                        \ },
                        \ {
                        \   'name'              : 'flattened',
                        \   'comparison'        : 'fuzzy',
                        \   'variants'          : ['_light', '_dark'],
                        \   'NextVariant'       : function('colorschemefunctions#NextColorschemeVariantMap'),
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \   'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \   'ToggleScheme'      : function('colorschemefunctions#ToggleColorscheme'),
                        \   'Map'               : function('myfunctions#FlattenedMap'),
                        \ },
                        \ {
                        \   'name'              : 'forest-night',
                        \   'dark_tag'          : 'dark',
                        \   'light_tag'         : 'light',
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \   'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \   'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \   'ToggleScheme'      : function('colorschemefunctions#ToggleColorscheme'),
                        \ },
                        \ {
                        \   'name'              : 'greygull',
                        \   'variants'          : g:colorscheme_groups.seabird_themes,
                        \   'NextVariant'       : function('colorschemefunctions#NextColorschemeVariant'),
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \   'AirlineTheme'      : function('myfunctions#SeagullAirlineTheme'),
                        \ },
                        \ {
                        \   'name'                : 'gruvbox-material',
                        \   'variants'            : ['soft', 'medium', 'hard'],
                        \   'style_variable_name' : 'g:gruvbox_material_background',
                        \   'default_style'       : 'hard',
                        \   'pre_commands'        : ['let g:gruvbox_material_better_performance = 1'],
                        \   'tr_from'             : '-',
                        \   'tr_to'               : '_',
                        \   'NextVariant'         : function('colorschemefunctions#NextStyleVariant'),
                        \   'DefaultVariant'      : function('colorschemefunctions#DefaultStyleVariant'),
                        \   'StatusColorscheme'   : function('colorschemefunctions#StatusColorschemeStyle'),
                        \   'LightlineTheme'      : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \   'AirlineTheme'        : function('colorschemefunctions#AirlineThemeColorschemeTR'),
                        \   'ToggleScheme'        : function('colorschemefunctions#ToggleBackground'),
                        \ },
                        \ {
                        \   'name'              : 'iceberg',
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \   'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \   'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ },
                        \ {
                        \   'name'              : 'jellybeans',
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \   'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ },
                        \ {
                        \   'name'              : 'landscape',
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \   'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ },
                        \ {
                        \   'name'                : 'material',
                        \   'variants'            : ['default', 'palenight', 'ocean', 'lighter', 'darker'],
                        \   'style_variable_name' : 'g:material_theme_style',
                        \   'default_style'       : 'palenight',
                        \   'pre_commands'        : ['let g:material_terminal_italics = 1'],
                        \   'suffix'              : '_vim',
                        \   'NextVariant'         : function('colorschemefunctions#NextStyleVariant'),
                        \   'DefaultVariant'      : function('colorschemefunctions#DefaultStyleVariant'),
                        \   'StatusColorscheme'   : function('colorschemefunctions#StatusColorschemeStyle'),
                        \   'LightlineTheme'      : function('colorschemefunctions#LightlineThemeColorschemeSuffix'),
                        \   'AirlineTheme'        : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ },
                        \ {
                        \   'name'                : 'materialbox',
                        \   'variants'            : ['soft', 'medium', 'hard'],
                        \   'style_variable_name' : 'g:materialbox_contrast',
                        \   'default_style'       : 'hard',
                        \   'NextVariant'         : function('colorschemefunctions#NextStyleBackgroundVariant'),
                        \   'DefaultVariant'      : function('colorschemefunctions#DefaultStyleBackgroundVariant'),
                        \   'StatusColorscheme'   : function('colorschemefunctions#StatusColorschemeBackgroundStyle'),
                        \   'AirlineTheme'        : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \   'ToggleScheme'        : function('colorschemefunctions#ToggleBackground'),
                        \ },
                        \ {
                        \   'name'                : 'night-owl',
                        \   'pat'               : '-',
                        \   'sub'               : '',
                        \   'StatusColorscheme'   : function('colorschemefunctions#StatusColorscheme'),
                        \   'LightlineTheme'      : function('colorschemefunctions#LightlineThemeColorschemeSub'),
                        \ },
                        \ {
                        \   'name'              : 'nord',
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \   'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \   'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ },
                        \ {
                        \   'name'              : 'one',
                        \   'NextVariant'       : function('colorschemefunctions#NextBackgroundVariant'),
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorschemeBackground'),
                        \   'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \   'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \   'ToggleScheme'      : function('colorschemefunctions#ToggleBackground'),
                        \ },
                        \ {
                        \   'name'              : 'palenight',
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \   'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \   'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ },
                        \ {
                        \   'name'              : 'PaperColor',
                        \   'NextVariant'       : function('colorschemefunctions#NextBackgroundVariant'),
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorschemeBackground'),
                        \   'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \   'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorschemeLower'),
                        \   'ToggleScheme'      : function('colorschemefunctions#ToggleBackground'),
                        \ },
                        \ {
                        \   'name'              : 'pencil',
                        \   'NextVariant'       : function('colorschemefunctions#NextBackgroundVariant'),
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorschemeBackground'),
                        \   'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \   'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \   'ToggleScheme'      : function('colorschemefunctions#ToggleBackground'),
                        \ },
                        \ {
                        \   'name'              : 'petrel',
                        \   'variants'          : g:colorscheme_groups.seabird_themes,
                        \   'NextVariant'       : function('colorschemefunctions#NextColorschemeVariant'),
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \   'AirlineTheme'      : function('myfunctions#SeagullAirlineTheme'),
                        \ },
                        \ {
                        \   'name'              : 'pop-punk',
                        \   'tr_from'           : '-',
                        \   'tr_to'             : '_',
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \   'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorschemeTR'),
                        \ },
                        \ {
                        \   'name'              : 'seagull',
                        \   'variants'          : g:colorscheme_groups.seabird_themes,
                        \   'NextVariant'       : function('colorschemefunctions#NextColorschemeVariant'),
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \   'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ },
                        \ {
                        \   'name'                : 'sonokai',
                        \   'variants'            : ['default', 'atlantis', 'andromeda', 'maia'],
                        \   'style_variable_name' : 'g:sonokai_style',
                        \   'default_style'       : 'default',
                        \   'pre_commands'        : ['let g:sonokai_better_performance = 1'],
                        \   'NextVariant'         : function('colorschemefunctions#NextStyleVariant'),
                        \   'DefaultVariant'      : function('colorschemefunctions#DefaultStyleVariant'),
                        \   'StatusColorscheme'   : function('colorschemefunctions#StatusColorschemeStyle'),
                        \   'LightlineTheme'      : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \   'AirlineTheme'        : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ },
                        \ {
                        \   'name'              : 'snow',
                        \   'NextVariant'       : function('colorschemefunctions#NextBackgroundVariant'),
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorschemeBackground'),
                        \   'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorschemeBackground'),
                        \   'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorschemeBackground'),
                        \   'ToggleScheme'      : function('colorschemefunctions#ToggleBackground'),
                        \ },
                        \ {
                        \   'name'              : 'space_vim_theme',
                        \   'pat'               : 'theme',
                        \   'NextVariant'       : function('colorschemefunctions#NextBackgroundVariant'),
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorschemeBackground'),
                        \   'ToggleScheme'      : function('colorschemefunctions#ToggleBackground'),
                        \   'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorschemeSubBackground')
                        \ },
                        \ {
                        \   'name'              : 'srcery',
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \   'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \   'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ },
                        \ {
                        \   'name'              : 'stellarized',
                        \   'NextVariant'       : function('colorschemefunctions#NextBackgroundVariant'),
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorschemeBackground'),
                        \   'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorschemeBackground'),
                        \   'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorschemeBackground'),
                        \   'ToggleScheme'      : function('colorschemefunctions#ToggleBackground'),
                        \ },
                        \ {
                        \   'name'              : 'stormpetrel',
                        \   'variants'          : g:colorscheme_groups.seabird_themes,
                        \   'NextVariant'       : function('colorschemefunctions#NextColorschemeVariant'),
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \   'AirlineTheme'      : function('myfunctions#SeagullAirlineTheme'),
                        \ },
                        \ {
                        \   'name'              : 'tokyo-metro',
                        \   'pat'               : '-',
                        \   'sub'               : '',
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \   'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorschemeSub'),
                        \   'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorschemeSub'),
                        \ },
                        \ {
                        \   'name'              : 'twilight',
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \ },
                        \ {
                        \   'name'              : 'vimspectr',
                        \   'comparison'        : 'fuzzy',
                        \   'variants'          : ['grey', '0', '30', '60', '90', '120', '150', '180', '210', '240', '270', '300', '330'],
                        \   'dark_tag'          : 'dark',
                        \   'light_tag'         : 'light',
                        \   'tr_from'           : '-',
                        \   'tr_to'             : '_',
                        \   'NextVariant'       : function('colorschemefunctions#NextColorschemeVariantMap'),
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \   'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorschemeTR'),
                        \   'ToggleScheme'      : function('colorschemefunctions#ToggleColorscheme'),
                        \   'Map'               : function('myfunctions#VimspectrMap'),
                        \ },
                        \ {
                        \   'name'              : 'vadelma',
                        \   'NextVariant'       : function('colorschemefunctions#NextBackgroundVariant'),
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorschemeBackground'),
                        \   'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \   'ToggleScheme'      : function('colorschemefunctions#ToggleBackground'),
                        \ },
                        \ {
                        \   'name'              : 'vividchalk',
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \ },
                        \ {
                        \   'name'              : 'xcode',
                        \   'comparison'        : 'fuzzy',
                        \   'variants'          : ['xcodedark', 'xcodelight', 'xcodewwdc', 'xcodedarkhc', 'xcodelighthc'],
                        \   'dark_tag'          : 'dark',
                        \   'light_tag'         : 'light',
                        \   'NextVariant'       : function('colorschemefunctions#NextColorschemeVariant'),
                        \   'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \   'ToggleScheme'      : function('colorschemefunctions#ToggleColorscheme'),
                        \   'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ },
                        \ ]

let g:prefer_airline = 1
let g:default_airline_theme = 'distinguished'
let g:default_lightline_colorscheme = 'powerline'
let g:colorscheme_file = '~/.vim/.colorscheme'

augroup ColorschemeSetup
  autocmd!
  if has('patch-8.0.1777')
    autocmd ColorschemePre Atelier*Dark set background=dark
    autocmd ColorschemePre Atelier*Light set background=light
    autocmd ColorschemePre vimspectr*dark set background=dark
    autocmd ColorschemePre vimspectr*light set background=light
    autocmd ColorSchemePre * let g:current_color_dictionary = colorschemefunctions#GetColorDictionary(expand('<amatch>'))
                         \ | if has_key (g:current_color_dictionary, 'DefaultVariant')
                         \ |   if !exists('g:colors_name') || g:colors_name != expand('<amatch>')
                         \ |     call g:current_color_dictionary.DefaultVariant()
                         \ |   endif
                         \ | endif
                         \ | if has_key (g:current_color_dictionary, 'pre_commands')
                         \ |   for command in g:current_color_dictionary.pre_commands
                         \ |     exec command
                         \ |   endfor
                         \ | endif
  endif
augroup END

augroup StatusBarTheme
  autocmd!
  autocmd Colorscheme * call writefile([&background, expand('<amatch>')], expand(g:colorscheme_file))
                    \ | if myfunctions#WhichStatus(expand('<amatch>')) == "airline"
                    \ |   packadd vim-airline
                    \ |   packadd vim-airline-themes
                    \ |   let g:airline_section_x = airline#section#create_right(['%-25{g:current_color_dictionary.StatusColorscheme()}', 'bookmark', 'tagbar', 'vista', 'gutentags', 'grepper', 'filetype'])
                    \ |   call colorschemefunctions#AirlineTheme()
                    \ | endif
                    \ | if myfunctions#WhichStatus(expand('<amatch>')) == "lightline"
                    \ |   packadd lightline.vim | packadd lightline-buffer
                    \ |   packadd lightline_foobar.vim
                    \ |   call lightlinefunctions#LightlineUpdate()
                    \ | endif
                    \ | if myfunctions#WhichStatus(expand('<amatch>')) == "none" && exists('g:loaded_lightline')
                    \ |   call lightlinefunctions#LightlineUpdate()
                    \ | endif
                    \ | if myfunctions#WhichStatus(expand('<amatch>')) == "none" && exists('g:loaded_airline')
                    \ |   call colorschemefunctions#AirlineTheme()
                    \ | endif
                    \ | if myfunctions#WhichStatus(expand('<amatch>')) == "none" && !exists('g:loaded_lightline') && !exists('g:loaded_airline')
                    \ |   packadd vim-buftabline
                    \ | endif
augroup END

autocmd! VimEnter * call colorschemefunctions#SetLastColorscheme()

nmap <silent> <leader>- :<c-u>call colorschemefunctions#SchemeVariant(-v:count1)<cr>
nmap <silent> <leader>+ :<c-u>call colorschemefunctions#SchemeVariant(+v:count1)<cr>
nmap <silent> <leader>b :<c-u>call colorschemefunctions#ToggleScheme()<cr>
