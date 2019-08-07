
source $GAC_CFG_DIR/swdev/aws.mac.bash

#-----------------------------
# Functions
#-----------------------------
function bci() { brew cask install $@ && brew cask list $GAC_CFG_DIR/work/brew.casks.txt; }
function bi() { brew install $@ && brew list $GAC_CFG_DIR/work/brew.taps.txt; }

#-----------------------------
# Aliases
#-----------------------------
alias bs='brew search'

#-----------------------------
# Other configuration files
#-----------------------------
# This script needs to be executed, not sourced like most.
$GAC_CFG_DIR/mac/iterm2_shell_integration.bash

