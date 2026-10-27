# Safe two-way sync for Windows: pull --rebase --autostash → add → commit → push
# Never force-pushes.
$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent $PSScriptRoot
Set-Location $Root

Write-Host "[sync] repo: $Root"

try {
  git pull --rebase --autostash origin HEAD
} catch {
  git pull --rebase --autostash
}

$status = git status --porcelain
if (-not $status) {
  Write-Host "[sync] nothing to commit"
  git push
  Write-Host "[sync] done"
  exit 0
}

git add -A
$msg = "chore(sync): vault sync $(Get-Date -Format 'yyyy-MM-ddTHH:mm:sszzz')"
git commit -m $msg
git push
Write-Host "[sync] done"
