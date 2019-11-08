function! lightlinefunctions#LightlineReadonly()
   return &ft !~? 'help\|vimfiler\|gundo' && &readonly && !has('win64') && !has('win32') ? '' : ''
endfunction

function! lightlinefunctions#LightlineFugitive()
   try
      if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
         let mark = ''
         let branch = fugitive#head()
         return branch !=# '' ? mark.branch : ''
      endif
      " if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head') && winwidth(0) > 55
      "    let branch = fugitive#head()
      "    return branch !=# '' ? ''.branch : ''
      " endif
   catch
   endtry
   return ''
endfunction

function! lightlinefunctions#LightlineGitgutter()
   let s:summary = [0, 0, 0]
   if exists('b:gitgutter.summary')
      let s:summary = b:gitgutter.summary
   endif
   return max(s:summary) > 0 ? ' +'.s:summary[0].' ~'.s:summary[1].' -'.s:summary[2].' ' : ''
endfunction

function! lightlinefunctions#LightlineWinform()
   return winwidth(0) > 50 ? 'w' . winwidth(0) . ':' . winheight(0) : ''
endfunction

function! lightlinefunctions#LightlineModified()
   return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! lightlinefunctions#LightlineFilename()
   let fname = expand('%:t')
   return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
      \ fname == '__Tagbar__' ? g:lightline.fname :
      \ fname =~ '__Gundo\|NERD_tree' ? '' :
      \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
      \ &ft == 'unite' ? unite#get_status_string() :
      \ &ft == 'vimshell' ? vimshell#get_status_string() :
      \ ('' != lightlinefunctions#LightlineReadonly() ? lightlinefunctions#LightlineReadonly() . ' ' : '') .
      \ ('' != fname ? fname : '[No Name]') .
      \ ('' != lightlinefunctions#LightlineModified() ? ' ' . lightlinefunctions#LightlineModified() : '')
endfunction

function! lightlinefunctions#LightlineFileformat()
   return winwidth(0) > 80 ? &fileformat : ''
endfunction

function! lightlinefunctions#LightlineColorscheme()
   let s:color = myfunctions#CurrentColorscheme()
   return winwidth(0) > 80 ? s:color : ''
endfunction

function! lightlinefunctions#LightlineFiletype()
   return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! lightlinefunctions#LightlineFileencoding()
   return winwidth(0) > 60 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! lightlinefunctions#LightlineMode()
   let fname = expand('%:t')
   return fname == '__Tagbar__' ? 'Tagbar' :
      \ fname == 'ControlP' ? 'CtrlP' :
      \ fname == '__Gundo__' ? 'Gundo' :
      \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
      \ fname =~ 'NERD_tree' ? 'NERDTree' :
      \ &ft == 'unite' ? 'Unite' :
      \ &ft == 'vimfiler' ? 'VimFiler' :
      \ &ft == 'vimshell' ? 'VimShell' :
      \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! lightlinefunctions#TagbarStatusFunc(current, sort, fname, ...) abort
   let g:lightline.fname = a:fname
   return lightline#statusline(0)
endfunction

function! lightlinefunctions#LightlineFilepath()
   return winwidth(0) <= 120 ? expand('%:h') : ''
endfunction

let g:lightline_colorscheme_map = 
         \                    {
         \ 'apprentice'                      : {'lightlinetheme': 'apprentice'                      },
         \ 'atlantis'                        : {'lightlinetheme': 'atlantis'                        },
         \ 'base16-3024'                     : {'lightlinetheme': 'base16_3024'                     },
         \ 'base16-apathy'                   : {'lightlinetheme': 'base16_apathy'                   },
         \ 'base16-ashes'                    : {'lightlinetheme': 'base16_ashes'                    },
         \ 'base16-atelier-cave-light'       : {'lightlinetheme': 'base16_atelier_cave_light'       },
         \ 'base16-atelier-cave'             : {'lightlinetheme': 'base16_atelier_cave'             },
         \ 'base16-atelier-dune-light'       : {'lightlinetheme': 'base16_atelier_dune_light'       },
         \ 'base16-atelier-dune'             : {'lightlinetheme': 'base16_atelier_dune'             },
         \ 'base16-atelier-estuary-light'    : {'lightlinetheme': 'base16_atelier_estuary_light'    },
         \ 'base16-atelier-estuary'          : {'lightlinetheme': 'base16_atelier_estuary'          },
         \ 'base16-atelier-forest-light'     : {'lightlinetheme': 'base16_atelier_forest_light'     },
         \ 'base16-atelier-forest'           : {'lightlinetheme': 'base16_atelier_forest'           },
         \ 'base16-atelier-heath-light'      : {'lightlinetheme': 'base16_atelier_heath_light'      },
         \ 'base16-atelier-heath'            : {'lightlinetheme': 'base16_atelier_heath'            },
         \ 'base16-atelier-lakeside-light'   : {'lightlinetheme': 'base16_atelier_lakeside_light'   },
         \ 'base16-atelier-lakeside'         : {'lightlinetheme': 'base16_atelier_lakeside'         },
         \ 'base16-atelier-plateau-light'    : {'lightlinetheme': 'base16_atelier_plateau_light'    },
         \ 'base16-atelier-plateau'          : {'lightlinetheme': 'base16_atelier_plateau'          },
         \ 'base16-atelier-savanna-light'    : {'lightlinetheme': 'base16_atelier_savanna_light'    },
         \ 'base16-atelier-savanna'          : {'lightlinetheme': 'base16_atelier_savanna'          },
         \ 'base16-atelier-seaside-light'    : {'lightlinetheme': 'base16_atelier_seaside_light'    },
         \ 'base16-atelier-seaside'          : {'lightlinetheme': 'base16_atelier_seaside'          },
         \ 'base16-atelier-sulphurpool-light': {'lightlinetheme': 'base16_atelier_sulphurpool_light'},
         \ 'base16-atelier-sulphurpool'      : {'lightlinetheme': 'base16_atelier_sulphurpool'      },
         \ 'base16-atlas'                    : {'lightlinetheme': 'base16_atlas'                    },
         \ 'base16-base16-visual-studio-blue': {'lightlinetheme': 'base16_base16_visual_studio_blue'},
         \ 'base16-bespin'                   : {'lightlinetheme': 'base16_bespin'                   },
         \ 'base16-black-metal-bathory'      : {'lightlinetheme': 'base16_black_metal_bathory'      },
         \ 'base16-black-metal-burzum'       : {'lightlinetheme': 'base16_black_metal_burzum'       },
         \ 'base16-black-metal-dark-funeral' : {'lightlinetheme': 'base16_black_metal_dark_funeral' },
         \ 'base16-black-metal-gorgoroth'    : {'lightlinetheme': 'base16_black_metal_gorgoroth'    },
         \ 'base16-black-metal-immortal'     : {'lightlinetheme': 'base16_black_metal_immortal'     },
         \ 'base16-black-metal-khold'        : {'lightlinetheme': 'base16_black_metal_khold'        },
         \ 'base16-black-metal'              : {'lightlinetheme': 'base16_black_metal'              },
         \ 'base16-black-metal-marduk'       : {'lightlinetheme': 'base16_black_metal_marduk'       },
         \ 'base16-black-metal-mayhem'       : {'lightlinetheme': 'base16_black_metal_mayhem'       },
         \ 'base16-black-metal-nile'         : {'lightlinetheme': 'base16_black_metal_nile'         },
         \ 'base16-black-metal-venom'        : {'lightlinetheme': 'base16_black_metal_venom'        },
         \ 'base16-brewer'                   : {'lightlinetheme': 'base16_brewer'                   },
         \ 'base16-bright'                   : {'lightlinetheme': 'base16_bright'                   },
         \ 'base16-brogrammer'               : {'lightlinetheme': 'base16_brogrammer'               },
         \ 'base16-brushtrees-dark'          : {'lightlinetheme': 'base16_brushtrees_dark'          },
         \ 'base16-brushtrees'               : {'lightlinetheme': 'base16_brushtrees'               },
         \ 'base16-chalk'                    : {'lightlinetheme': 'base16_chalk'                    },
         \ 'base16-circus'                   : {'lightlinetheme': 'base16_circus'                   },
         \ 'base16-classic-dark'             : {'lightlinetheme': 'base16_classic_dark'             },
         \ 'base16-classic-light'            : {'lightlinetheme': 'base16_classic_light'            },
         \ 'base16-codeschool'               : {'lightlinetheme': 'base16_codeschool'               },
         \ 'base16-cupcake'                  : {'lightlinetheme': 'base16_cupcake'                  },
         \ 'base16-cupertino'                : {'lightlinetheme': 'base16_cupertino'                },
         \ 'base16-darktooth'                : {'lightlinetheme': 'base16_darktooth'                },
         \ 'base16-decaf'                    : {'lightlinetheme': 'base16_decaf'                    },
         \ 'base16-default-dark'             : {'lightlinetheme': 'base16_default_dark'             },
         \ 'base16-default-light'            : {'lightlinetheme': 'base16_default_light'            },
         \ 'base16-dracula'                  : {'lightlinetheme': 'base16_dracula'                  },
         \ 'base16-eighties'                 : {'lightlinetheme': 'base16_eighties'                 },
         \ 'base16-embers'                   : {'lightlinetheme': 'base16_embers'                   },
         \ 'base16-espresso'                 : {'lightlinetheme': 'base16_espresso'                 },
         \ 'base16-flat'                     : {'lightlinetheme': 'base16_flat'                     },
         \ 'base16-framer'                   : {'lightlinetheme': 'base16_framer'                   },
         \ 'base16-fruit-soda'               : {'lightlinetheme': 'base16_fruit_soda'               },
         \ 'base16-github'                   : {'lightlinetheme': 'base16_github'                   },
         \ 'base16-google-dark'              : {'lightlinetheme': 'base16_google_dark'              },
         \ 'base16-google-light'             : {'lightlinetheme': 'base16_google_light'             },
         \ 'base16-grayscale-dark'           : {'lightlinetheme': 'base16_grayscale_dark'           },
         \ 'base16-grayscale-light'          : {'lightlinetheme': 'base16_grayscale_light'          },
         \ 'base16-greenscreen'              : {'lightlinetheme': 'base16_greenscreen'              },
         \ 'base16-gruvbox-dark-hard'        : {'lightlinetheme': 'base16_gruvbox_dark_hard'        },
         \ 'base16-gruvbox-dark-medium'      : {'lightlinetheme': 'base16_gruvbox_dark_medium'      },
         \ 'base16-gruvbox-dark-pale'        : {'lightlinetheme': 'base16_gruvbox_dark_pale'        },
         \ 'base16-gruvbox-dark-soft'        : {'lightlinetheme': 'base16_gruvbox_dark_soft'        },
         \ 'base16-gruvbox-light-hard'       : {'lightlinetheme': 'base16_gruvbox_light_hard'       },
         \ 'base16-gruvbox-light-medium'     : {'lightlinetheme': 'base16_gruvbox_light_medium'     },
         \ 'base16-gruvbox-light-soft'       : {'lightlinetheme': 'base16_gruvbox_light_soft'       },
         \ 'base16-harmonic-dark'            : {'lightlinetheme': 'base16_harmonic_dark'            },
         \ 'base16-harmonic-light'           : {'lightlinetheme': 'base16_harmonic_light'           },
         \ 'base16-heetch-light'             : {'lightlinetheme': 'base16_heetch_light'             },
         \ 'base16-heetch'                   : {'lightlinetheme': 'base16_heetch'                   },
         \ 'base16-helios'                   : {'lightlinetheme': 'base16_helios'                   },
         \ 'base16-hopscotch'                : {'lightlinetheme': 'base16_hopscotch'                },
         \ 'base16-horizon-dark'             : {'lightlinetheme': 'base16_horizon_dark'             },
         \ 'base16-horizon-light'            : {'lightlinetheme': 'base16_horizon_light'            },
         \ 'base16-horizon-terminal-dark'    : {'lightlinetheme': 'base16_horizon_terminal_dark'    },
         \ 'base16-horizon-terminal-light'   : {'lightlinetheme': 'base16_horizon_terminal_light'   },
         \ 'base16-ia-dark'                  : {'lightlinetheme': 'base16_ia_dark'                  },
         \ 'base16-ia-light'                 : {'lightlinetheme': 'base16_ia_light'                 },
         \ 'base16-icy'                      : {'lightlinetheme': 'base16_icy'                      },
         \ 'base16-irblack'                  : {'lightlinetheme': 'base16_irblack'                  },
         \ 'base16-isotope'                  : {'lightlinetheme': 'base16_isotope'                  },
         \ 'base16-macintosh'                : {'lightlinetheme': 'base16_macintosh'                },
         \ 'base16-marrakesh'                : {'lightlinetheme': 'base16_marrakesh'                },
         \ 'base16-material-darker'          : {'lightlinetheme': 'base16_material_darker'          },
         \ 'base16-materia'                  : {'lightlinetheme': 'base16_materia'                  },
         \ 'base16-material-lighter'         : {'lightlinetheme': 'base16_material_lighter'         },
         \ 'base16-material'                 : {'lightlinetheme': 'base16_material'                 },
         \ 'base16-material-palenight'       : {'lightlinetheme': 'base16_material_palenight'       },
         \ 'base16-material-vivid'           : {'lightlinetheme': 'base16_material_vivid'           },
         \ 'base16-mellow-purple'            : {'lightlinetheme': 'base16_mellow_purple'            },
         \ 'base16-mexico-light'             : {'lightlinetheme': 'base16_mexico_light'             },
         \ 'base16-mocha'                    : {'lightlinetheme': 'base16_mocha'                    },
         \ 'base16-monokai'                  : {'lightlinetheme': 'base16_monokai'                  },
         \ 'base16-nord'                     : {'lightlinetheme': 'base16_nord'                     },
         \ 'base16-nova'                     : {'lightlinetheme': 'base16_nova'                     },
         \ 'base16-oceanicnext'              : {'lightlinetheme': 'base16_oceanicnext'              },
         \ 'base16-ocean'                    : {'lightlinetheme': 'base16_ocean'                    },
         \ 'base16-onedark'                  : {'lightlinetheme': 'base16_onedark'                  },
         \ 'base16-one-light'                : {'lightlinetheme': 'base16_one_light'                },
         \ 'base16-outrun-dark'              : {'lightlinetheme': 'base16_outrun_dark'              },
         \ 'base16-papercolor-dark'          : {'lightlinetheme': 'base16_papercolor_dark'          },
         \ 'base16-papercolor-light'         : {'lightlinetheme': 'base16_papercolor_light'         },
         \ 'base16-paraiso'                  : {'lightlinetheme': 'base16_paraiso'                  },
         \ 'base16-phd'                      : {'lightlinetheme': 'base16_phd'                      },
         \ 'base16-pico'                     : {'lightlinetheme': 'base16_pico'                     },
         \ 'base16-pop'                      : {'lightlinetheme': 'base16_pop'                      },
         \ 'base16-porple'                   : {'lightlinetheme': 'base16_porple'                   },
         \ 'base16-railscasts'               : {'lightlinetheme': 'base16_railscasts'               },
         \ 'base16-rebecca'                  : {'lightlinetheme': 'base16_rebecca'                  },
         \ 'base16-sandcastle'               : {'lightlinetheme': 'base16_sandcastle'               },
         \ 'base16-seti'                     : {'lightlinetheme': 'base16_seti'                     },
         \ 'base16-shapeshifter'             : {'lightlinetheme': 'base16_shapeshifter'             },
         \ 'base16-snazzy'                   : {'lightlinetheme': 'base16_snazzy'                   },
         \ 'base16-solarflare'               : {'lightlinetheme': 'base16_solarflare'               },
         \ 'base16-solarized-dark'           : {'lightlinetheme': 'base16_solarized_dark'           },
         \ 'base16-solarized-light'          : {'lightlinetheme': 'base16_solarized_light'          },
         \ 'base16-spacemacs'                : {'lightlinetheme': 'base16_spacemacs'                },
         \ 'base16-summerfruit-dark'         : {'lightlinetheme': 'base16_summerfruit_dark'         },
         \ 'base16-summerfruit-light'        : {'lightlinetheme': 'base16_summerfruit_light'        },
         \ 'base16-synth-midnight-dark'      : {'lightlinetheme': 'base16_synth_midnight_dark'      },
         \ 'base16-tomorrow'                 : {'lightlinetheme': 'base16_tomorrow'                 },
         \ 'base16-tomorrow-night-eighties'  : {'lightlinetheme': 'base16_tomorrow_night_eighties'  },
         \ 'base16-tomorrow-night'           : {'lightlinetheme': 'base16_tomorrow_night'           },
         \ 'base16-tube'                     : {'lightlinetheme': 'base16_tube'                     },
         \ 'base16-twilight'                 : {'lightlinetheme': 'base16_twilight'                 },
         \ 'base16-unikitty-dark'            : {'lightlinetheme': 'base16_unikitty_dark'            },
         \ 'base16-unikitty-light'           : {'lightlinetheme': 'base16_unikitty_light'           },
         \ 'base16-woodland'                 : {'lightlinetheme': 'base16_woodland'                 },
         \ 'base16-xcode-dusk'               : {'lightlinetheme': 'base16_xcode_dusk'               },
         \ 'base16-zenburn'                  : {'lightlinetheme': 'base16_zenburn'                  },
         \ 'candid'                          : {'lightlinetheme': 'candid'                          },
         \ 'darcula'                         : {'lightlinetheme': 'darcula'                         },
         \ 'dark_purple'                     : {'lightlinetheme': 'dark_purple'                     },
         \ 'desert-night'                    : {'lightlinetheme': 'desert_night'                    },
         \ 'dracula'                         : {'lightlinetheme': 'dracula'                         },
         \ 'flattened_dark'                  : {'lightlinetheme': 'flattened_dark'                  },
         \ 'flattened_light'                 : {'lightlinetheme': 'flattened_light'                 },
         \ 'forest-night'                    : {'lightlinetheme': 'forest_night'                    },
         \ 'iceberg'                         : {'lightlinetheme': 'iceberg'                         },
         \ 'jellybeans'                      : {'lightlinetheme': 'jellybeans'                      },
         \ 'one'                             : {'lightlinetheme': 'one'                             },
         \ 'plastic'                         : {'lightlinetheme': 'plastic'                         },
         \ 'sacredforest'                    : {'lightlinetheme': 'sacredforest'                    },
         \ 'sialoquent'                      : {'lightlinetheme': 'sialoquent'                      },
         \ 'snazzy'                          : {'lightlinetheme': 'snazzy'                          },
         \ 'srcery'                          : {'lightlinetheme': 'srcery'                          },
         \ 'tender'                          : {'lightlinetheme': 'tender'                          },
         \ 'edge'                            : {'lightlinetheme': 'edge'      , 'runtime': 'true'},
         \ 'solarized8'                      : {'lightlinetheme': 'solarized8', 'runtime': 'true'},
         \ 'vadelma'                         : {'lightlinetheme': 'vadelma'   , 'runtime': 'true'},
         \ 'ayu'                             : {'lightlinetheme': 'ayu'       , 'runtime': 'true'},
         \ 'PaperColor'                      : {'lightlinetheme': 'PaperColor', 'runtime': 'true'},
         \ }

function! lightlinefunctions#LightlineUpdate()
   if !exists('g:loaded_lightline')
      return
   endif
   try
      if has_key(g:lightline_colorscheme_map, g:colors_name)
         let g:lightline.colorscheme = g:lightline_colorscheme_map[g:colors_name].lightlinetheme
         if has_key(g:lightline_colorscheme_map[g:colors_name], 'runtime')
            exe 'runtime autoload/lightline/colorscheme/' . g:lightline.colorscheme . '.vim'
         endif
      elseif g:colors_name == "darcula"
         let g:lightline.colorscheme = "darculaOriginal"
      elseif g:colors_name == 'typewriter'
         let g:lightline.colorscheme = "typewriter_light"
      elseif g:colors_name == 'typewriter-night'
         let g:lightline.colorscheme = "typewriter_dark"
      elseif g:colors_name == 'stellarized'
         let g:lightline.colorscheme = join ([g:colors_name,&background],"_")
      elseif g:colors_name == 'snow'
         let g:lightline.colorscheme = join ([g:colors_name,&background],"_")
      elseif g:colors_name == 'material'
         let g:lightline.colorscheme = 'material_vim'
         runtime autoload/lightline/colorscheme/material_vim.vim
      elseif g:colors_name == 'gruvbox-material'
         let g:lightline.colorscheme = 'gruvbox_material'
         runtime autoload/lightline/colorscheme/gruvbox_material.vim
      elseif g:colors_name == 'pencil'
         let g:lightline.colorscheme = 'pencil_alter'
      elseif g:colors_name == 'night-owl'
         let g:lightline.colorscheme = 'nightowl'
      elseif g:colors_name =~ 'Base2Tone_Cave'
         let g:lightline.colorscheme = 'Base2Tone_Cave'
         runtime autoload/lightline/colorscheme/Base2Tone_Cave.vim
      elseif g:colors_name =~ 'Base2Tone_Desert'
         let g:lightline.colorscheme = 'Base2Tone_Desert'
         runtime autoload/lightline/colorscheme/Base2Tone_Desert.vim
      elseif g:colors_name =~ 'Base2Tone_Drawbridge'
         let g:lightline.colorscheme = 'Base2Tone_Drawbridge'
         runtime autoload/lightline/colorscheme/Base2Tone_Drawbridge.vim
      elseif g:colors_name =~ 'Base2Tone_Earth'
         let g:lightline.colorscheme = 'Base2Tone_Earth'
         runtime autoload/lightline/colorscheme/Base2Tone_Earth.vim
      elseif g:colors_name =~ 'Base2Tone_Evening'
         let g:lightline.colorscheme = 'Base2Tone_Evening'
         runtime autoload/lightline/colorscheme/Base2Tone_Evening.vim
      elseif g:colors_name =~ 'Base2Tone_Forest'
         let g:lightline.colorscheme = 'Base2Tone_Forest'
         runtime autoload/lightline/colorscheme/Base2Tone_Forest.vim
      elseif g:colors_name =~ 'Base2Tone_Heath'
         let g:lightline.colorscheme = 'Base2Tone_Heath'
         runtime autoload/lightline/colorscheme/Base2Tone_Heath.vim
      elseif g:colors_name =~ 'Base2Tone_Lake'
         let g:lightline.colorscheme = 'Base2Tone_Lake'
         runtime autoload/lightline/colorscheme/Base2Tone_Lake.vim
      elseif g:colors_name =~ 'Base2Tone_Meadow'
         let g:lightline.colorscheme = 'Base2Tone_Meadow'
         runtime autoload/lightline/colorscheme/Base2Tone_Meadow.vim
      elseif g:colors_name =~ 'Base2Tone_Morning'
         let g:lightline.colorscheme = 'Base2Tone_Morning'
         runtime autoload/lightline/colorscheme/Base2Tone_Morning.vim
      elseif g:colors_name =~ 'Base2Tone_Pool'
         let g:lightline.colorscheme = 'Base2Tone_Pool'
         runtime autoload/lightline/colorscheme/Base2Tone_Pool.vim
      elseif g:colors_name =~ 'Base2Tone_Sea'
         let g:lightline.colorscheme = 'Base2Tone_Sea'
         runtime autoload/lightline/colorscheme/Base2Tone_Sea.vim
      elseif g:colors_name =~ 'Base2Tone_Space'
         let g:lightline.colorscheme = 'Base2Tone_Space'
         runtime autoload/lightline/colorscheme/Base2Tone_Space.vim
      elseif g:colors_name == 'cosmic_latte'
         let g:lightline.colorscheme = join ([g:colors_name,&background],"_")
      elseif g:colors_name =~# 'deep-space'
         let g:lightline.colorscheme = 'deepspace'
      elseif g:colors_name =~ 'onehalf'
         let g:lightline.colorscheme = 'onehalfdark'
      elseif g:colors_name =~# 'space_vim_theme'
         if &bg =~# 'dark'
            let g:lightline.colorscheme = 'space_vim_dark'
         endif
         if &bg =~# 'light'
            let g:lightline.colorscheme = 'space_vim_light'
         endif
      else
         let g:lightline.colorscheme = 'powerline'
      endif
      call lightline#init()
      call lightline#colorscheme()
      call lightline#update()
   endtry
endfunction

function! lightlinefunctions#SetLightlineColorscheme(name) abort
   let g:lightline.colorscheme = a:name
   call lightline#init()
   call lightline#colorscheme()
   call lightline#update()
endfunction

function! lightlinefunctions#LightlineColorschemes(...) abort
   return join(map(
         \ globpath(&rtp,"autoload/lightline/colorscheme/*.vim",1,1),
         \ "fnamemodify(v:val,':t:r')"),
         \ "\n")
endfunction

function! lightlinefunctions#PomodoroStatus() abort
   if pomo#remaining_time() ==# '0'
      return "\ue001"
   else
      return "\ue003 ".pomo#remaining_time()"
   endif
endfunction
