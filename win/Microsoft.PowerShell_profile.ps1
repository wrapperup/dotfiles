Set-Alias -Name firefox -Value "C:\\Program Files\\Mozilla Firefox\\firefox.exe"
Set-Alias -Name superluminal -Value "C:\\Program Files\\Superluminal\\Performance\\Profiler.exe"

$PSStyle.FileInfo.Directory = ""

function bash {
  & "C:\Program Files\Git\bin\bash.exe" -li @Args
}

function My-Ip {
    (Invoke-WebRequest ifconfig.me/ip).Content.Trim()
}

function prompt {
    $p = $executionContext.SessionState.Path.CurrentLocation
    $osc7 = ""
    if ($p.Provider.Name -eq "FileSystem") {
        $ansi_escape = [char]27
        $provider_path = $p.ProviderPath -Replace "\\", "/"
        $osc7 = "$ansi_escape]7;file://${env:COMPUTERNAME}/${provider_path}${ansi_escape}\"
    }
    "${osc7}PS $p$('>' * ($nestedPromptLevel + 1)) ";
}

