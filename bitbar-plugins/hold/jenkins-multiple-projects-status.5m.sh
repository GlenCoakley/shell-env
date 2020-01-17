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

# beginning of display
echo "Builds $(date +%X)"
echo "---"
echo "---"

for project in "${JOBS[@]}"
do
  output="${project}: "
  url="${SCHEMA}://${USER}:${TOKEN}@${BASE_URL}/job/${project// /'%20'}/job/develop/lastBuild/api/json?pretty=true"
  queryResult=$(curl --insecure --silent --show-error "${url}")
  notFound=$(echo "${queryResult}" | grep -ic 'Not found')
  if [ "$notFound" -eq 0 ]; then
    result=$(echo "${queryResult}" | jq -r '.result')
    timestamp=$(echo "${queryResult}" | jq -r '.timestamp' | awk '{print $3}')
  fi

  if [[ $result == *SUCCESS* ]]; then
    output+='🔵'
  elif [[ $result == *FAILURE* ]]; then
    output+='🔴'
  else
    output+='??'
  fi

  currentTime=$(($(date +'%s * 1000 + %-N / 1000000'))) # generate a javascript timestamp
  output+=" $(displaytime $(( currentTime - timestamp )))"
  echo "${output}"
done
echo "Finished at $(date +%X)"

