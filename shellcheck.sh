#!/bin/bash
set -x
. "$SCRIPTS/common.sh"

FAILED="0"
CHANGED="0"
for FILE in $(git diff --name-only --diff-filter=AMRC "$base".."$merged"| grep ".sh$")
do
	error=$(shellcheck -e SC2001 -e SC2034 -e SC2154 -e SC1091 "$FILE")
    	if  [ -n "$error" ]; then
        	echo "Fix the errors before commit"
		FAILED=1
		CHANGED=1
    	fi
done

if [ "$FAILED" -gt "0" ]; then
        stat="failure"
        reason="shell check has been failed"
	record shellcheck
else
        stat="success"
        reason="shell check has been passed"
fi

if [ "$CHANGED" -gt "0" ]; then
	poststatus "$stat" "$reason" shellcheck
fi
