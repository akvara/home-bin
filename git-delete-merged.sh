git co master
git remote update origin --prune
git branch --merged master | grep -v '^[ *]*master$' | '^[ *]*staging$' | xargs git branch -d
