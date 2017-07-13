require 'irb/completion'

IRB.conf[:USE_READLINE] = true
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:ECHO] = false
IRB.conf[:SAVE_HISTORY] = 10000
