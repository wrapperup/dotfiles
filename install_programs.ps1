winget install Mozilla.Firefox

winget install Discord.Discord
winget install Zulip.Zulip

winget install wez.wezterm
winget install Microsoft.PowerShell
winget install Git.Git --custom '/Components="gitlfs" /EditorOptions=VIM /DefaultBranchName=main /PathOption=Cmd /SSHOption=ExternalOpenSSH /CurlOption=WinSSL /CRLFOption=CRLFAlways /BashTerminalOption=ConHost /UseCredentialManager=Enabled /PerformanceTweaksFSCache=Enabled /EnableSymlinks=Disabled /EnablePseudoConsoleSupport=Disabled /EnableFSMonitor=Enabled'
winget install Neovim.Neovim

winget install GlazeWM

winget install Docker.DockerDesktop

winget install --id Microsoft.VisualStudio.2022.Community --override "--passive --config ./my.vsconfig"

winget install JetBrains.Toolbox
winget install JetBrains.Rider

winget install Rustlang.Rustup
cargo install ripgrep

winget install OpenJS.NodeJS
winget install pnpm.pnpm
winget install CoreyButler.NVMforWindows
