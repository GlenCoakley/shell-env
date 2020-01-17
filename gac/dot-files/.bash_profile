
export GAC_CFG_DIR=~/.config/gac
source $GAC_CFG_DIR/login.bash
source $GAC_CFG_DIR/work/drc.bash


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/glencoakley/dev/bin/sdkman"
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"

