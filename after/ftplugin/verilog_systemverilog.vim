if exists("G:loaded_endwise")
  let b:endwise_addition = '\=submatch(0)=="ifdef" ? "`endif" : submatch(0)=="ifndef" ? "`endif" : submatch(0)=="begin" ? "end" : "end" . submatch(0)' |
  let b:endwise_words = 'begin,case,casez,casex,module,function,generate,task,ifdef,ifndef' |
  let b:endwise_syngroups = 'svCase,svKeyword,svRepeat,svPreCondit'
endif
