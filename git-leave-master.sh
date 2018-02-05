git co master
git remote update origin --prune
git branch | grep -v "master" | xargs git branch -D
