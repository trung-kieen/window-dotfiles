# NOTE: This will contain many hevy package 
# Eclipse 	
choco install eclipse --yes

choco install docker-desktop --yes
Update-Environment-Path

scoop install main/php
scoop install extras/xampp
# Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
# restart
# wsl --install
# May be need to enable Inter virtualization technology in BIOS
wsl install -d Ubuntu



# PowerShell Tooling for Git
Install-Module posh-git -Force -Scope CurrentUser
Install-Module oh-my-posh -Force -Scope CurrentUser
Set-Prompt
Install-Module -Name PSReadLine -Scope CurrentUser -Force -SkipPublisherCheck
Add-Content $PROFILE "`nImport-Module posh-git`nImport-Module oh-my-posh`nSet-PoshPrompt Paradox"




# Docker extension for vscode	 
code --install-extension PeterJausovec.vscode-docker


