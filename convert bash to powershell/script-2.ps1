#!/usr/bin/env ps1
$CI_DEFAULT_BRANCH = "main"
function Execute_git_command {
    $lines = 0;
    git diff --name-only --diff-filter=A master src | Select-String -Pattern ".*.py" | foreach-object { $lines++ }
    return $lines
}

if ($(Execute_git_command) -ge 0 ) {
    python3 -m pylint $(git diff --name-only --diff-filter=A $CI_DEFAULT_BRANCH src | Select-String -Pattern ".*.py") --fail-under=10;
}