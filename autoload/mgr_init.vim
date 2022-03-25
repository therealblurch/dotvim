function mgr_init#InitializeMgrGroups()
  call mgr#init_groups()

  call mgr#init_group()
  call mgr#add_cscheme('vimspectr0-light')
  call mgr#add_cscheme('vimspectr30-light')
  call mgr#add_cscheme('vimspectr60-light' ,)
  call mgr#add_cscheme('vimspectr90-light')
  call mgr#add_cscheme('vimspectr120-light')
  call mgr#add_cscheme('vimspectr150-light',)
  call mgr#add_cscheme('vimspectr180-light')
  call mgr#add_cscheme('vimspectr210-light')
  call mgr#add_cscheme('vimspectr240-light',)
  call mgr#add_cscheme('vimspectr270-light')
  call mgr#add_cscheme('vimspectr300-light')
  call mgr#add_cscheme('vimspectr330-light',)
  call mgr#add_cscheme('vimspectrgrey-light')
  call mgr#add_group('vimspectr_light_themes')

  call mgr#init_group()
  call mgr#add_cscheme('vimspectr0-dark')
  call mgr#add_cscheme('vimspectr30-dark')
  call mgr#add_cscheme('vimspectr60-dark' ,)
  call mgr#add_cscheme('vimspectr90-dark')
  call mgr#add_cscheme('vimspectr120-dark')
  call mgr#add_cscheme('vimspectr150-dark',)
  call mgr#add_cscheme('vimspectr180-dark')
  call mgr#add_cscheme('vimspectr210-dark')
  call mgr#add_cscheme('vimspectr240-dark',)
  call mgr#add_cscheme('vimspectr270-dark')
  call mgr#add_cscheme('vimspectr300-dark')
  call mgr#add_cscheme('vimspectr330-dark',)
  call mgr#add_cscheme('vimspectrgrey-dark')
  call mgr#add_group('vimspectr_dark_themes')

  call mgr#init_group()
  call mgr#add_cscheme('greygull')
  call mgr#add_cscheme('petrel')
  call mgr#add_cscheme('seagull')
  call mgr#add_cscheme('stormpetrel')
  call mgr#add_group('seabird_themes')

  call mgr#init_group()
  call mgr#add_cscheme('apprentice')
  call mgr#add_cscheme('ayu')
  call mgr#add_cscheme('bluedrake')
  call mgr#add_cscheme('candid')
  call mgr#add_cscheme('CandyPaper')
  call mgr#add_cscheme('cosmic_latte')
  call mgr#add_cscheme('deep-space')
  call mgr#add_cscheme('desertink')
  call mgr#add_cscheme('dogrun')
  call mgr#add_cscheme('dracula')
  call mgr#add_cscheme('everforest')
  call mgr#add_cscheme('github')
  call mgr#add_cscheme('gruvbox-material')
  call mgr#add_cscheme('iceberg')
  call mgr#add_cscheme('jellybeans')
  call mgr#add_cscheme('material')
  call mgr#add_cscheme('materialbox')
  call mgr#add_cscheme('nightfly')
  call mgr#add_cscheme('night-owl')
  call mgr#add_cscheme('nord')
  call mgr#add_cscheme('one')
  call mgr#add_cscheme('paper')
  call mgr#add_cscheme('pencil')
  call mgr#add_cscheme('shades_of_purple')
  call mgr#add_cscheme('snow')
  call mgr#add_cscheme('sonokai')
  call mgr#add_cscheme('spacegray')
  call mgr#add_cscheme('srcery')
  call mgr#add_cscheme('stellarized')
  call mgr#add_cscheme('tokyo-metro')
  call mgr#add_cscheme('twilight')
  call mgr#add_cscheme('vadelma')
  call mgr#add_cscheme('vividchalk')
  call mgr#add_cscheme('zenburn')
  call mgr#add_group('favorites')
endfunction

