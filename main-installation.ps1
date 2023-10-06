# Credit
# https://github.com/jamestharpe/windows-development-environment/blob/main/env-windows.ps1
# https://dev.to/dmehro/automate-development-environment-setup-via-powershell-20pf
# See more function alias https://github.com/felixrieseberg/windows-development-environment/blob/master/Microsoft.PowerShell-profile.ps1


Write-Warning  "Please make sure to install following software by provider website directly as these require userinput/not available on choco library" -ForegroundColor DarkRed
Write-Warning  "Microsoft Visual Studio, MS SQL Server , PostSharp, Gibraltar,Resharper" -ForegroundColor
 
Write-Host "This script will install following packages - chocolatey , GIT , IISFeatures, Notepad++, NodeJS, Postman,
RedisDesktop manager, Postman, Zeplin & Service bus explorer, ... " -ForegroundColor Green
  
 
#function to update system path after installation
 
function Update-Environment-Path
{
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") `
        + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}
 
$ifChocoInstalled = powershell choco -v
 
 
#Choco installation
if(-not($ifChocoInstalled)){
    Write-host "Chocolatey is not installed, installation begin now " -ForegroundColor Green
    Set-ExecutionPolicy Bypass -Scope Process -Force;
	
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
 
    Update-Environment-Path
 
    }
 
 else{
    Write-host "Chocolatey $ifChocoInstalled is already installed" -ForegroundColor Green
}
 

# Scopp installation
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
 irm get.scoop.sh | iex
Update-Environment-Path

scoop install git
# scoop install bucket add extras
scoop bucket add extras


scoop install curl sudo jq git main
Update-Environment-Path


scoop bucket add main
scoop install neovim
scoop install ripgrep curl grep sed less touch lf make
scoop bucket add nerd-fonts
scoop install nerd-fonts/JetBrains-Mono
scoop install main/gdb
scoop install extras/sharex



pip install --user --upgrade pynvim 
# Install nvim plug
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
Write-Host "Neovim plug have installed" -ForegroundColor blue  -BackgroundColor Yellow

Update-Environment-Path

scoop install msys2 
Update-Environment-Path

scoop install rainmeter flow-launcher obsidian anki winrar sublime-text flux brave vim
scoop install extras/wpsoffice
scoop install main/clangd
scoop install zig
scoop install extras/terminal-icons
scoop install main/zoxide

#GIT Installation
 
$ifGITInstalled = powershell git --version
 
if(-not($ifGITInstalled)){
    Write-host "GIT is not installed, installation begin now " -ForegroundColor Green
    Set-ExecutionPolicy Bypass -Scope Process -Force;
    choco install git --yes
  #  choco install gitextensions
     
    Update-Environment-Path
 
    }
 
 else{
    Write-host "$ifGITInstalled is already installed" -ForegroundColor Green
}
 
if(-not($ifGITInstalled)){
    Write-host "GIT is not installed, installation begin now " -ForegroundColor Green
    Set-ExecutionPolicy Bypass -Scope Process -Force;
    choco install git --yes
  #  choco install gitextensions
     
    Update-Environment-Path
 
    }
 
 else{
    Write-host "$ifGITInstalled is already installed" -ForegroundColor Green
}
 
 
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

# Show file extensions
#Set-ItemProperty . HideFileExt "0"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Value 0
# Show hidden files
#Set-ItemProperty . Hidden "1"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Hidden" -Value 1

 choco install tortoisegit --yes

# choco install webdeploy -y
# choco install urlrewrite -y
 
#Jetbrains dotpeek
 
# Dotpeek for .Net development
#choco install dotpeek
 
#Notepad++ installation
 
choco install notepadplusplus.install --yes
Update-Environment-Path
 
# Node
choco install nodejs.install --yes
Update-Environment-Path

# Rust
choco install rust
Update-Environment-Path
 
