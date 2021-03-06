# Copyright and related rights: <http://creativecommons.org/publicdomain/zero/1.0/>. 
#
# base-files version 4.2-4
# ~/.bashrc: executed by bash(1) for interactive shells.

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/glencoakley/dev/drc/wksp/lrc/form-rec-svc/node_modules/tabtab/.completions/serverless.bash ] && . /Users/glencoakley/dev/drc/wksp/lrc/form-rec-svc/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/glencoakley/dev/drc/wksp/lrc/form-rec-svc/node_modules/tabtab/.completions/sls.bash ] && . /Users/glencoakley/dev/drc/wksp/lrc/form-rec-svc/node_modules/tabtab/.completions/sls.bash

