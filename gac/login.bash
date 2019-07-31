
#    Add something like the following to your .bashrc file to use this environment.
# # Tell this environment configuration where to find its files.
# export GAC_CFG_DIR=~/.config/gac
# # Execute the configuration.
# source $GAC_CFG_DIR/login.bash
#
#    Optionally, include a work-specific file.
# source $GAC_CFG_DIR/work/drc.bash

export GAC_DEV_DIR=$HOME/dev
export GAC_DEV_INST_DIRS=$GAC_DEV_DIR/installed

export PATH=$GAC_DEV_DIR/scripts:$GAC_DEV_DIR/bin:~/scripts:~/bin:${PATH}
export LD_LIBRARY_PATH=${GAC_DEV_DIR}/lib:$HOME/lib:$LD_LIBRARY_PATH

function echo_do() { echo "Executing: $@"; $@; }
os_name_cfg=_$(uname | sed -e 's/-[0-9].*//').bash
machine_name_cfg=_$(hostname).bash

$GAC_CFG_DIR/ssh-agent-start.sh &
declare -a config_files=(
	shell-options.bash variables.sh functions.bash aliases.sh 
	my-prompt.bash direnv.sh
	swdev/git.bash swdev/nodejs.bash swdev/nvm.bash work/drc.bash
	$os_name_cfg $machine_name_cfg )
for cf in ${config_files[@]}; do 
   [ -r $GAC_CFG_DIR/$cf ] && echo_do source $GAC_CFG_DIR/$cf
done
unset os_name_cfg machine_name_cfg

