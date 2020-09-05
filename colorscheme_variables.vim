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
function! s:atelier_dict.NextVariant(delta)
  let l:variant_list = copy(self.variants)
  call map(l:variant_list, function(self.Map))
  let l:current_variant = g:colors_name
  let l:num_variants = len(l:variant_list)
  let l:next_variant = l:variant_list[((a:delta+index(l:variant_list, l:current_variant)) % l:num_variants + l:num_variants) % l:num_variants]
  call xolox#colorscheme_switcher#switch_to(l:next_variant)
endfunction
function! s:atelier_dict.StatusColorscheme()
  return g:colors_name
endfunction
function! s:atelier_dict.LightlineTheme()
  if &background == 'Light'
    let l:lightlinetheme = split (g:colors_name, "Light")
  else
    let l:lightlinetheme = split (g:colors_name, "Dark")
  endif
  return l:lightlinetheme
endfunction
function! s:atelier_dict.AirlineTheme()
  return g:colors_name
endfunction

let s:papercolor_dict                      = {}
let s:papercolor_dict.name                 = 'PaperColor'
function! s:papercolor_dict.NextVariant(delta)
  let &background = (&background == 'dark') ? 'light' : 'dark'
endfunction
function! s:papercolor_dict.StatusColorscheme()
  return g:colors_name . '/' . &background
endfunction
function! s:papercolor_dict.LightlineTheme()
  return self.name
endfunction
function! s:papercolor_dict.AirlineTheme()
  return self.name
endfunction

let s:apprentice_dict                      = {}
let s:apprentice_dict.name                 = 'apprentice'
function! s:apprentice_dict.StatusColorscheme()
  return g:colors_name
endfunction
function! s:apprentice_dict.LightlineTheme()
  return self.name
endfunction
function! s:apprentice_dict.AirlineTheme()
  return self.name
endfunction

let s:ayu_dict                             = {}
let s:ayu_dict.name                        = 'ayu'
let s:ayu_dict.variants                    = ['light', 'dark', 'mirage']
function! s:ayu_dict.NextVariant(delta)
  let l:num_variants = len(self.variants)
  let g:ayucolor = self.variants[((a:delta+index(self.variants, g:ayucolor)) % l:num_variants + l:num_variants) % l:num_variants]
  call xolox#colorscheme_switcher#switch_to(self.name)
endfunction
function! s:ayu_dict.StatusColorscheme()
  return g:colors_name . '/' . g:ayucolor
endfunction
function! s:ayu_dict.LightlineTheme()
  return self.name
endfunction
function! s:ayu_dict.AirlineTheme()
  return self.name
endfunction

let s:cosmic_latte_dict                    = {}
let s:cosmic_latte_dict.name               = 'cosmic_latte'
function! s:cosmic_latte_dict.NextVariant(delta)
  let &background = (&background == 'dark') ? 'light' : 'dark'
endfunction
function! s:cosmic_latte_dict.StatusColorscheme()
  return g:colors_name . '/' . &background
endfunction
function! s:cosmic_latte_dict.LightlineTheme()
  return self.name
endfunction
function! s:cosmic_latte_dict.AirlineTheme()
  return self.name . '_' . &background
endfunction

let s:deep_space_dict                      = {}
let s:deep_space_dict.name                 = 'deep-space'
function! s:deep_space_dict.StatusColorscheme()
  return g:colors_name
endfunction
function! s:deep_space_dict.LightlineTheme()
  return 'deepspace'
endfunction
function! s:deep_space_dict.AirlineTheme()
  return self.name
endfunction

let s:desertink_dict                       = {}
let s:desertink_dict.name                  = 'desertink'
function! s:desertink_dict.StatusColorscheme()
  return g:colors_name
endfunction
function! s:desertink_dict.AirlineTheme()
  return self.name
endfunction

let s:dracula_dict                         = {}
let s:dracula_dict.name                    = 'dracula'
function! s:dracula_dict.StatusColorscheme()
  return g:colors_name
endfunction
function! s:dracula_dict.LightlineTheme()
  return self.name
endfunction
function! s:dracula_dict.AirlineTheme()
  return self.name
