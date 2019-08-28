# # This assumes this is set previously, per login.bash.
# #   export GAC_CFG_DIR=~/.config/gac
# # Execute this configuration in your shell .*rc file.
# source $GAC_CFG_DIR/interactive.bash

[ -z "$GAC_CFG_DIR" ] && echo 'Must set GAC_CFG_DIR before sourcing this script.'

$GAC_CFG_DIR/ssh-agent-start.sh &

[ "$GAC_DEBUG" -eq 1 ] && echo -n "Interactive "
source_all shell-options.bash functions.bash aliases.bash \
        swdev/git.bash swdev/nodejs.bash swdev/npm-completion.bash
source_optional prompt.bash
source_optional completion.bash
source_optional os-name/${GAC_OS_ABBR}
source_optional machine/${GAC_MACHINE_ABBR}
[ "$GAC_DEBUG" -eq 1 ] && echo ''

# Enable directory-specific configurations using https://github.com/bmc/direnv
eval `direnv hook $0`

