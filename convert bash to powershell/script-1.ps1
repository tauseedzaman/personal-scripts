#!/usr/bin/env ps1

$CI_DEFAULT_BRANCH = 'main'
$NEWSCORES = @()
$OLDSCORES = @()
$FILENAMES = git diff --name-only --name-only --diff-filter=M master src | Select-String -Pattern ".*.py"
$EXITCODE = 0
$INDEXABLEFILENAMES = @()

New-Item -Path './tempfile.py' -Force

foreach ($FN in $FILENAMES) {
  $INDEXABLEFILENAMES += $FN
} 

foreach ($FN in $FILENAMES) {
  $NEWSCORES += python3 -m pylint $FN | sed -n 's/^Your code has been rated at \([-0-9.]*\)\/.*/\1/p'
} 

foreach ($FN in $FILENAMES) {
  git show origin/$($CI_DEFAULT_BRANCH):$FN | Add-Content tempfile.py
  $OLDSCORES += python3 -m pylint tempfile.py | sed -n 's/^Your code has been rated at \([-0-9.]*\)\/.*/\1/p'
}

foreach ($I in !$NEWSCORES) {
  if ({ python3 -c if($($NEWSCORES[$I]) -lt $($OLDSCORES[$I])) { "exit(0)" } else { "exit(1)" } }) {
    Write-Host "New score lower than old in file $($INDEXABLEFILENAMES[$I]). New score: $($NEWSCORES[$I]) Old score: $($OLDSCORES[$I])"
    $EXITCODE = 1
  } 
}

Remove-Item ./tempfile.py
exit $EXITCODE