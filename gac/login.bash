# # Tell this environment where to find its files.
# export GAC_CFG_DIR=~/.config/gac
#
# # Execute this configuration from your shell login script (.bash_profile, etc).
# source $GAC_CFG_DIR/login.bash

[ -z "$GAC_CFG_DIR" ] && echo 'Must set GAC_CFG_DIR before sourcing this script.'

export GAC_DEV_DIR=$HOME/dev

export PATH=$GAC_DEV_DIR/scripts:$GAC_DEV_DIR/bin:~/scripts:~/bin:${PATH}:~/scripts/special-purpose
export LD_LIBRARY_PATH=${GAC_DEV_DIR}/lib:$HOME/lib:$LD_LIBRARY_PATH
export MANPATH=$HOME/dev/man:$MANPATH

GAC_OS_ABBR=$(uname | sed -e 's/-[0-9].*//')
GAC_MACHINE_ABBR=$(scutil --get LocalHostName)
GAC_NOW_INTERACTIVE=no

CWD=`pwd`
cd $GAC_CFG_DIR
source ./source_all.sh
GAC_DEBUG=0
[ "$GAC_DEBUG" -ge "1" ] && echo -n "Login "
source_all shell-options.bash variables.bash swdev/nodejs.bash-i
source_optional os-name/${GAC_OS_ABBR}.bash
source_optional machine/${GAC_MACHINE_ABBR}.bash
[ "$GAC_DEBUG" -ge "1" ] && echo ''

GAC_NOW_INTERACTIVE=yes
test -t 0 && source $GAC_CFG_DIR/interactive.bash
cd "$CWD"

