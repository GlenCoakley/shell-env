
function aws-role() {
   OUTDIR=~
   assume-role -duration 43200s drcdev | tee $OUTDIR/assumed-role.out && \
      source $OUTDIR/assumed-role.out && \
      echo "Saved and sourced $OUTDIR/assumed-role.out"
}

alias aws-role-unset='unset AWS_SESSION_TOKEN AWS_SECRET_ACCESS_KEY AWS_ACCESS_KEY_ID AWS_SECURITY_TOKEN'
alias unset-aws-role='unset AWS_SESSION_TOKEN AWS_SECRET_ACCESS_KEY AWS_ACCESS_KEY_ID AWS_SECURITY_TOKEN'

