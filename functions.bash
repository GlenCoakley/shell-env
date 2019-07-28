
function mcd() { mkdir -p $@; cd $@; }
function which() { type -a $1 | sed -e "s/^$1 is //g"; }    # where, of a sort

function cdToIfExists() { 
  if [ -n "$1" ]; then
    if [ -d $1 ]; then cd $1; return 0; 
    else 
      expandsTo=$(/bin/ls -1d *$1*)
      count=$(echo "$expandsTo" | wc -l)
      if [ $count -gt 1 ]; then echo "Found matches:" $expandsTo;
      elif [ -d *$1* ]; then cd *$1*; return 0;
      fi
    fi
  fi
  return 1;
}

