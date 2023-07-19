winget install -e --id Mozilla.Firefox
winget install -e --id UniKey.UniKey

:: Install chocolatey (cmd admin)
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

:: Install scoop
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
 irm get.scoop.sh | iex
scoop install curl sudo jq git main
scoop install bucket add extras
scoop install firefox
winget install -e --id Mozilla.Firefox
winget install -e --id UniKey.UniKey

:: Neovim provider
scoop bucket add main
scoop install neovim
pip install --user --upgrade pynvim

:: Vscode 
scoop install extras/vscode
choco install gcc
scoop install msys2
:: Remind to add path (see document for more detail)

:: Other packages
scoop install rainmeter flow-launcher obsidian anki winrar sublime-text flux brave
winget install -e --id VNGCorp.Zalo