endfunction

let s:edge_dict                            = {}
let s:edge_dict.name                       = 'edge'
let s:edge_dict.variants                   = ['default', 'aura', 'neon']
function! s:edge_dict.NextVariant(delta)
  let l:num_variants = len(self.variants)
  let g:edge_style = self.variants[((a:delta+index(self.variants, g:edge_style)) % l:num_variants + l:num_variants) % l:num_variants]
  call xolox#colorscheme_switcher#switch_to(self.name)
endfunction
function! s:edge_dict.StatusColorscheme()
  return g:colors_name . '/' . g:edge_style
endfunction
function! s:edge_dict.LightlineTheme()
  return self.name
endfunction
function! s:edge_dict.AirlineTheme()
  return self.name
endfunction

let s:flattened_dict                       = {}
let s:flattened_dict.name                  = 'flattened'
let s:flattened_dict.comparison            = 'fuzzy'
let s:flattened_dict.variants              = ['_light', '_dark']
function! s:flattened_dict.Map (key,val)
  return self.name . a:val
endfunction
function! s:flattened_dict.NextVariant(delta)
  let l:variant_list = copy(self.variants)
  call map(l:variant_list, function(self.Map))
  let l:current_variant = g:colors_name
  let l:num_variants = len(l:variant_list)
  let l:next_variant = l:variant_list[((a:delta+index(l:variant_list, l:current_variant)) % l:num_variants + l:num_variants) % l:num_variants]
  call xolox#colorscheme_switcher#switch_to(l:next_variant)
endfunction
function! s:flattened_dict.StatusColorscheme()
  return g:colors_name
endfunction
function! s:flattened_dict.LightlineTheme()
  return g:colors_name
endfunction
function! s:flattened_dict.AirlineTheme()
  return g:colors_name
endfunction

let s:forest_night_dict                    = {}
let s:forest_night_dict.name               = 'forest-night'
function! s:forest_night_dict.StatusColorscheme()
  return g:colors_name
endfunction
function! s:forest_night_dict.LightlineTheme()
  return self.name
endfunction
function! s:forest_night_dict.AirlineTheme()
  return self.name
endfunction

let s:greygull_dict                        = {}
let s:greygull_dict.name                   = 'greygull'
let s:greygull_dict.variants               = g:seadbird_themes
function! s:greygull_dict.NextVariant(delta)
  let l:current_variant = g:colors_name
  let l:num_variants = len(self.variants)
  let l:next_variant = self.variants[((a:delta+index(self.variants, l:current_variant)) % l:num_variants + l:num_variants) % l:num_variants]
  call xolox#colorscheme_switcher#switch_to(l:next_variant)
endfunction
function! s:greygull_dict.StatusColorscheme()
  return g:colors_name
endfunction
function! s:greygull_dict.AirlineTheme()
  return self.name
endfunction

let s:gruvbox_material_dict                = {}
let s:gruvbox_material_dict.name           = 'gruvbox-material'
let s:gruvbox_material_dict.variants       = ['soft', 'medium', 'hard']
function! s:gruvbox_material_dict.NextVariant(delta)
  let l:num_variants = len(self.variants)
  let g:gruvbox_material_background = self.variants[((a:delta+index(self.variants, g:gruvbox_material_background)) % l:num_variants + l:num_variants) % l:num_variants]
  call xolox#colorscheme_switcher#switch_to(self.name)
endfunction
function! s:gruvbox_material_dict.StatusColorscheme()
  return g:colors_name . '/' . g:gruvbox_material_background
endfunction
function! s:gruvbox_material_dict.LightlineTheme()
  return self.name
endfunction
function! s:gruvbox_material_dict.AirlineTheme()
  return self.name
endfunction

let s:iceberg_dict                         = {}
let s:iceberg_dict.name                    = 'iceberg'
function! s:iceberg_dict.StatusColorscheme()
  return g:colors_name
endfunction
function! s:iceberg_dict.LightlineTheme()
  return self.name
endfunction
function! s:iceberg_dict.AirlineTheme()
  return self.name
endfunction