function mgr_init#InitializeMgr()
  call mgr#init()
  call mgr#add('apprentice', {
             \ 'lightline': function('mgr#cscheme'),
             \ 'airline'  : function('mgr#cscheme')
             \ })
  call mgr#add('ayu', {
             \ 'variants'       : ['light', 'dark', 'mirage'],
             \ 'style_variable' : 'g:ayucolor',
             \ 'default_style'  : 'light',
             \ 'next_variant'   : function('mgr#nxt_styl_var'),
             \ 'default_variant': function('mgr#def_styl_var'),
             \ 'status'         : function('mgr#cscheme_styl'),
             \ 'lightline'      : function('mgr#cscheme'),
             \ 'airline'        : function('mgr#cscheme'),
             \ 'toggle'         : function('mgr#tggl_cscheme_styl')
             \ })
  call mgr#add('bluedrake', {
             \ 'next_variant': function('mgr#tggl_bg'),
             \ 'status'      : function('mgr#cscheme_bg_sl'),
             \ 'airline'     : function('mgr#cscheme'),
             \ 'toggle'      : function('mgr#tggl_bg'),
             \ 'default_bg'  : 'light'
             \ })
  call mgr#add('candid', {
             \ 'lightline': function('mgr#cscheme'),
             \ })
  call mgr#add('CandyPaper', {
             \ 'next_variant': function('mgr#tggl_bg'),
             \ 'status'      : function('mgr#cscheme_bg_sl'),
             \ 'toggle'      : function('mgr#tggl_bg'),
             \ 'default_bg'  : 'dark'
             \ })
  call mgr#add('cosmic_latte', {
             \ 'next_variant': function('mgr#tggl_bg'),
             \ 'status'      : function('mgr#cscheme_bg_sl'),
             \ 'lightline'   : function('mgr#cscheme_bg_uscr'),
             \ 'airline'     : function('mgr#cscheme_bg_uscr'),
             \ 'toggle'      : function('mgr#tggl_bg'),
             \ 'default_bg'  : 'dark'
             \ })
  call mgr#add('deep-space', {
             \ 'lightline': function('mgr#csheme_rm_dsh'),
             \ 'airline'  : function('mgr#cscheme_dsh_to_uscr')
             \ })
  call mgr#add('desertink', {
             \ 'airline': function('mgr#cscheme')
             \ })
  call mgr#add('dogrun', {
             \ 'lightline': function('mgr#cscheme')
             \ })
  call mgr#add('dracula', {
             \ 'lightline': function('mgr#cscheme'),
             \ 'airline'  : function('mgr#cscheme')
             \ })
  call mgr#add('everforest', {
             \ 'variants'       : ['soft', 'medium', 'hard'],
             \ 'style_variable' : 'g:everforest_background',
             \ 'default_style'  : 'hard',
             \ 'next_variant'   : function('mgr#nxt_styl_var'),
             \ 'default_variant': function('mgr#def_styl_var'),
             \ 'status'         : function('mgr#cscheme_styl'),
             \ 'lightline'      : function('mgr#cscheme'),
             \ 'airline'        : function('mgr#cscheme'),
             \ 'toggle'         : function('mgr#tggl_bg'),
             \ 'default_bg'     : 'dark'
             \ })
  call mgr#add('github', {
             \ 'next_variant': function('mgr#tggl_bg'),
             \ 'status'      : function('mgr#cscheme_bg_sl'),
             \ 'lightline'   : function('mgr#cscheme'),
             \ 'airline'     : function('mgr#cscheme'),
             \ 'toggle'      : function('mgr#tggl_bg'),
             \ 'default_bg'  : 'light'
             \ })
  call mgr#add('greygull', {
             \ 'variants'    : keys(g:colorscheme_groups.seabird_themes),
             \ 'next_variant': function('mgr#nxt_cscheme_var'),
             \ 'airline'     : function('b_lib#SeagullAirlineTheme'),
             \ 'toggle'      : function('b_lib#SeagullToggle')
             \ })
  call mgr#add('gruvbox-material', {
             \ 'variants'       : ['soft', 'medium', 'hard'],
             \ 'style_variable' : 'g:gruvbox_material_background',
             \ 'default_style'  : 'hard',
             \ 'pre'            : ['let g:gruvbox_material_better_performance = 1'],
             \ 'next_variant'   : function('mgr#nxt_styl_var'),
             \ 'default_variant': function('mgr#def_styl_var'),
             \ 'status'         : function('mgr#cscheme_styl'),
             \ 'lightline'      : function('mgr#cscheme'),
             \ 'airline'        : function('mgr#cscheme_dsh_to_uscr'),
             \ 'toggle'         : function('mgr#tggl_bg'),
             \ 'default_bg'     : 'dark'
             \ })
  call mgr#add('iceberg', {
             \ 'next_variant': function('mgr#tggl_bg'),
             \ 'status'      : function('mgr#cscheme_bg_sl'),
             \ 'lightline'   : function('mgr#cscheme'),
             \ 'airline'     : function('mgr#cscheme'),
             \ 'toggle'      : function('mgr#tggl_bg'),
             \ 'default_bg'  : 'light'
             \ })
  call mgr#add('jellybeans', {
             \  'airline': function('mgr#cscheme')
             \ })
  call mgr#add('material', {
             \ 'variants'       : ['default', 'palenight', 'ocean', 'lighter', 'darker'],
             \ 'style_variable' : 'g:material_theme_style',
             \ 'default_style'  : 'palenight',
             \ 'pre'            : ['let g:material_terminal_italics = 1'],
             \ 'next_variant'   : function('mgr#nxt_styl_var'),
             \ 'default_variant': function('mgr#def_styl_var'),
             \ 'status'         : function('mgr#cscheme_styl'),
             \ 'lightline'      : function('b_lib#ColorschemeAppendVim'),
             \ 'airline'        : function('mgr#cscheme')
             \ })
  call mgr#add('materialbox', {
             \ 'variants'       : ['soft', 'medium', 'hard'],
             \ 'style_variable' : 'g:materialbox_contrast',
             \ 'default_style'  : 'hard',
             \ 'next_variant'   : function('mgr#nxt_styl_bg_var'),
             \ 'default_variant': function('mgr#def_styl_bg_var'),
             \ 'status'         : function('mgr#cscheme_bg_styl'),
             \ 'airline'        : function('mgr#cscheme'),
             \ 'toggle'         : function('mgr#tggl_bg'),
             \ 'default_bg'     : 'dark'
             \ })
  call mgr#add('nightfly', {
             \ 'airline'  : function('mgr#cscheme'),
             \ 'lightline': function('mgr#cscheme')
             \ })
  call mgr#add('night-owl', {
             \ 'lightline': function('mgr#csheme_rm_dsh')
             \ })
  call mgr#add('nord', {
             \ 'lightline': function('mgr#cscheme'),
             \ 'airline'  : function('mgr#cscheme')
             \ })
  call mgr#add('one', {
             \ 'next_variant': function('mgr#tggl_bg'),
             \ 'status'      : function('mgr#cscheme_bg_sl'),
             \ 'lightline'   : function('mgr#cscheme'),
             \ 'airline'     : function('mgr#cscheme'),
             \ 'toggle'      : function('mgr#tggl_bg'),
             \ 'default_bg'  : 'dark'
             \ })
  call mgr#add('paper', {
             \ 'next_variant': function('mgr#tggl_bg'),
             \ 'status'      : function('mgr#cscheme_bg_sl'),
             \ 'airline'     : function('mgr#cscheme'),
             \ 'toggle'      : function('mgr#tggl_bg'),
             \ 'default_bg'  : 'light'
             \ })
  call mgr#add('pencil', {
             \ 'next_variant': function('mgr#tggl_bg'),
             \ 'status'      : function('mgr#cscheme_bg_sl'),
             \ 'lightline'   : function('mgr#cscheme'),
             \ 'airline'     : function('mgr#cscheme'),
             \ 'toggle'      : function('mgr#tggl_bg'),
             \ 'default_bg'  : 'light'
             \ })
  call mgr#add('petrel', {
             \ 'variants'    : keys(g:colorscheme_groups.seabird_themes),
             \ 'next_variant': function('mgr#nxt_cscheme_var'),
             \ 'airline'     : function('b_lib#SeagullAirlineTheme'),
             \ 'toggle'      : function('b_lib#SeagullToggle')
             \ })
  call mgr#add('seagull', {
             \ 'variants'    : keys(g:colorscheme_groups.seabird_themes),
             \ 'next_variant': function('mgr#nxt_cscheme_var'),
             \ 'airline'     : function('mgr#cscheme'),
             \ 'toggle'      : function('b_lib#SeagullToggle')
             \ })
  call mgr#add('shades_of_purple', {
             \ 'airline'  : function('mgr#cscheme'),
             \ 'lightline': function('mgr#cscheme')
             \ })
  call mgr#add('sonokai', {
             \ 'variants'       : ['default', 'atlantis', 'andromeda', 'maia'],
             \ 'style_variable' : 'g:sonokai_style',
             \ 'default_style'  : 'default',
             \ 'pre'            : ['let g:sonokai_better_performance = 1'],
             \ 'next_variant'   : function('mgr#nxt_styl_var'),
             \ 'default_variant': function('mgr#def_styl_var'),
             \ 'status'         : function('mgr#cscheme_styl'),
             \ 'lightline'      : function('mgr#cscheme'),
             \ 'airline'        : function('mgr#cscheme')
             \ })
  call mgr#add('snow', {
             \ 'next_variant': function('mgr#tggl_bg'),
             \ 'status'      : function('mgr#cscheme_bg_sl'),
             \ 'lightline'   : function('mgr#cscheme_bg_uscr'),
             \ 'airline'     : function('mgr#cscheme_bg_uscr'),
             \ 'toggle'      : function('mgr#tggl_bg'),
             \ 'default_bg'  : 'light'
             \ })
  call mgr#add('spacegray')
  call mgr#add('srcery', {
             \ 'lightline': function('mgr#cscheme'),
             \ 'airline'  : function('mgr#cscheme')
             \ })
  call mgr#add('stellarized', {
             \ 'next_variant': function('mgr#tggl_bg'),
             \ 'status'      : function('mgr#cscheme_bg_sl'),
             \ 'lightline'   : function('mgr#cscheme_bg_uscr'),
             \ 'airline'     : function('mgr#cscheme_bg_uscr'),
             \ 'toggle'      : function('mgr#tggl_bg'),
             \ 'default_bg'  : 'dark'
             \ })
  call mgr#add('stormpetrel', {
             \ 'variants'    : keys(g:colorscheme_groups.seabird_themes),
             \ 'next_variant': function('mgr#nxt_cscheme_var'),
             \ 'airline'     : function('b_lib#SeagullAirlineTheme'),
             \ 'toggle'      : function('b_lib#SeagullToggle')
             \ })
  call mgr#add('tokyo-metro', {
             \ 'lightline': function('mgr#csheme_rm_dsh'),
             \ 'airline'  : function('mgr#csheme_rm_dsh')
             \ })
  call mgr#add('twilight', {
             \ 'status': function('mgr#cscheme')
             \ })
  call mgr#add('vimspectr', {
             \ 'variants'    : ['grey', '0', '30', '60', '90', '120', '150', '180', '210', '240', '270', '300', '330'],
             \ 'next_variant': function('mgr#nxt_cscheme_var_mp'),
             \ 'lightline'   : function('mgr#cscheme_dsh_to_uscr'),
             \ 'toggle'      : function('mgr#tggl_cscheme'),
             \ 'map'         : function('b_lib#SuffixBackground')
             \ })
  call mgr#add('vadelma', {
             \ 'next_variant': function('mgr#tggl_bg'),
             \ 'status'      : function('mgr#cscheme_bg_sl'),
             \ 'lightline'   : function('mgr#cscheme'),
             \ 'toggle'      : function('mgr#tggl_bg'),
             \ 'default_bg'  : 'light'
             \ })
  call mgr#add('vividchalk')
  call mgr#add('zenburn', {
             \ 'airline': function('mgr#cscheme')
             \ })
endfunction

