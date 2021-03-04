#!/bin/bash
set -x
. "$SCRIPTS/common.sh"

plus=$(git diff "$base".."$merged" | grep -E "^\+" | grep -v -E "^\+\+\+" | wc -l)
minus=$(git diff "$base".."$merged" | grep -E "^\-" | grep -v -E "^\-\-\-" | wc -l)
total=$((plus + minus))

if [ "$total" -lt "40" ]; then
	type="XS"
elif [[ "$total" -ge "40" && "$total" -le "100" ]]; then
	type="S"
elif [[ "$total" -gt "100" && "$total" -le "300" ]]; then
	type="M"
elif [[ "$total" -gt "300" && "$total" -le "500" ]]; then
	type="L"
else
	type="XL"
fi

add=$(git diff --name-status "$base".."$merged" | grep -E "^A|^R" | wc -l)
del=$(git diff --name-status "$base".."$merged" | grep -E "^D" | wc -l)
if [[ "$add" -gt "0" && "$del" -gt "0" ]]; then
	allowedadd=200
	alloweddel=200
elif [[ "$add" -gt "0" && "$del" -eq "0" ]]; then
	allowedadd=200
	alloweddel=100
elif [[ "$add" -eq "0" && "$del" -gt "0" ]]; then
	allowedadd=100
	alloweddel=200
else
	allowedadd=100
	alloweddel=100
fi

if [[ $plus -le $allowedadd && $minus -le $alloweddel ]]; then
	reason="PR-Size check Successfull, PR Size - $type"
	poststatus success "$reason" PRSIZE-CHECK
else
	echo "PR size is more than threshold. Failing the Check"
	reason="Add, Del - $plus, $minus Allowed Add, Del - $allowedadd,$alloweddel, PR Size - $type"
	poststatus failure "$reason" PRSIZE-CHECK
	record prsize
fi