let s:jellybeans_dict                      = {}
let s:jellybeans_dict.name                 = 'jellybeans'
function! s:jellybeans_dict.StatusColorscheme()
  return g:colors_name
endfunction
function! s:jellybeans_dict.AirlineTheme()
  return self.name
endfunction

let s:material_dict                        = {}
let s:material_dict.name                   = 'material'
let s:material_dict.variants               = ['default', 'palenight', 'ocean', 'lighter', 'darker']
function! s:material_dict.NextVariant(delta)
  let l:num_variants = len(self.variants)
  let g:material_theme_style = self.variants[((a:delta+index(self.variants, g:material_theme_style)) % l:num_variants + l:num_variants) % l:num_variants]
  call xolox#colorscheme_switcher#switch_to(self.name)
endfunction
function! s:material_dict.StatusColorscheme()
  return g:colors_name . '/' . g:material_theme_style
endfunction
function! s:material_dict.LightlineTheme()
  return 'material_vim'
endfunction

let s:materialbox_dict                     = {}
let s:materialbox_dict.name                = 'materialbox'
let s:materialbox_dict.variants            = ['soft', 'medium', 'hard']
function! s:materialbox_dict.NextVariant(delta)
  let l:num_variants = len(self.variants)
  if &background == 'dark'
    let g:materialbox_contrast_dark = self.variants[((a:delta+index(self.variants, g:materialbox_contrast_dark)) % l:num_variants + l:num_variants) % l:num_variants]
  else
    let g:materialbox_contrast_light = self.variants[((a:delta+index(self.variants, g:materialbox_contrast_light)) % l:num_variants + l:num_variants) % l:num_variants]
  endif
  call xolox#colorscheme_switcher#switch_to(self.name)
endfunction
function! s:materialbox_dict.StatusColorscheme()
  if &background == 'dark'
    return g:colors_name . '/' . g:materialbox_contrast_dark
  else
    return g:colors_name . '/' . g:materialbox_contrast_light
  endif
endfunction
function! s:materialbox_dict.AirlineTheme()
  return self.name
endfunction

let s:nord_dict                            = {}
let s:nord_dict.name                       = 'nord'
function! s:nord_dict.StatusColorscheme()
  return g:colors_name
endfunction
function! s:nord_dict.LightlineTheme()
  return self.name
endfunction
function! s:nord_dict.AirlineTheme()
  return self.name
endfunction

let s:one_dict                             = {}
let s:one_dict.name                        = 'one'
function! s:one_dict.NextVariant(delta)
  let &background = (&background == 'dark') ? 'light' : 'dark'
endfunction
function! s:one_dict.StatusColorscheme()
  return g:colors_name
endfunction
function! s:one_dict.AirlineTheme()
  return self.name
endfunction

let s:palenight_dict                       = {}
let s:palenight_dict.name                  = 'palenight'
function! s:palenight_dict.StatusColorscheme()
  return g:colors_name
endfunction
function! s:palenight_dict.LightlineTheme()
  return self.name
endfunction
function! s:palenight_dict.AirlineTheme()
  return self.name
endfunction

let s:pencil_dict                          = {}
let s:pencil_dict.name                     = 'pencil'
function! s:pencil_dict.NextVariant(delta)
  let &background = (&background == 'dark') ? 'light' : 'dark'
endfunction
function! s:pencil_dict.StatusColorscheme()
  return g:colors_name . '/' . &background
endfunction
function! s:pencil_dict.LightlineTheme()
  return 'pencil_alter'
endfunction
function! s:pencil_dict.AirlineTheme()
  return self.name
endfunction

let s:petrel_dict                          = {}
let s:petrel_dict.name                     = 'petrel'
let s:petrel_dict.variants                 = g:seadbird_themes
function! s:petrel_dict.NextVariant(delta)
  let l:current_variant = g:colors_name
  let l:num_variants = len(self.variants)
  let l:next_variant = self.variants[((a:delta+index(self.variants, l:current_variant)) % l:num_variants + l:num_variants) % l:num_variants]
  call xolox#colorscheme_switcher#switch_to(l:next_variant)
