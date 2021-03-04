#!/bin/bash
# This is common methods used by CI Process
Date=$(date '+%d/%m/%Y %H:%M:%S')
merged=$(git show-ref | grep "origin/pr/${ghprbPullId}/merge" | awk '{print $1}')
ghprbActualCommit=$(git show-ref | grep "origin/pr/${ghprbPullId}/head" | awk '{print $1}')
base=$(git show --no-patch --pretty=format:%H "$merged"^)
export ORACLE_HOME=/usr/lib/oracle/19.3/client64
export PATH=$PATH:$ORACLE_HOME/bin
export LD_LIBRARY_PATH=$ORACLE_HOME/lib
export TNS_ADMIN=$ORACLE_HOME/network/admin

function poststatus {
  {
     echo "{";
     echo "\"state\": \"$1\","
     echo "\"target_url\": \"$BUILD_URL\","
     echo "\"description\": \"$2\","
     echo "\"context\": \"$3\""
     echo "}"
  } > "${ghprbPullId}.json"
  curl -H "Authorization: token $GH_TOKEN" -d @"${ghprbPullId}.json" "$GH_API/repos/$GH_ORG/$GH_REPO/statuses/$ghprbActualCommit"
  rm -rf "${ghprbPullId}.json"
}
 
function getcomment {
  curl -H "Authorization: token $GH_TOKEN" "$GH_API/repos/$GH_ORG/$GH_REPO/issues/${ghprbPullId}/comments" > comments  
}

function deletecomment {
  curl -X DELETE -H "Authorization: token $GH_TOKEN" "$GH_API/repos/$GH_ORG/$GH_REPO/issues/comments/$1"
}

function getreviewcomment {
  curl -H "Authorization: token $GH_TOKEN" "$GH_API/repos/$GH_ORG/$GH_REPO/pulls/$ghprbPullId/comments?per_page=100&page=1" > comment
}

function deletereviewcomment {
  curl -X DELETE -H "Authorization: token $GH_TOKEN" "$GH_API/repos/$GH_ORG/$GH_REPO/pulls/comments/$1"
}

function getstatus {
  curl -H "Authorization: token $GH_TOKEN" "$GH_API/repos/$GH_ORG/$GH_REPO/commits/$ghprbActualCommit/statuses" > log
}

function postcomment {
  echo "{" > "${ghprbPullId}-com.json"
  echo "\"body\": \"$1\"" >> "${ghprbPullId}-com.json"
  echo "}" >> "${ghprbPullId}-com.json"
  curl -H "Authorization: token $GH_TOKEN" -d @"${ghprbPullId}-com.json" "$GH_API/repos/$GH_ORG/$GH_REPO/issues/${ghprbPullId}/comments"
  rm -rf "${ghprbPullId}-com.json"
}

function postreviewcomment {
  {
  echo "{"
  echo "\"path\": \"$1\","
  echo "\"line\": $2,"
  echo "\"side\": \"$3\","
  echo "\"commit_id\": \"$ghprbActualCommit\","
  echo "\"body\": \"$4\""
  echo "}"
  } > "${ghprbPullId}"-com.json
  curl -H "Authorization: token $GH_TOKEN" -d @"${ghprbPullId}-com.json" "$GH_API/repos/$GH_ORG/$GH_REPO/pulls/$ghprbPullId/comments"
  rm -rf "${ghprbPullId}-com.json"
}

function record {
  sqlplus -s tasy/aloisk@phdev <<END
  execute insert_prci_data('$Date',$ghprbPullId,'$GH_REPO','$1');
  commit;
  exit;
END
  sed -i "/,$GH_REPO,$ghprbPullId,$1$/d" /home/jenkins/pr-failed-build-data
  echo "$Date,$GH_REPO,$ghprbPullId,$1" >> /home/jenkins/pr-failed-build-data
}
