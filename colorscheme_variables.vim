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

let s:atelier_dict = {
                     \ 'name'              : 'Atelier',
                     \ 'comparison'        : 'fuzzy',
                     \ 'variants'          : ['Cave', 'Dune', 'Estuary', 'Forest', 'Heath', 'Lakeside', 'Plateau', 'Savanna', 'Seaside', 'Sulphurpool'],
                     \ 'dark_tag'          : 'Dark',
                     \ 'light_tag'         : 'Light',
                     \ 'NextVariant'       : function('colorschemefunctions#NextColorschemeVariantMap'),
                     \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                     \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                     \ 'ToggleScheme'      : function('colorschemefunctions#ToggleColorscheme'),
                     \ }
function! s:atelier_dict.Map (key,val)
  if &background == 'light'
    let l:back = 'Light'
  else
    let l:back = 'Dark'
  endif
  return self.name . '_' . a:val . l:back
endfunction
function! s:atelier_dict.LightlineTheme()
  if &background == 'Light'
    let l:lightlinetheme = split (g:colors_name, "Light")
  else
    let l:lightlinetheme = split (g:colors_name, "Dark")
  endif
  return l:lightlinetheme
endfunction

let s:papercolor_dict = {
                        \ 'name'              : 'PaperColor',
                        \ 'NextVariant'       : function('colorschemefunctions#NextBackgroundVariant'),
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorschemeBackground'),
                        \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \ 'ToggleScheme'      : function('colorschemefunctions#ToggleBackground'),
                        \ }
function! s:papercolor_dict.AirlineTheme()
  return 'papercolor'
endfunction

let s:apprentice_dict = {
                        \ 'name'              : 'apprentice',
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                        \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ }

let s:ayu_dict = {
                 \ 'name'                : 'ayu',
                 \ 'variants'            : ['light', 'dark', 'mirage'],
                 \ 'style_variable_name' : 'g:ayucolor',
                 \ 'NextVariant'         : function('colorschemefunctions#NextStyleVariant'),
                 \ 'StatusColorscheme'   : function('colorschemefunctions#StatusColorschemeStyle'),
                 \ 'LightlineTheme'      : function('colorschemefunctions#LightlineThemeColorscheme'),
                 \ 'AirlineTheme'        : function('colorschemefunctions#AirlineThemeColorscheme'),
                 \ }

let s:cosmic_latte_dict = {
                          \ 'name'              : 'cosmic_latte',
                          \ 'NextVariant'       : function('colorschemefunctions#NextBackgroundVariant'),
                          \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorschemeBackground'),
                          \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorschemeBackground'),
                          \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorschemeBackground'),
                          \ 'ToggleScheme'      : function('colorschemefunctions#ToggleBackground'),
                          \ }

let s:deep_space_dict = {
                        \ 'name'              : 'deep-space',
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorschemeTR'),
                        \ }
function! s:deep_space_dict.LightlineTheme()
  return 'deepspace'
endfunction

let s:desertink_dict = {
                       \ 'name'              : 'desertink',
                       \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                       \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                       \ }

let s:dracula_dict = {
                     \ 'name'              : 'dracula',
                     \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                     \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                     \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                     \ }

let s:edge_dict = {
                  \ 'name'                : 'edge',
                  \ 'variants'            : ['default', 'aura', 'neon'],
                  \ 'style_variable_name' : 'g:edge_style',
                  \ 'NextVariant'         : function('colorschemefunctions#NextStyleVariant'),
                  \ 'StatusColorscheme'   : function('colorschemefunctions#StatusColorschemeStyle'),
                  \ 'LightlineTheme'      : function('colorschemefunctions#LightlineThemeColorscheme'),
                  \ 'AirlineTheme'        : function('colorschemefunctions#AirlineThemeColorscheme'),
                  \ 'ToggleScheme'      : function('colorschemefunctions#ToggleBackground'),
                  \ }

let s:flattened_dict = {
                       \ 'name'                  : 'flattened',
                       \ 'comparison'        : 'fuzzy',
                       \ 'variants'          : ['_light', '_dark'],
                       \ 'NextVariant'       : function('colorschemefunctions#NextColorschemeVariantMap'),
                       \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                       \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                       \ 'ToggleScheme'      : function('colorschemefunctions#ToggleColorscheme'),
                       \ }
function! s:flattened_dict.Map (key,val)
  return self.name . a:val
endfunction

let s:forest_night_dict = {
                          \ 'name'              : 'forest-night',
                          \ 'dark_tag'          : 'dark',
                          \ 'light_tag'         : 'light',
                          \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                          \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                          \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                          \ 'ToggleScheme'      : function('colorschemefunctions#ToggleColorscheme'),
                          \ }

let s:greygull_dict = {
                      \ 'name'              : 'greygull',
                      \ 'variants'          : g:seabird_themes,
                      \ 'NextVariant'       : function('colorschemefunctions#NextColorschemeVariant'),
                      \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                      \ }
