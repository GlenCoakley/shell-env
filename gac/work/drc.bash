
export PATH=~/scripts/drc:$PATH
export WKSP=~/dev/drc/wksp

function ws() { cdToIfExists $WKSP/$1 && goto_pkg_json; }

alias wiat="wksp iat/iatapp"
alias wiats="wksp iat-spare/iatapp"

alias wrtm="ws rtm"
alias wrtml="ws rtm/s*v*c*/lib/eca-rtm-model"
alias wrtms="ws rtm/s*v*c*"
alias wrtmu="ws rtm/ui"

alias wra="ws rtm/rtm-app"
alias wrl="ws rtm/rtm-app/s*v*c*/lib/eca-rtm-model"
alias wrs="ws rtm/rtm-app/s*v*c*"
alias wru="ws rtm-app/ui"

alias wlrc="ws lrc"
alias wla="ws lrc/web-api"
alias wlu="ws lrc/web-ui"
alias wlf="ws lrc/form-rec-svc"
alias wlfr="ws lrc/form-rec-svc"
alias wlfu="ws lrc/form-rec-util"
alias wludb="ws lrc/udb-svc"

alias wlrc2="ws lrc2"
alias wla2="ws lrc2/web-api"
alias wlu2="ws lrc2/web-ui"
alias wlf2="ws lrc2/form-rec-svc"

