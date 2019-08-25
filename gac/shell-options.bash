# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
export HISTIGNORE=$'&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls'

# Shell Options - See man bash for more options...
#
# Don't use ^D to exit
# set -o ignoreeof

# =====Completion
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell
#
# Complete .exe executables with their short name.
# shopt -s completion_strip_exe
 
# ===== History
# Make bash append rather than overwrite the history on disk
# shopt -s histappend
#
# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}erasedups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
export HISTIGNORE=$'&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls'
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

