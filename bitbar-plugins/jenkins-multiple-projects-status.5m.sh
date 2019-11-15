#!/bin/bash
# <bitbar.title>Multiple Jenkins Status</bitbar.title>
# <bitbar.desc>Check status of multiple Jenkins projects</bitbar.desc>
# <bitbar.author>Nocolas Roger</bitbar.author>
# <bitbar.author.github>nicolasroger17</bitbar.author.github>
# <bitbar.version>1</bitbar.version>

PATH=/usr/local/bin:$PATH

SCHEMA="https"
BASE_URL="jenkinsci.datarecognitioncorp.com"
USER="gcoakley" #"/my-views/view"
TOKEN=$(jq -r '.jenkinsTokenBitbar' < ~/.ssh/drc.secrets.json)
JOBS=($(jq -cr '.[]' $(dirname $0)/config/github-projects.json))

function displaytime {
  local T=$1/1000
  local D=$((T/60/60/24))
  local H=$((T/60/60%24))
  local M=$((T/60%60))
  local S=$((T%60))
  local output=""

  if [[ $D -gt 0  || $H -gt 0 || $M -gt 10 ]]
  then
    output+=">10mn"
  else
    output+="${M}mn ${S}s"
  fi

  echo "${output} ago"
}

mkdir -p ./tmp
# beginning of display
echo "Jenkins Status at $(date +%X)"
echo "---"

for project in "${JOBS[@]}"
do
  output="${project}: "
  url="${SCHEMA}://${USER}:${TOKEN}@${BASE_URL}/job/${project// /'%20'}/lastBuild/api/json?pretty=true"
  query=$(curl --insecure --silent --show-error "${url}" | grep '"result"\|"timestamp"' | head -2)
  success=$(echo "${query}" | grep '"result"' | awk '{print $3}') # grep the "result" line

  echo "curl --insecure --silent "${url}" | grep '"result"\|"timestamp"' | head -2" > ./tmp/${project// /'%20'}.log
  echo tmp/${project// /'%20'}.log"$query" >> ./tmp/${project// /'%20'}.log

  if [[ $success == *"SUCCESS"* ]]
  then
    output+='🔵 '
  else
    output+='🔴 '
  fi

  timestamp=$(echo "${query}" | grep "timestamp" | awk '{print $3}') # grep the "timestamp" line
  timestamp=${timestamp%?} # remove the trailing ','
  currentTime=$(($(date +'%s * 1000 + %-N / 1000000'))) # generate a timestamp
  output+=" $(displaytime $(( currentTime - timestamp )))"
  echo "${output}"
done
echo "Finished at $(date +%X)"