endfunction
function! s:petrel_dict.StatusColorscheme()
  return g:colors_name
endfunction
function! s:petrel_dict.AirlineTheme()
  return self.name
endfunction

let s:pop_punk_dict                        = {}
let s:pop_punk_dict.name                   = 'pop-punk'
function! s:pop_punk_dict.StatusColorscheme()
  return g:colors_name
endfunction
function! s:pop_punk_dict.AirlineTheme()
  return self.name
endfunction

let s:seagull_dict                         = {}
let s:seagull_dict.name                    = 'seagull'
let s:seagull_dict.variants                = g:seadbird_themes
function! s:seagull_dict.NextVariant(delta)
  let l:current_variant = g:colors_name
  let l:num_variants = len(self.variants)
  let l:next_variant = self.variants[((a:delta+index(self.variants, l:current_variant)) % l:num_variants + l:num_variants) % l:num_variants]
  call xolox#colorscheme_switcher#switch_to(l:next_variant)
endfunction
function! s:seagull_dict.StatusColorscheme()
  return g:colors_name
endfunction
function! s:seagull_dict.AirlineTheme()
  return self.name
endfunction

let s:sonokai_dict                         = {}
let s:sonokai_dict.name                    = 'sonokai'
let s:sonokai_dict.variants                = ['default', 'atlantis', 'andromeda', 'maia']
function! s:sonokai_dict.NextVariant(delta)
  let l:num_variants = len(self.variants)
  let g:sonokai_style = self.variants[((a:delta+index(self.variants, g:sonokai_style)) % l:num_variants + l:num_variants) % l:num_variants]
  call xolox#colorscheme_switcher#switch_to(self.name)
endfunction
function! s:sonokai_dict.StatusColorscheme()
  return g:colors_name . '/' . g:sonokai_style
endfunction
function! s:sonokai_dict.LightlineTheme()
  return self.name
endfunction
function! s:sonokai_dict.AirlineTheme()
  return self.name
endfunction

let s:snow_dict                            = {}
let s:snow_dict.name                       = 'snow'
function! s:snow_dict.NextVariant(delta)
  let &background = (&background == 'dark') ? 'light' : 'dark'
endfunction
function! s:snow_dict.StatusColorscheme()
  return g:colors_name . '/' . &background
endfunction
function! s:snow_dict.LightlineTheme()
  return self.name . '_' . &background
endfunction
function! s:snow_dict.AirlineTheme()
  return self.name . '_' . &background
endfunction

let s:space_vim_theme_dict                 = {}
let s:space_vim_theme_dict.name            = 'space_vim_theme'
function! s:space_vim_theme_dict.NextVariant(delta)
  let &background = (&background == 'dark') ? 'light' : 'dark'
endfunction
function! s:space_vim_theme_dict.StatusColorscheme()
  return g:colors_name . '/' . &background
endfunction
function! s:space_vim_theme_dict.LightlineTheme()
  return 'space_vim_' . &background
endfunction

let s:srcery_dict                          = {}
let s:srcery_dict.name                     = 'srcery'
function! s:srcery_dict.StatusColorscheme()
  return g:colors_name
endfunction
function! s:srcery_dict.LightlineTheme()
  return self.name
endfunction
function! s:srcery_dict.AirlineTheme()
  return self.name
endfunction

let s:stellarized_dict                     = {}
let s:stellarized_dict.name                = 'stellarized'
function! s:stellarized_dict.NextVariant(delta)
  let &background = (&background == 'dark') ? 'light' : 'dark'
endfunction
function! s:stellarized_dict.StatusColorscheme()
  return g:colors_name . '/' . &background
endfunction
function! s:stellarized_dict.LightlineTheme()
  return self.name . '_' . &background
endfunction
function! s:stellarized_dict.AirlineTheme()
  return self.name . '_' . &background
endfunction

