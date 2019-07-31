
source ${GAC_CFG_DIR}/git-completion.bash

#------------------------------
# Functions
#------------------------------
function gacp () { git add . ; git commit -m "$@"; git push; }

#------------------------------
# Aliases
#------------------------------
alias gb='git branch'
alias gba='git branch --all'
alias gcd='git checkout develop'
alias gch='git checkout'
alias gcl='git clone'
alias gco='git commit'
alias gd='git diff'
alias gs='git status'
alias gp='git pull --prune'
alias gti=git