function! s:greygull_dict.AirlineTheme()
  return 'seagull'
endfunction

let s:gruvbox_material_dict = {
                              \ 'name'                : 'gruvbox-material',
                              \ 'variants'            : ['soft', 'medium', 'hard'],
                              \ 'style_variable_name' : 'g:gruvbox_material_background',
                              \ 'NextVariant'         : function('colorschemefunctions#NextStyleVariant'),
                              \ 'StatusColorscheme'   : function('colorschemefunctions#StatusColorschemeStyle'),
                              \ 'LightlineTheme'      : function('colorschemefunctions#LightlineThemeColorscheme'),
                              \ 'AirlineTheme'        : function('colorschemefunctions#AirlineThemeColorschemeTR'),
                              \ 'ToggleScheme'      : function('colorschemefunctions#ToggleBackground'),
                              \ }

let s:iceberg_dict = {
                     \ 'name'              : 'iceberg',
                     \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                     \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                     \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                     \ }

let s:jellybeans_dict = {
                        \ 'name'              : 'jellybeans',
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ }

let s:material_dict = {
                      \ 'name'                : 'material',
                      \ 'variants'            : ['default', 'palenight', 'ocean', 'lighter', 'darker'],
                      \ 'style_variable_name' : 'g:material_theme_style',
                      \ 'NextVariant'         : function('colorschemefunctions#NextStyleVariant'),
                      \ 'StatusColorscheme'   : function('colorschemefunctions#StatusColorschemeStyle'),
                      \ }
function! s:material_dict.LightlineTheme()
  return 'material_vim'
endfunction

let s:materialbox_dict = {
                         \ 'name'                : 'materialbox',
                         \ 'variants'            : ['soft', 'medium', 'hard'],
                         \ 'style_variable_name' : (&background == 'dark') ? 'g:materialbox_contrast_dark' : 'g:materialbox_contrast_light',
                         \ 'NextVariant'         : function('colorschemefunctions#NextStyleVariant'),
                         \ 'StatusColorscheme'   : function('colorschemefunctions#StatusColorschemeStyle'),
                         \ 'AirlineTheme'        : function('colorschemefunctions#AirlineThemeColorscheme'),
                         \ 'ToggleScheme'      : function('colorschemefunctions#ToggleBackground'),
                         \ }

let s:nord_dict = {
                  \ 'name'              : 'nord',
                  \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                  \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                  \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                  \ }

let s:one_dict = {
                 \ 'name'              : 'one',
                 \ 'NextVariant'       : function('colorschemefunctions#NextBackgroundVariant'),
                 \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorschemeBackground'),
                 \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                 \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                 \ 'ToggleScheme'      : function('colorschemefunctions#ToggleBackground'),
                 \ }

let s:palenight_dict = {
                       \ 'name'              : 'palenight',
                       \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                       \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                       \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                       \ }

let s:pencil_dict = {
                    \ 'name'              : 'pencil',
                    \ 'NextVariant'       : function('colorschemefunctions#NextBackgroundVariant'),
                    \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorschemeBackground'),
                    \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                    \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                    \ 'ToggleScheme'      : function('colorschemefunctions#ToggleBackground'),
                    \ }

let s:petrel_dict = {
                    \ 'name'              : 'petrel',
                    \ 'variants'          : g:seabird_themes,
                    \ 'NextVariant'       : function('colorschemefunctions#NextColorschemeVariant'),
                    \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                    \ }
function! s:petrel_dict.AirlineTheme()
  return 'seagull'
endfunction

let s:pop_punk_dict = {
                      \ 'name'              : 'pop-punk',
                      \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                      \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorschemeTR'),
                      \ }

let s:seagull_dict = {
                     \ 'name'              : 'seagull',
                     \ 'variants'          : g:seabird_themes,
                     \ 'NextVariant'       : function('colorschemefunctions#NextColorschemeVariant'),
                     \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                     \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                     \ }

let s:sonokai_dict = {
                     \ 'name'                : 'sonokai',
                     \ 'variants'            : ['default', 'atlantis', 'andromeda', 'maia'],
                     \ 'style_variable_name' : 'g:sonokai_style',
                     \ 'NextVariant'         : function('colorschemefunctions#NextStyleVariant'),
                     \ 'StatusColorscheme'   : function('colorschemefunctions#StatusColorschemeStyle'),
                     \ 'LightlineTheme'      : function('colorschemefunctions#LightlineThemeColorscheme'),
                     \ 'AirlineTheme'        : function('colorschemefunctions#AirlineThemeColorscheme'),
                     \ }

let s:snow_dict = {
                  \ 'name'              : 'snow',
                  \ 'NextVariant'       : function('colorschemefunctions#NextBackgroundVariant'),
                  \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorschemeBackground'),
                  \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorschemeBackground'),
                  \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorschemeBackground'),
                  \ 'ToggleScheme'      : function('colorschemefunctions#ToggleBackground'),
                  \ }

