# Common job's base detection

git fetch

master_base="$(git merge-base --fork-point master HEAD)"
develop_base="$(git merge-base --fork-point develop HEAD)"
if git merge-base --is-ancestor "$master_base" "$develop_base"; then
	# We are closer to develop than master so build on HBL
	branch="hbl"
	base="$develop_base"
else
	# We are close to master than develop so build on HBK
	branch="hbk"
	base="$master_base"
fi
