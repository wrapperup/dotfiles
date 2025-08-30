$base = (Resolve-Path (git rev-parse --show-toplevel)).ToString() + "\dots"

Write-Host "Pulling on-host dotfiles..."

Get-ChildItem -Path $base -File -Recurse | ForEach-Object {
    $relative = Resolve-Path -Relative -Path $_.FullName -RelativeBasePath $base

    $from = $home + "\" + $relative
    $to = $base + "\" + $relative

    Write-Host ("Copy ~\" + $relative)

    Copy-Item $from $to
}

Write-Host ("Copy Powershell Profile")
Copy-Item $PROFILE .\win\Microsoft.PowerShell_profile.ps1 -Force
