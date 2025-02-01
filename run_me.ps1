function run_task($file) {
    Start-Process powershell.exe -ArgumentList "-File $file" -Verb RunAs
}

run_task .\update_dotfiles.ps1
run_task .\install_programs.ps1
