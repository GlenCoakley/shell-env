
env=~/.ssh/agent.env

function agent_load_env () { 
   test -f "$env" && source "$env" >| /dev/null ;
#   env | \grep SSH_
}

function agent_start () {
   echo "Starting ssh-agent."
   (umask 077; ssh-agent >| "$env")
   source "$env" >| /dev/null ;
}

function add_all_keys () {
   cd ~/.ssh
   for key in *id_rsa; do
      ssh-add $key
   done
}

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)
if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
   # Sleep a random number of seconds (between 0-3) they try again. This is to help avoid the common situation 
   # where there is a race condition when multiple shells are started simultaneously. If multiple ssh-agents are 
   # still started then decrease the divisor. $RANDOM is always between 0-32768.
   sleep $(($RANDOM / 10000))
   agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)
fi

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
   agent_start
   add_all_keys
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
   add_all_keys
fi

unset env

