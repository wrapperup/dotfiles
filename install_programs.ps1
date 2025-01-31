#Requires -RunAsAdministrator

winget install Mozilla.Firefox

winget install wez.wezterm -h
winget install Microsoft.PowerShell -h
winget install Git.Git -h --custom '/Components="gitlfs" /EditorOptions=VIM /DefaultBranchName=main /PathOption=Cmd /SSHOption=ExternalOpenSSH /CurlOption=WinSSL /CRLFOption=CRLFAlways /BashTerminalOption=ConHost /UseCredentialManager=Enabled /PerformanceTweaksFSCache=Enabled /EnableSymlinks=Disabled /EnablePseudoConsoleSupport=Disabled /EnableFSMonitor=Enabled'
winget install Neovim.Neovim -h

winget install GlazeWM -h
winget install AltSnap.AltSnap -h
winget install RamenSoftware.Windhawk -h

winget install Discord.Discord -h
winget install Zulip.Zulip -h

winget install Kitware.CMake -h

winget install Microsoft.VisualStudio.2022.Community -h --override "--passive --config ./my.vsconfig"

winget install JetBrains.Toolbox -h
winget install JetBrains.Rider -h

winget install Rustlang.Rustup -h
cargo install ripgrep

winget install Docker.DockerDesktop -h

winget install OpenJS.NodeJS -h
winget install pnpm.pnpm -h
winget install CoreyButler.NVMforWindows -h

winget install Perforce.P4V -h
winget install WireGuard.WireGuard -h
