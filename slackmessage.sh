#!/bin/bash
#Slack message
status=$1

GITHUB_ICO='https://slack-imgs.com/?c=1&o1=wi32.he32.si&url=https%3A%2F%2Fgithub.githubassets.com%2Ffavicon.ico'
commit=`echo $GIT_COMMIT | cut -c1-8`

if [[ $status = 'true' ]]
then
  text="Successfully deployed $commit to <$BUILD_URL""console|$JOB_BASE_NAME>"
  ALERT_COLOR="#36a64f"
else
  text="Deploying $commit to <$BUILD_URL""console|$JOB_BASE_NAME> failed"
  ALERT_COLOR="#D62020"
fi
slackmessage='{"username": "'$USERNAME'","channel": "github","attachments": [{"mrkdwn_in": ["text"],"color": "'$ALERT_COLOR'","text": "'$text'","footer": "<'$GIT_REPO'|'$JOB_BASE_NAME'>","footer_icon": "'$GITHUB_ICO'"}]}'

echo $slackmessage
#curl -X POST -s -H 'Content-type: application/json' --data "$slackmessage" $WEBHOOK
