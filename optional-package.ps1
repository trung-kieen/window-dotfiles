# NOTE: This will contain many hevy package 
# Eclipse 	

function Update-Environment-Path
{
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") `
        + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

choco install eclipse --yes

choco install docker-desktop --yes
Update-Environment-Path
 

# Install additional development environment
scoop install ruby go perl zig

scoop install main/php --yes
scoop install extras/xampp --yes



# Wsl
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
dism.exe /online /enable-feature /featurename:Microsoft-Window-Subsystem-Linux /all /norestart
# restart
wsl --install
# Require enable Inter virtualization technology in BIOS
wsl install -d Ubuntu



# Additional tool
scoop install atom putty postman  db-visualizer

# Docker extension for vscode	 
code --install-extension PeterJausovec.vscode-docker

choco install visualstudio2019buildtools --yes

sudo choco install tortoisegit --yes
sudo choco install teamviewer --yes
sudo choco install ultraviewer --yes

sudo choco install redis-desktop-manager --yes
sudo choco install zeplin --yes



# Font to support PowerShell Tooling:
git clone https://github.com/ryanoasis/nerd-fonts.git  --depth 1
cd nerd-fonts
.\install.ps1
cd ..\
Remove-Item -Path "nerd-fonts"  -Recurse -Force
Write-Output 'Be sure to configure Windows Terminal fonts! Suggest using "fontFace": "MesloLGM NF"'


# Install nvim plug
# iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
#    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
# Write-Host "Neovim plug have installed" -ForegroundColor blue  -BackgroundColor Yellow

###############
## Unuse app ##
###############

# Unuse package with scoop 
#scoop install rainmeter  extras/wpsoffice  main/cmder
#scoop install main/zoxide

# Unuse package with choco 
# choco install webdeploy -y
#  choco install urlrewrite -y
 
# Dotpeek for .Net development
# choco install dotpeek
 
#Notepad++ installation
#  choco install notepadplusplus.install --yes
#  choco install embarcaderodevcpp --yes
#ServiceBusExplorer
#  choco install servicebusexplorer


# Setup Oh my posh 
#winget install JanDeDobbeleer.OhMyPosh -s winget
#Update-Environment-Path
#oh-my-posh get shell
#echo  "oh-my-posh init pwsh | Invoke-Expression" >> $PROFILE
#oh-my-posh font install --user
# Reload profile
#. $PROFILE      
#Update-Environment-Path


# PowerShell Tooling for Git
#Install-Module posh-git -Force -Scope CurrentUser
#Install-Module oh-my-posh -Force -Scope CurrentUser
#Set-Prompt
#Install-Module -Name PSReadLine -Scope CurrentUser -Force -SkipPublisherCheck
#Add-Content $PROFILE "`nImport-Module posh-git`nImport-Module oh-my-posh`nSet-PoshPrompt Paradox"

#IIS
#Uncommend if want to set this  
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServer
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-CommonHttpFeatures
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpErrors
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationDevelopment
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-NetFxExtensibility45
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-HealthAndDiagnostics
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpLogging
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-RequestMonitor
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpTracing
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-Security
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-RequestFiltering
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-Performance
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerManagementTools
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementScriptingTools
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-IIS6ManagementCompatibility
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-Metabase
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementConsole
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-StaticContent
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-DefaultDocument
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-DirectoryBrowsing
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebSockets
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-ApplicationInit
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-ASPNET45
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-ASP
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-CGI
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-ISAPIExtensions
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-ISAPIFilter
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-ServerSideIncludes
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-BasicAuthentication
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-HttpCompressionStatic
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementConsole
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-ManagementService
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-WMICompatibility
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-LegacyScripts
#Enable-WindowsOptionalFeature -Online -FeatureName IIS-DigestAuthentication
 

# File and folder options
#Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar


