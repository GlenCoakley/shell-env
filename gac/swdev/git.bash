
source ${GAC_CFG_DIR}/git-completion.bash

#------------------------------
# Functions
#------------------------------
function gcp () { cd $GAC_CFG_DIR; ./scripts/copy-dot-files-here.sh; git add . ; git commit -m "$@"; git push; }
function gacp () { git add . ; git commit -m "$@"; git push; }

#------------------------------
# Aliases
#------------------------------
alias gb='git branch'
alias gba='git branch --all'
alias gcd='git checkout develop'
alias gch='git checkout'
alias gcl='git clone'
alias gcm='git commit'
alias gd='git diff'
alias gf='git fetch --all'
alias gs='git status'
alias gp='git pull --prune'
alias gti=git

