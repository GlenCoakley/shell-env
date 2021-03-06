
function source_by_mode_or_default() {
  [ "$GAC_NOW_INTERACTIVE" == "no" ] && ext="-l"
  [ "$GAC_NOW_INTERACTIVE" == "yes" ] && ext="-i"
  local optional=$1
  local file=$2
  local filepath=$GAC_CFG_DIR/$file

  if [ -s $filepath$ext ]; then
    [ "$GAC_DEBUG" -ge "1" ] && echo -n "$file, "
    source $filepath$ext
  else
    fileExists=no
    [ -s $filepath ] && fileExists=yes
    if [ "$fileExists" == "yes" ] || [ "$optional" == "no" ]; then 
      [ "$GAC_DEBUG" -ge "1" ] && echo -n "$file, "
      source $filepath
    elif [ "$GAC_DEBUG" -ge "2" ]; then
      echo -e "\nDid not find $file$ext or $file or file is optional ($optional) from CWD: $(pwd)"
    fi
  fi
}

function source_optional() { source_by_mode_or_default yes $@; }
function source_required() { source_by_mode_or_default no $@; }

function source_all() {
  [ -z "$1" ] && echo 'Usage: <file...>'

  if [ -n "$1" ]; then
    [ "$GAC_DEBUG" -ge "1" ] && echo -n "sourcing: "
    for cf in $@; do
      source_required "$cf"
    done
  fi
}

