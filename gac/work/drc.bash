
export PATH=~/scripts/drc:$PATH
export wksp=~/dev/drc/wksp

function ws() { cdToIfExists $wksp/$1 && goto_pkg_json; }

# IAT - Interim Assessment Testing

alias wiat="wksp iat/iatapp"
alias wiats="wksp iat-spare/iatapp"

# RTM - Reader Team Management

alias wrtm="ws rtm"
alias wrtml="ws rtm/s*v*c*/lib/eca-rtm-model"
alias wrtms="ws rtm/s*v*c*"
alias wrtmu="ws rtm/ui"

alias wra="ws rtm/rtm-app"
alias wrl="ws rtm/rtm-app/s*v*c*/lib/eca-rtm-model"
alias wrs="ws rtm/rtm-app/s*v*c*"
alias wru="ws rtm-app/ui"

# LRC - Local Resource Capture

alias wlrc="ws lrc"
alias wlsa="ws lrc/web-api"
alias wlsu="ws lrc/web-ui"
alias wlf="ws lrc/form-rec-svc"
alias wlsf="ws lrc/form-rec-svc"
alias wlsfu="ws lrc/form-rec-util"
alias wludb="ws lrc/udb-svc"
alias wlcs="ws lrc/common-service"
alias wlcu="ws lrc/common-ui"
alias wosa="ws lrc/online-scoring-api"
alias wosu="ws lrc/online-scoring-ui"
alias wlssu="ws lrc/setup-ui"

alias wlrc2="ws lrc2"
alias wla2="ws lrc2/web-api"
alias wluu2="ws lrc2/web-ui"
alias wlsf2="ws lrc2/form-rec-svc"

