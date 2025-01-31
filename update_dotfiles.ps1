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