let s:space_vim_theme_dict = {
                             \ 'name'              : 'space_vim_theme',
                             \ 'NextVariant'       : function('colorschemefunctions#NextBackgroundVariant'),
                             \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorschemeBackground'),
                             \ 'ToggleScheme'      : function('colorschemefunctions#ToggleBackground'),
                             \ }
function! s:space_vim_theme_dict.LightlineTheme()
  return 'space_vim_' . &background
endfunction

let s:srcery_dict = {
                    \ 'name'              : 'srcery',
                    \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                    \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                    \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                    \ }

let s:stellarized_dict = {
                         \ 'name'              : 'stellarized',
                         \ 'NextVariant'       : function('colorschemefunctions#NextBackgroundVariant'),
                         \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorschemeBackground'),
                         \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorschemeBackground'),
                         \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorschemeBackground'),
                         \ 'ToggleScheme'      : function('colorschemefunctions#ToggleBackground'),
                         \ }

let s:stormpetrel_dict = {
                         \ 'name'              : 'stormpetrel',
                         \ 'variants'          : g:seabird_themes,
                         \ 'NextVariant'       : function('colorschemefunctions#NextColorschemeVariant'),
                         \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                         \ }
function! s:stormpetrel_dict.AirlineTheme()
  return 'seagull'
endfunction

let s:typewriter_dict = {
                        \ 'name'              : 'typewriter',
                        \ 'variants'          : ['', '-night'],
                        \ 'NextVariant'       : function('colorschemefunctions#NextColorschemeVariantMap'),
                        \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                        \ 'AirlineTheme'      : function('colorschemefunctions#AirlineThemeColorscheme'),
                        \ }
function! s:typewriter_dict.Map (key,val)
  return self.name . a:val
endfunction
function! s:typewriter_dict.LightlineTheme()
  return 'typewriter_light'
endfunction

let s:typewriter_night_dict = {
                              \ 'name'              : 'typewriter-night',
                              \ 'variants'          : ['', '-night'],
                              \ 'NextVariant'       : function('colorschemefunctions#NextColorschemeVariantMap'),
                              \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                              \ }
function! s:typewriter_night_dict.Map (key,val)
  return 'typewriter' . a:val
endfunction
function! s:typewriter_night_dict.LightlineTheme()
  return 'typewriter_dark'
endfunction
function! s:typewriter_night_dict.AirlineTheme()
  return 'typewritere'
endfunction

let s:vimspectr_dict = {
                       \ 'name'              : 'vimspectr',
                       \ 'comparison'        : 'fuzzy',
                       \ 'variant_type'      : 'vimspectr',
                       \ 'variants'          : ['grey', '0', '30', '60', '90', '120', '150', '180', '210', '240', '270', '300', '330'],
                       \ 'dark_tag'          : 'dark',
                       \ 'light_tag'         : 'light',
                       \ 'NextVariant'       : function('colorschemefunctions#NextColorschemeVariantMap'),
                       \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorscheme'),
                       \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorschemeTR'),
                       \ 'ToggleScheme'      : function('colorschemefunctions#ToggleColorscheme'),
                       \ }
function! s:vimspectr_dict.Map (key,val)
  return self.name . a:val . '-' . &background
endfunction

let s:vadelma_dict = {
                     \ 'name'              : 'vadelma',
                     \ 'NextVariant'       : function('colorschemefunctions#NextBackgroundVariant'),
                     \ 'StatusColorscheme' : function('colorschemefunctions#StatusColorschemeBackground'),
                     \ 'LightlineTheme'    : function('colorschemefunctions#LightlineThemeColorscheme'),
                     \ 'ToggleScheme'      : function('colorschemefunctions#ToggleBackground'),
                     \ }

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
                      \ s:forest_night_dict,
                      \ s:greygull_dict,
                      \ s:gruvbox_material_dict,
                      \ s:jellybeans_dict,
                      \ s:iceberg_dict,
                      \ s:materialbox_dict,
                      \ s:material_dict,
                      \ s:nord_dict,
                      \ s:one_dict,
                      \ s:palenight_dict,
                      \ s:papercolor_dict,
                      \ s:pencil_dict,
                      \ s:petrel_dict,
                      \ s:pop_punk_dict,
                      \ s:seagull_dict,
                      \ s:snow_dict,
                      \ s:sonokai_dict,
                      \ s:space_vim_theme_dict,
                      \ s:srcery_dict,
                      \ s:stellarized_dict,
                      \ s:stormpetrel_dict,
                      \ s:typewriter_dict,
                      \ s:typewriter_night_dict,
                      \ s:vadelma_dict,
                      \ s:vimspectr_dict,
                      \ ]

let g:colorscheme_groups        = {}
let g:colorscheme_groups.group1 = g:vimspectr_light_themes
let g:colorscheme_groups.group2 = g:vimspectr_dark_themes
let g:colorscheme_groups.group3 = g:atelier_light_themes
let g:colorscheme_groups.group4 = g:atelier_dark_themes
let g:colorscheme_groups.group5 = g:seabird_themes
