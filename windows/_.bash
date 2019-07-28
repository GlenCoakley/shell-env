
#-----------------------------
# Shell Options 
#-----------------------------
# Complete .exe executables with their short name.
shopt -s completion_strip_exe

#-----------------------------
# Other configuration files
#-----------------------------

#-----------------------------
# Environment Variables
#-----------------------------
# PATH=$(~/scripts/path-remove '/windows/System32' 'SQL Server/')
# export PATH=~/scripts/drc:~/scripts:~/bin:./node_modules/.bin:/c/dev/bin/grails-2.4.5/bin:/c/dev/bin/mongo-3.2.11/bin:/c/dev/bin/dockerToolbox:${PATH}

PATH="${PATH}:/c/home/gcoakley/perl5/bin"; export PATH;
PERL5LIB="/c/home/gcoakley/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/c/home/gcoakley/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/c/home/gcoakley/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/c/home/gcoakley/perl5"; export PERL_MM_OPT;

#-----------------------------
# Functions
#-----------------------------
function npp() { /c/dev/bin/Notepad++/notepad++.exe $@ & }
function winmerge() { /c/Progra~2/tools/WinMerge/WinMergeU.exe $@ & }
function win() { PATH=/c/windows/system32:$PATH $@ ; }

#-----------------------------
# Aliases
#-----------------------------
alias 7z='/c/Progra~1/7-Zip/7z'
alias choc-installed="choco list --local-only | sort" # or: cinst -l | sort
alias choc-upgrade='choco upgrade chocolatey'

