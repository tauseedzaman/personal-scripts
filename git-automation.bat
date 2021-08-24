@echo off
echo "Welcome to git cli"
set /p reponame = Enter repo name: 
echo "# %reponame%" >> README.md
git init
echo git inialation..Done
echo adding files to git ...... 
git add .
echo "files added..Done"
set /p message=your commit message:
git commit -m "%message%"
echo "........Done"
git branch -M main
echo Main Branch added....Done
set /p repolink=enter remote repo link \n link should be like https://github.com/tauseedzaman/laravel:

git remote add origin %repolink%
git push -u origin main
echo ----------Commit is Successfull----------
set /p id=press any key to exit: 
