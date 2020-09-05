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

let g:seadbird_themes        = [
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

let s:atelier_dict                         = {}
let s:atelier_dict.name                    = 'Atelier'
let s:atelier_dict.comparison              = 'fuzzy'
let s:atelier_dict.variants                = ['Cave', 'Dune', 'Estuary', 'Forest', 'Heath', 'Lakeside', 'Plateau', 'Savanna', 'Seaside', 'Sulphurpool']
function! s:atelier_dict.Map (key,val)
  if &background == 'light'
    let l:back = 'Light'
  else
    let l:back = 'Dark'
  endif
  return self.name . '_' . a:val . l:back
endfunction
let s:atelier_dict.NextVariant             = function('colorschemefunctions#NextColorschemeVariantMap')
let s:atelier_dict.StatusColorscheme       = function('colorschemefunctions#StatusColorscheme')
function! s:atelier_dict.LightlineTheme()
  if &background == 'Light'
    let l:lightlinetheme = split (g:colors_name, "Light")
  else
    let l:lightlinetheme = split (g:colors_name, "Dark")
  endif
  return l:lightlinetheme
endfunction
let s:atelier_dict.AirlineTheme            = function('colorschemefunctions#AirlineThemeColorscheme')

let s:papercolor_dict                      = {}
let s:papercolor_dict.name                 = 'PaperColor'
let s:papercolor_dict.NextVariant          = function('colorschemefunctions#NextBackgroundVariant')
let s:papercolor_dict.StatusColorscheme    = function('colorschemefunctions#StatusColorschemeBackground')
let s:papercolor_dict.LightlineTheme       = function('colorschemefunctions#LightlineThemeColorscheme')
function! s:papercolor_dict.AirlineTheme()
  return 'papercolor'
endfunction

let s:apprentice_dict                      = {}
let s:apprentice_dict.name                 = 'apprentice'
let s:apprentice_dict.StatusColorscheme    = function('colorschemefunctions#StatusColorscheme')
let s:apprentice_dict.LightlineTheme       = function('colorschemefunctions#LightlineThemeColorscheme')
let s:apprentice_dict.AirlineTheme         = function('colorschemefunctions#AirlineThemeColorscheme')

let s:ayu_dict                             = {}
let s:ayu_dict.name                        = 'ayu'
let s:ayu_dict.variants                    = ['light', 'dark', 'mirage']
let s:ayu_dict.style_variable_name         = 'g:ayucolor'
let s:ayu_dict.NextVariant                 = function('colorschemefunctions#NextStyleVariant')
let s:ayu_dict.StatusColorscheme           = function('colorschemefunctions#StatusColorschemeStyle')
let s:ayu_dict.LightlineTheme              = function('colorschemefunctions#LightlineThemeColorscheme')
let s:ayu_dict.AirlineTheme                = function('colorschemefunctions#AirlineThemeColorscheme')

let s:cosmic_latte_dict                    = {}
let s:cosmic_latte_dict.name               = 'cosmic_latte'
let s:cosmic_latte_dict.NextVariant        = function('colorschemefunctions#NextBackgroundVariant')
let s:cosmic_latte_dict.StatusColorscheme  = function('colorschemefunctions#StatusColorschemeBackground')
let s:cosmic_latte_dict.LightlineTheme     = function('colorschemefunctions#LightlineThemeColorschemeBackground')
let s:cosmic_latte_dict.AirlineTheme       = function('colorschemefunctions#AirlineThemeColorschemeBackground')

let s:deep_space_dict                      = {}
let s:deep_space_dict.name                 = 'deep-space'
let s:deep_space_dict.StatusColorscheme    = function('colorschemefunctions#StatusColorscheme')
function! s:deep_space_dict.LightlineTheme()
  return 'deepspace'
endfunction
let s:deep_space_dict.AirlineTheme         = function('colorschemefunctions#AirlineThemeColorschemeTR')

let s:desertink_dict                       = {}
let s:desertink_dict.name                  = 'desertink'
let s:desertink_dict.StatusColorscheme     = function('colorschemefunctions#StatusColorscheme')
let s:desertink_dict.AirlineTheme          = function('colorschemefunctions#AirlineThemeColorscheme')

let s:dracula_dict                         = {}
let s:dracula_dict.name                    = 'dracula'
let s:dracula_dict.StatusColorscheme       = function('colorschemefunctions#StatusColorscheme')
let s:dracula_dict.LightlineTheme          = function('colorschemefunctions#LightlineThemeColorscheme')
let s:dracula_dict.AirlineTheme            = function('colorschemefunctions#AirlineThemeColorscheme')

let s:edge_dict                            = {}
let s:edge_dict.name                       = 'edge'
let s:edge_dict.variants                   = ['default', 'aura', 'neon']
let s:edge_dict.style_variable_name        = 'g:edge_style'
let s:edge_dict.NextVariant                = function('colorschemefunctions#NextStyleVariant')
let s:edge_dict.StatusColorscheme          = function('colorschemefunctions#StatusColorschemeStyle')
let s:edge_dict.LightlineTheme             = function('colorschemefunctions#LightlineThemeColorscheme')
let s:edge_dict.AirlineTheme               = function('colorschemefunctions#AirlineThemeColorscheme')

let s:flattened_dict                       = {}
let s:flattened_dict.name                  = 'flattened'
let s:flattened_dict.comparison            = 'fuzzy'
let s:flattened_dict.variants              = ['_light', '_dark']
function! s:flattened_dict.Map (key,val)
  return self.name . a:val
endfunction
let s:flattened_dict.NextVariant           = function('colorschemefunctions#NextColorschemeVariantMap')
let s:flattened_dict.StatusColorscheme     = function('colorschemefunctions#StatusColorscheme')
let s:flattened_dict.LightlineTheme        = function('colorschemefunctions#LightlineThemeColorscheme')

let s:forest_night_dict                    = {}
let s:forest_night_dict.name               = 'forest-night'
let s:forest_night_dict.StatusColorscheme  = function('colorschemefunctions#StatusColorscheme')
let s:forest_night_dict.LightlineTheme     = function('colorschemefunctions#LightlineThemeColorscheme')
let s:forest_night_dict.AirlineTheme       = function('colorschemefunctions#AirlineThemeColorscheme')

let s:greygull_dict                        = {}
let s:greygull_dict.name                   = 'greygull'
let s:greygull_dict.variants               = g:seadbird_themes
let s:greygull_dict.NextVariant            = function('colorschemefunctions#NextColorschemeVariant')
let s:greygull_dict.StatusColorscheme      = function('colorschemefunctions#StatusColorscheme')
function! s:greygull_dict.AirlineTheme()
  return 'seagull'
endfunction

let s:gruvbox_material_dict                     = {}
let s:gruvbox_material_dict.name                = 'gruvbox-material'
let s:gruvbox_material_dict.variants            = ['soft', 'medium', 'hard']
let s:gruvbox_material_dict.style_variable_name = 'g:gruvbox_material_background'
let s:gruvbox_material_dict.NextVariant         = function('colorschemefunctions#NextStyleVariant')
let s:gruvbox_material_dict.StatusColorscheme   = function('colorschemefunctions#StatusColorschemeStyle')
let s:gruvbox_material_dict.LightlineTheme      = function('colorschemefunctions#LightlineThemeColorscheme')
let s:gruvbox_material_dict.AirlineTheme        = function('colorschemefunctions#AirlineThemeColorschemeTR')

let s:iceberg_dict                         = {}
let s:iceberg_dict.name                    = 'iceberg'
let s:iceberg_dict.StatusColorscheme       = function('colorschemefunctions#StatusColorscheme')
let s:iceberg_dict.LightlineTheme          = function('colorschemefunctions#LightlineThemeColorscheme')
let s:iceberg_dict.AirlineTheme            = function('colorschemefunctions#AirlineThemeColorscheme')

let s:jellybeans_dict                      = {}
let s:jellybeans_dict.name                 = 'jellybeans'
let s:jellybeans_dict.StatusColorscheme    = function('colorschemefunctions#StatusColorscheme')
let s:jellybeans_dict.AirlineTheme         = function('colorschemefunctions#AirlineThemeColorscheme')

let s:material_dict                        = {}
let s:material_dict.name                   = 'material'
let s:material_dict.variants               = ['default', 'palenight', 'ocean', 'lighter', 'darker']
let s:material_dict.style_variable_name    = 'g:material_theme_style'
let s:material_dict.NextVariant            = function('colorschemefunctions#NextStyleVariant')
let s:material_dict.StatusColorscheme      = function('colorschemefunctions#StatusColorschemeStyle')
function! s:material_dict.LightlineTheme()
  return 'material_vim'
endfunction

let s:materialbox_dict                     = {}
let s:materialbox_dict.name                = 'materialbox'
let s:materialbox_dict.variants            = ['soft', 'medium', 'hard']
let s:materialbox_dict.style_variable_name = (&background == 'dark') ? 'g:materialbox_contrast_dark' : 'g:materialbox_contrast_light'
let s:materialbox_dict.NextVariant         = function('colorschemefunctions#NextStyleVariant')
let s:materialbox_dict.StatusColorscheme   = function('colorschemefunctions#StatusColorschemeStyle')
let s:materialbox_dict.AirlineTheme        = function('colorschemefunctions#AirlineThemeColorscheme')

let s:nord_dict                            = {}
let s:nord_dict.name                       = 'nord'
let s:nord_dict.StatusColorscheme          = function('colorschemefunctions#StatusColorscheme')
let s:nord_dict.LightlineTheme             = function('colorschemefunctions#LightlineThemeColorscheme')
let s:nord_dict.AirlineTheme               = function('colorschemefunctions#AirlineThemeColorscheme')

let s:one_dict                             = {}
let s:one_dict.name                        = 'one'
let s:one_dict.NextVariant                 = function('colorschemefunctions#NextBackgroundVariant')
let s:one_dict.StatusColorscheme           = function('colorschemefunctions#StatusColorschemeBackground')
let s:one_dict.LightlineTheme              = function('colorschemefunctions#LightlineThemeColorscheme')
let s:one_dict.AirlineTheme                = function('colorschemefunctions#AirlineThemeColorscheme')

let s:palenight_dict                       = {}
let s:palenight_dict.name                  = 'palenight'
let s:palenight_dict.StatusColorscheme     = function('colorschemefunctions#StatusColorscheme')
let s:palenight_dict.LightlineTheme        = function('colorschemefunctions#LightlineThemeColorscheme')
let s:palenight_dict.AirlineTheme          = function('colorschemefunctions#AirlineThemeColorscheme')

let s:pencil_dict                          = {}
let s:pencil_dict.name                     = 'pencil'
let s:pencil_dict.NextVariant              = function('colorschemefunctions#NextBackgroundVariant')
let s:pencil_dict.StatusColorscheme        = function('colorschemefunctions#StatusColorschemeBackground')
let s:pencil_dict.LightlineTheme           = function('colorschemefunctions#LightlineThemeColorscheme')
let s:pencil_dict.AirlineTheme             = function('colorschemefunctions#AirlineThemeColorscheme')

let s:petrel_dict                          = {}
let s:petrel_dict.name                     = 'petrel'
let s:petrel_dict.variants                 = g:seadbird_themes
let s:petrel_dict.NextVariant              = function('colorschemefunctions#NextColorschemeVariant')
let s:petrel_dict.StatusColorscheme        = function('colorschemefunctions#StatusColorscheme')
function! s:petrel_dict.AirlineTheme()
  return 'seagull'
endfunction

let s:pop_punk_dict                        = {}
let s:pop_punk_dict.name                   = 'pop-punk'
let s:pop_punk_dict.StatusColorscheme       = function('colorschemefunctions#StatusColorscheme')
let s:pop_punk_dict.AirlineTheme            = function('colorschemefunctions#AirlineThemeColorschemeTR')

let s:seagull_dict                         = {}
let s:seagull_dict.name                    = 'seagull'
let s:seagull_dict.variants                = g:seadbird_themes
let s:seagull_dict.NextVariant             = function('colorschemefunctions#NextColorschemeVariant')
let s:seagull_dict.StatusColorscheme       = function('colorschemefunctions#StatusColorscheme')
let s:seagull_dict.AirlineTheme            = function('colorschemefunctions#AirlineThemeColorscheme')

let s:sonokai_dict                         = {}
let s:sonokai_dict.name                    = 'sonokai'
let s:sonokai_dict.variants                = ['default', 'atlantis', 'andromeda', 'maia']
let s:sonokai_dict.style_variable_name     = 'g:sonokai_style'
let s:sonokai_dict.NextVariant             = function('colorschemefunctions#NextStyleVariant')
let s:sonokai_dict.StatusColorscheme       = function('colorschemefunctions#StatusColorschemeStyle')
let s:sonokai_dict.LightlineTheme          = function('colorschemefunctions#LightlineThemeColorscheme')
let s:sonokai_dict.AirlineTheme            = function('colorschemefunctions#AirlineThemeColorscheme')

let s:snow_dict                            = {}
let s:snow_dict.name                       = 'snow'
let s:snow_dict.NextVariant                = function('colorschemefunctions#NextBackgroundVariant')
let s:snow_dict.StatusColorscheme          = function('colorschemefunctions#StatusColorschemeBackground')
let s:snow_dict.LightlineTheme             = function('colorschemefunctions#LightlineThemeColorschemeBackground')
let s:snow_dict.AirlineTheme               = function('colorschemefunctions#AirlineThemeColorschemeBackground')

let s:space_vim_theme_dict                   = {}
let s:space_vim_theme_dict.name              = 'space_vim_theme'
let s:space_vim_theme_dict.NextVariant       = function('colorschemefunctions#NextBackgroundVariant')
let s:space_vim_theme_dict.StatusColorscheme = function('colorschemefunctions#StatusColorschemeBackground')
function! s:space_vim_theme_dict.LightlineTheme()
  return 'space_vim_' . &background
endfunction

let s:srcery_dict                          = {}
let s:srcery_dict.name                     = 'srcery'
let s:srcery_dict.StatusColorscheme        = function('colorschemefunctions#StatusColorscheme')
let s:srcery_dict.LightlineTheme           = function('colorschemefunctions#LightlineThemeColorscheme')
let s:srcery_dict.AirlineTheme             = function('colorschemefunctions#AirlineThemeColorscheme')

let s:stellarized_dict                     = {}
let s:stellarized_dict.name                = 'stellarized'
let s:stellarized_dict.NextVariant         = function('colorschemefunctions#NextBackgroundVariant')
let s:stellarized_dict.StatusColorscheme   = function('colorschemefunctions#StatusColorschemeBackground')
let s:stellarized_dict.LightlineTheme      = function('colorschemefunctions#LightlineThemeColorschemeBackground')
let s:stellarized_dict.AirlineTheme        = function('colorschemefunctions#AirlineThemeColorschemeBackground')

let s:stormpetrel_dict                     = {}
let s:stormpetrel_dict.name                = 'stormpetrel'
let s:stormpetrel_dict.variants            = g:seadbird_themes
let s:stormpetrel_dict.NextVariant         = function('colorschemefunctions#NextColorschemeVariant')
let s:stormpetrel_dict.StatusColorscheme   = function('colorschemefunctions#StatusColorscheme')
function! s:stormpetrel_dict.AirlineTheme()
  return 'seagull'
endfunction

let s:typewriter_dict                      = {}
let s:typewriter_dict.name                 = 'typewriter'
let s:typewriter_dict.variants             = ['', '-night']
function! s:typewriter_dict.Map (key,val)
  return self.name . a:val
endfunction
let s:typewriter_dict.NextVariant          = function('colorschemefunctions#NextColorschemeVariantMap')
let s:typewriter_dict.StatusColorscheme    = function('colorschemefunctions#StatusColorscheme')
function! s:typewriter_dict.LightlineTheme()
  return 'typewriter_light'
endfunction
let s:typewriter_dict.AirlineTheme         = function('colorschemefunctions#AirlineThemeColorscheme')

let s:typewriter_night_dict                = {}
let s:typewriter_night_dict.name           = 'typewriter-night'
let s:typewriter_night_dict.variants       = ['', '-night']
function! s:typewriter_night_dict.Map (key,val)
  return 'typewriter' . a:val
endfunction
let s:typewriter_night_dict.NextVariant    = function('colorschemefunctions#NextColorschemeVariantMap')
let s:typewriter_night_dict.StatusColorscheme = function('colorschemefunctions#StatusColorscheme')
function! s:typewriter_night_dict.LightlineTheme()
  return 'typewriter_dark'
endfunction
function! s:typewriter_night_dict.AirlineTheme()
  return 'typewritere'
endfunction

let s:vimspectr_dict                       = {}
let s:vimspectr_dict.name                  = 'vimspectr'
let s:vimspectr_dict.comparison            = 'fuzzy'
let s:vimspectr_dict.variant_type          = 'vimspectr'
let s:vimspectr_dict.variants              = ['grey', '0', '30', '60', '90', '120', '150', '180', '210', '240', '270', '300', '330']
function! s:vimspectr_dict.Map (key,val)
  return self.name . a:val . '-' . &background
endfunction
let s:vimspectr_dict.NextVariant           = function('colorschemefunctions#NextColorschemeVariantMap')
let s:vimspectr_dict.StatusColorscheme     = function('colorschemefunctions#StatusColorscheme')
let s:vimspectr_dict.LightlineTheme        = function('colorschemefunctions#LightlineThemeColorschemeTR')

let s:vadelma_dict                         = {}
let s:vadelma_dict.name                    = 'vadelma'
let s:vadelma_dict.NextVariant             = function('colorschemefunctions#NextBackgroundVariant')
let s:vadelma_dict.StatusColorscheme       = function('colorschemefunctions#StatusColorschemeBackground')
let s:vadelma_dict.LightlineTheme          = function('colorschemefunctions#LightlineThemeColorscheme')

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
let g:colorscheme_groups.group5 = g:seadbird_themes
