## The Dotfiles Setup
Inspired by a gorilla, er, this [Git Tutorial](https://www.atlassian.com/git/tutorials/dotfiles)

### Step 1: Setup the `dot` alias and Working Directory
```
localGitDir=$HOME/.dotfile ## Or any non-existing file/dir
alias dot='git --git-dir=$localGitDir --work-tree=$HOME'
echo "alias dot='git --git-dir=$localGitDir --work-tree=$HOME'" >> $HOME/.bashrc
```
### Step 2: Clone create the local 
```
# Note: don't use the `dot` alias to clone
git clone --bare git@github.com:jimsander/dotfiles.git $localGitDir
# Now use `dot` for management of this local bare repo
dot config --local status.showUntrackedFiles no
dot push --set-upstream origin main
echo $(basename $localGitDir) >> .gitignore
```

