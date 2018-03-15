git co master
git remote update origin --prune
git branch | grep -v '^[ *]*master$' | grep -v '^[ *]*staging$' | xargs git branch -D
