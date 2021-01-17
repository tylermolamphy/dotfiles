Set-ExecutionPolicy Unrestricted

if (Get-Command choco -errorAction SilentlyContinue)
{
    Write-Host "Package manager is already installed"
}else{
    iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
}

choco install -y 7zip.install
choco install -y chocolatey
choco install -y firefox
choco install -y chromium
choco install -y joplin
choco install -y nextcloud-client
choco install -y everything
choco install -y 1password
choco install -y cmder
choco install -y git.install
choco install -y vim
choco install -y ditto
choco install -y vscode
choco install -y postman
choco install -y vlc
choco install -y winmerge
choco install -y winscp
choco install -y spotify
choco install -y windirstat
choco install -y wireshark
choco install -y greenshot
choco install -y autohotkey
choco install -y powertoys
choco install -y iperf3
choco install -y sysinternals

Write-Host "Disable Aeroshake..."
start cmd.exe -PassThru -Wait -ArgumentList @('/c"', 'reg','import', '$PSScriptRoot' + '\defaults\win10noshake.reg')

start $PSScriptRoot\defaults\win10debloat.bat -PassThru -Wait -NoNewWindow

& "$PSScriptRoot\defaults\win10privacy.ps1"

shutdown /r /t 5