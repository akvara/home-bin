git co master
git remote update origin --prune
git branch --merged master | grep -v '^[ *]*master$' | xargs git branch -d