npm install --global --production npm-windows-upgrade
npm-windows-upgrade --npm-version latest
 

choco install embarcaderodevcpp --yes
choco install postman --yes
choco install redis-desktop-manager --yes
choco install zeplin --yes
choco install python3 --yes
choco install pip --yes

#ServiceBusExplorer
# choco install servicebusexplorer



# Hyper-V required for docker and other things
Enable-WindowsOptionalFeature -Online -FeatureName:Microsoft-Hyper-V -All -NoRestart
#cinst -y Microsoft-Hyper-V-All -source windowsFeatures
#cinst -y Containers -source windowsfeatures



choco install microsoft-windows-terminal --yes
choco install 7zip --yes
choco install googlechrome --yes
choco install firefox --yes
#choco install sysinternals --yes
#choco install procexp --yes
choco install firacode --yes # See https://www.youtube.com/watch?v=KI6m_B1f8jc
choco install everything --yes
# See https://learn.microsoft.com/en-us/windows/powertoys/?WT.mc_id=twitter-0000-docsmsft
choco install responsively figma drawio github-desktop powertoys  --yes



# Setup Oh my posh 
winget install JanDeDobbeleer.OhMyPosh -s winget
Update-Environment-Path
oh-my-posh get shell
echo  "oh-my-posh init pwsh | Invoke-Expression" >> $PROFILE
# Reload profile
. $PROFILE      
oh-my-posh font install --user
Update-Environment-Path

                                                               




choco install gcc --yes
Update-Environment-Path

choco install unikey --yes
winget install -e --id VNGCorp.Zalo
winget install --id Armin2208.WindowsAutoNightMode
winget install -e --id FilesCommunity.Files
winget install Microsoft.PowerShell



#Vscode
choco install vscode --yes

# Vanilla Visual Studio Code isn't very interesting, so let's customize it by installing some common plug-ins. Here's what I install by default

# Pretty icons
code --install-extension robertohuertasm.vscode-icons

# PowerShell
code --install-extension ms-vscode.PowerShell

# HTML, CSS, JS
code --install-extension Zignd.html-css-class-completion
code --install-extension lonefy.vscode-JS-CSS-HTML-formatter
code --install-extension robinbentley.sass-indented
code --install-extension dbaeumer.vscode-eslint
code --install-extension steoates.autoimport

# TypeScript
code --install-extension eg2.tslint
code --install-extension johnpapa.Angular2



 
Update-Environment-Path

Copy-Item -Path .\PROFILE.ps1 -Destination $PROFILE -Force
Copy-Item -Path .\settings.json" -Destination "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Force
. $PROFILE


# Font to support PowerShell Tooling:
git clone https://github.com/ryanoasis/nerd-fonts.git  --depth 1
cd nerd-fonts
.\install.ps1
cd ..\
Write-Output 'Be sure to configure Windows Terminal fonts! Suggest using "fontFace": "MesloLGM NF"'

 
 
Write-Host "Script execution finished , please check output for any error and restart your machine!!!!" -ForegroundColor blue  -BackgroundColor Yellow
Write-Host "Check out install optional pacakges, all scoop packages have already install in this script" -ForegroundColor blue  -BackgroundColor Yellow
Write-Host "Check does unikey work" -ForegroundColor blue  -BackgroundColor Yellow
Write-Host "Check window terminal default, go to setting > default > apparent > Coloscheme: Sonokai Shusia" -ForegroundColor blue  -BackgroundColor Yellow
Write-Host "Change terminal config json with file settings.json in this repo (Update now i have automatic do this)" -ForegroundColor blue  -BackgroundColor Yellow
Write-Host "Further setting for rainsmeter https://github.com/Jax-Core/JaxCore" -ForegroundColor blue  -BackgroundColor Yellow
Write-Host "Change profile from file in this repo with vi $PROFILE (Update now i have automatic do this)" -ForegroundColor blue  -BackgroundColor Yellow