let s:stormpetrel_dict                     = {}
let s:stormpetrel_dict.name                = 'stormpetrel'
let s:stormpetrel_dict.variants            = g:seadbird_themes
function! s:stormpetrel_dict.NextVariant(delta)
  let l:current_variant = g:colors_name
  let l:num_variants = len(self.variants)
  let l:next_variant = self.variants[((a:delta+index(self.variants, l:current_variant)) % l:num_variants + l:num_variants) % l:num_variants]
  call xolox#colorscheme_switcher#switch_to(l:next_variant)
endfunction
function! s:stormpetrel_dict.StatusColorscheme()
  return g:colors_name
endfunction
function! s:stormpetrel_dict.AirlineTheme()
  return self.name
endfunction

let s:typewriter_dict                      = {}
let s:typewriter_dict.name                 = 'typewriter'
let s:typewriter_dict.variants             = ['', '-night']
function! s:typewriter_dict.Map (key,val)
  return self.name . a:val
endfunction
function! s:typewriter_dict.NextVariant(delta)
  let l:variant_list = copy(self.variants)
  call map(l:variant_list, function(self.Map))
  let l:current_variant = g:colors_name
  let l:num_variants = len(l:variant_list)
  let l:next_variant = l:variant_list[((a:delta+index(l:variant_list, l:current_variant)) % l:num_variants + l:num_variants) % l:num_variants]
  call xolox#colorscheme_switcher#switch_to(l:next_variant)
endfunction
function! s:typewriter_dict.StatusColorscheme()
  return g:colors_name
endfunction
function! s:typewriter_dict.LightlineTheme()
  return 'typewriter_light'
endfunction
function! s:typewriter_dict.AirlineTheme()
  return self.name
endfunction

let s:typewriter_night_dict                = {}
let s:typewriter_night_dict.name           = 'typewriter-night'
let s:typewriter_night_dict.variants       = ['', '-night']
function! s:typewriter_night_dict.Map (key,val)
  return 'typewriter' . a:val
endfunction
function! s:typewriter_night_dict.NextVariant(delta)
  let l:variant_list = copy(self.variants)
  call map(l:variant_list, function(self.Map))
  let l:current_variant = g:colors_name
  let l:num_variants = len(l:variant_list)
  let l:next_variant = l:variant_list[((a:delta+index(l:variant_list, l:current_variant)) % l:num_variants + l:num_variants) % l:num_variants]
  call xolox#colorscheme_switcher#switch_to(l:next_variant)
endfunction
function! s:typewriter_night_dict.StatusColorscheme()
  return g:colors_name
endfunction
function! s:typewriter_night_dict.LightlineTheme()
  return 'typewriter_dark'
endfunction
function! s:typewriter_night_dict.AirlineTheme()
  return self.name
endfunction

let s:vimspectr_dict                       = {}
let s:vimspectr_dict.name                  = 'vimspectr'
let s:vimspectr_dict.comparison            = 'fuzzy'
let s:vimspectr_dict.variant_type          = 'vimspectr'
let s:vimspectr_dict.variants              = ['grey', '0', '30', '60', '90', '120', '150', '180', '210', '240', '270', '300', '330']
function! s:vimspectr_dict.Map (key,val)
  return self.name . a:val . '-' . &background
endfunction
function! s:vimspectr_dict.NextVariant(delta)
  let l:variant_list = copy(self.variants)
  call map(l:variant_list, function(self.Map))
  let l:current_variant = g:colors_name
  let l:num_variants = len(l:variant_list)
  let l:next_variant = l:variant_list[((a:delta+index(l:variant_list, l:current_variant)) % l:num_variants + l:num_variants) % l:num_variants]
  call xolox#colorscheme_switcher#switch_to(l:next_variant)
endfunction
function! s:vimspectr_dict.StatusColorscheme()
  return g:colors_name
endfunction
function! s:vimspectr_dict.LightlineTheme()
  return g:colors_name
endfunction

let s:vadelma_dict                         = {}
let s:vadelma_dict.name                    = 'vadelma'
function! s:vadelma_dict.NextVariant(delta)
  let &background = (&background == 'dark') ? 'light' : 'dark'
endfunction
function! s:vadelma_dict.StatusColorscheme()
  return g:colors_name . '/' . &background
endfunction
function! s:vadelma_dict.LightlineTheme()
  return self.name
endfunction

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
