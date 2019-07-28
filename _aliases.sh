# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.
#
alias cp='\cp -p'

# Interactive operation...
# alias rm='\rm -i'
# alias cp='\cp -i'
alias mv='\mv -i'

# Default to human readable figures
alias df='\df -h'
alias du='\du -ch'

# Some shortcuts for different directory listings
# source ~/scripts/ls-colors.sh
alias lrt='ls -lrt'
alias lt='ls -lt'
alias ls='\ls -CFh'                 # classify files in colour
alias dir='ls --color=no --format=vertical'
# alias vdir='ls --color=no --format=long'
alias la='ls -A'                    # all but . and ..
alias ll='ls -l'                    # long list
alias lla='ls -lA'                  # long list of all but . and ..
alias lld='ls -lad'                 # long list as directories--don't show directory contents.

# curlg ~= 'curl --insecure --location --include --silent --show-error'
alias curlg='curl --kLisS'
alias diff='diff -b'
alias dird=lsd
alias emc='echo_do vi $GAC_CFG_DIR/login.bash'
alias ewc='echo_do vi $GAC_CFG_DIR/work/drc.bash'
alias findf='find . -type f'
alias findd='find . -type d'
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
alias hg='history | grep'
alias k=exit
alias less='\less -e'
alias lsd='find . -maxdepth 1 -type d'
# Don't set the LESS environment variable as it causes git output to mishandle the terminal. 
alias more=less
alias m=more
alias mroe=more
alias shell-options='set -o'
alias show-shell-options='set -o'
alias tty-reset='reset'
alias wihch=which
alias whence='type -a'                        # where, of a sort

