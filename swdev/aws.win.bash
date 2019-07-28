function ass() {
  envAbbr=$1
  unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SECURITY_TOKEN AWS_SESSION_TOKEN
  file=$TMP/ar.out
  trap "rm -f $file" 0 1 2 3
  assume-role -duration 43200s drc$envAbbr | sed -e 's/^\$env:/export /g'  > $file
  source $file
  env | grep ^AWS # To allow visual confirmation that it worked.
}
alias ardev='ass dev'
alias arprod='ass prod'

