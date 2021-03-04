#!/bin/bash
set -x
. "$SCRIPTS/common.sh"
rm -rf comment

j=""
if echo "${ghprbTargetBranch}" | grep -E "^3.0[3-9].1[7-8][0-9]{2}$|^cloc$|^loc_clinical_records$|^loc_clinical_cpoe$|^3.0[3-9].1[7-8][0-9]{2}.-[0-9]{1,2}-[0-9]{7}$"; then
	ghprbTargetBranch=$(echo "$ghprbTargetBranch" | awk -F"-" '{print $1}' | sed 's/\.$//')
        project="${ghprbTargetBranch}-tasy"
elif echo "${ghprbTargetBranch}" | grep -E "^japan_loc"; then
        project="japan_loc-tasy"
else
        project="tasy"
fi

for i in $(git diff --name-only --diff-filter=AMRC "$base".."$merged")
do
	j=$j,$i
done
sonar=$(echo "$j" | sed 's/^,//')
echo "$sonar"
if [ -n "$sonar" ]; then
	sonar-runner -Dsonar.host.url="$SONAR_URL" -Dsonar.sourceEncoding=UTF-8 -Dsonar.sources="$sonar" -Dsonar.github.oauth="$GH_TOKEN" -Dsonar.projectVersion=1.0.0 -Dsonar.projectKey="$project" -Dsonar.verbose=true -Dsonar.github.pullRequest="${ghprbPullId}" -Dsonar.projectBaseDir=. -Dsonar.forceUpdate=true -Dsonar.github.repository="philips-emr/tasy" -Dsonar.analysis.mode=preview -Dsonar.projectName="$project"
else
	reason="No problems found."
	poststatus success "$reason" sonarqube
fi

# Checking for Major Issue 
sleep 60
getstatus
while read -r line
do
        if echo "$line" | grep -E '"state": "success",' >/dev/null;then
                FAIL="0"
        elif echo "$line" | grep -E '"state": "failure",' >/dev/null;then
                FAIL="1"
        fi
        if echo "$line" | grep -E '"context": "sonarqube",' >/dev/null;then
                if [ "$FAIL" -eq "1" ]; then
                        echo "FAILED"
			record sonarqube
                fi
                break
        fi
done < log
rm log

getreviewcomment
major=$(grep -c "'Severity: MAJOR'" < comment)
vul="0"
bug="0"

while IFS= read -r line
do
        if grep -E ",$line$" "$SCRIPTS/vulrulelist"; then
                echo "New Vulnerabilities found"
                vul="1"
        else
                echo "No New Vulnerabilities found"
        fi
done < <(grep rule_key < comment | awk -F"%3A" '{ print $2}' | awk -F")" '{print $1}')


while IFS= read -r line
do
        if grep -E ",$line$" "$SCRIPTS/bugrulelist"; then
                echo "New Bug found"
                bug="1"
        else
                echo "No New Bug found"
        fi
done < <(grep rule_key < comment | awk -F"%3A" '{ print $2}' | awk -F")" '{print $1}')

if [[ "$major" -gt "0" || "$bug" -gt "0" || "$vul" -gt "0" ]]; then
	reason="One or more bugs\/vulnerabilities found."
	poststatus failure "$reason" sonarqube
	if [ "$FAIL" -eq "1" ]; then
                echo "Already entered"
        else
		record sonarqube
        fi
fi
