#Requires -RunAsAdministrator

# Sync neovim config
$is_in_git_dir = git -C $env:LOCALAPPDATA\nvim rev-parse --is-inside-work-tree
if ($is_in_git_dir -eq "true") {
    git pull
} else {
    git clone https://github.com/wrapperup/nvim-config $env:LOCALAPPDATA\nvim
}

# Copy home-dir configurations
Copy-Item -Force -Recurse .\dots\* ~

# Copy powershell profile
New-Item -ItemType File -Path $PROFILE -Force
Copy-Item .\Microsoft.PowerShell_profile.ps1 $PROFILE -Force

# Make keyboard repeats waaay faster
Set-Location "HKCU:\Control Panel\Accessibility\Keyboard Response"

Set-ItemProperty -Path . -Name AutoRepeatDelay       -Value 150
Set-ItemProperty -Path . -Name AutoRepeatRate        -Value 5
Set-ItemProperty -Path . -Name DelayBeforeAcceptance -Value 0
Set-ItemProperty -Path . -Name BounceTime            -Value 0
Set-ItemProperty -Path . -Name Flags                 -Value 47

Register-ScheduledTask `
    -TaskName "GlazeWM Startup" `
    -Description "Starts GlazeWM at logon" `
    -Action (New-ScheduledTaskAction -Execute "C:\Program Files\glzr.io\GlazeWM\cli\glazewm.exe") `
    -Trigger (New-ScheduledTaskTrigger -AtLogOn) `
    -Principal (New-ScheduledTaskPrincipal -UserId "$env:UserDomain\$env:UserName" -LogonType Interactive -RunLevel Highest) `

Register-ScheduledTask `
    -TaskName "AltSnap Startup" `
    -Description "Starts AltSnap at logon" `
    -Action (New-ScheduledTaskAction -Execute "$env:APPDATA\AltSnap\AltSnap.exe") `
    -Trigger (New-ScheduledTaskTrigger -AtLogOn) `
    -Principal (New-ScheduledTaskPrincipal -UserId "$env:UserDomain\$env:UserName" -LogonType Interactive -RunLevel Highest) `

Register-ScheduledTask `
    -TaskName "Zulip Startup" `
    -Description "Starts Zulip at logon" `
    -Action (New-ScheduledTaskAction -Execute "$env:LOCALAPPDATA\Programs\Zulip\Zulip.exe") `
    -Trigger (New-ScheduledTaskTrigger -AtLogOn) `
    -Principal (New-ScheduledTaskPrincipal -UserId "$env:UserDomain\$env:UserName" -LogonType Interactive -RunLevel Highest) `
