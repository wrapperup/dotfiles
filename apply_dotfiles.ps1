#Requires -RunAsAdministrator

# Util functions

function register_startup_program($name, $path) {
    if(Get-ScheduledTask -TaskName "$name Startup" -ErrorAction Ignore){
        Write-Output "$name startup task already exists, skipping..."
    } else {
        Register-ScheduledTask `
            -TaskName "$name Startup" `
            -Description "Starts $name at logon" `
            -Action (New-ScheduledTaskAction -Execute $path) `
            -Trigger (New-ScheduledTaskTrigger -AtLogOn) `
            -Principal (New-ScheduledTaskPrincipal -UserId "$env:UserDomain\$env:UserName" -LogonType Interactive -RunLevel Highest) `
    }
}

# Sync neovim config
Write-Output "Cloning Nvim configuration:"

$is_in_git_dir = git -C $env:LOCALAPPDATA\nvim rev-parse --is-inside-work-tree
if ($is_in_git_dir -eq "true") {
    git pull
} else {
    git clone https://github.com/wrapperup/nvim-config $env:LOCALAPPDATA\nvim
}

# Copy home-dir configurations
Copy-Item -Force -Recurse .\dots\* ~

# Copy powershell profile
[void](New-Item -ItemType File -Path $PROFILE -Force)
Copy-Item .\win\Microsoft.PowerShell_profile.ps1 $PROFILE -Force

# Make keyboard repeats waaay faster
Set-Location "HKCU:\Control Panel\Accessibility\Keyboard Response"

Set-ItemProperty -Path . -Name AutoRepeatDelay       -Value 150
Set-ItemProperty -Path . -Name AutoRepeatRate        -Value 5
Set-ItemProperty -Path . -Name DelayBeforeAcceptance -Value 0
Set-ItemProperty -Path . -Name BounceTime            -Value 0
Set-ItemProperty -Path . -Name Flags                 -Value 47

# Register startup programs
# ISSUE: This makes a ghost window. idk what the issue is.
# register_startup_program "GlazeWM" "C:\Program Files\glzr.io\GlazeWM\cli\glazewm.exe"
register_startup_program "Zulip" "$env:LOCALAPPDATA\Programs\Zulip\Zulip.exe"
