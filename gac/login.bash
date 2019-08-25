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

GAC_OS_ABBR=$(uname | sed -e 's/-[0-9].*//').bash
GAC_MACHINE_ABBR=$(hostname).bash
GAC_NOW_INTERACTIVE=no

cd $GAC_CFG_DIR
source ./source_all
echo -n "Login "
source_all shell-options.bash variables.bash swdev/nodejs.bash
source_optional os-name/${GAC_OS_ABBR}
source_optional machine/${GAC_MACHINE_ABBR}
source_optional prompt.bash
source_optional completion.bash
echo ''

GAC_NOW_INTERACTIVE=yes
[ -t 0 ] && source $GAC_CFG_DIR/interactive.bash
cd ~

