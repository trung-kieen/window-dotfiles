# Credit
# https://github.com/jamestharpe/windows-development-environment/blob/main/env-windows.ps1
# https://dev.to/dmehro/automate-development-environment-setup-via-powershell-20pf
# See more function alias https://github.com/felixrieseberg/windows-development-environment/blob/master/Microsoft.PowerShell-profile.ps1


Write-Warning  "Please make sure to install following software by provider website directly as these require userinput/not available on choco library" -ForegroundColor DarkRed
# Write-Warning  "Microsoft Visual Studio, MS SQL Server , PostSharp, Gibraltar,Resharper" -ForegroundColor
 
# Write-Host "This script will install following packages - chocolatey , GIT , IISFeatures, Notepad++, NodeJS, Postman,
# RedisDesktop manager, Postman, Zeplin & Service bus explorer, ... " -ForegroundColor Green
  
 
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
 
$ifScoopInstalled = powershell scoop -v
if(-not($ifScoopInstalled)){
    # Scopp installation
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
    irm get.scoop.sh | iex
    Update-Environment-Path
}
 


scoop install  git

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
 


# Install essential with scoop 
scoop bucket add extras
scoop bucket add main
scoop bucket add java
scoop bucket add versions
scoop install  curl sudo jq main
scoop install  firefox 
Update-Environment-Path


# Install for all user 

# Essential browser
sudo scoop install   7zip git openssh --global



scoop install   aria2 curl grep sed less touch neovim sudo  lf  make  ripgrep 

# Install main  develop environment
scoop   install -y  python 
scoop install  main/gdb
Update-Environment-Path

pip install --user --upgrade pynvim 


Update-Environment-Path

scoop install  msys2  main/clangd
Update-Environment-Path



# Essential application 
scoop install flow-launcher obsidian anki winrar sublime-text flux brave vim extras/sharex vscode
scoop install extras/terminal-icons

############################################
########## Development environment #########
############################################

# For java development
scoop bucket add java
scoop install   openjdk
scoop install adoptopenjdk
scoop install maven
scoop install gradle
Update-Environment-Path
scoop install  intellijidea-community

scoop install python
Update-Environment-Path

scoop install gcc gdb 
Update-Environment-Path



############################################
###### Theming, Extra application  #########
############################################


# Extra install for more feature about theming 
scoop bucket add nerd-fonts
scoop install  nerd-fonts/JetBrains-Mono
scoop install  Cascadia-Code 
scoop install  lazygit 

scoop install everything  figma  powertoys googlechrome 





############################################
###### Theming, Extra application  #########
############################################

# Show file extensions
#Set-ItemProperty . HideFileExt "0"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Value 0
# Show hidden files
#Set-ItemProperty . Hidden "1"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Hidden" -Value 1



############################################
###### Extra development environment #######
############################################

# Rust
Update-Environment-Path
 
Update-Environment-Path

npm install --global --production npm-windows-upgrade
npm-windows-upgrade --npm-version latest
 





# Hyper-V required for docker and other things
Enable-WindowsOptionalFeature -Online -FeatureName:Microsoft-Hyper-V -All -NoRestart
#cinst -y Microsoft-Hyper-V-All -source windowsFeatures
#cinst -y Containers -source windowsfeatures







                                                               




Update-Environment-Path

winget install -e --id VNGCorp.Zalo
winget install --id Armin2208.WindowsAutoNightMode
winget install -e --id FilesCommunity.Files
winget install Microsoft.PowerShell



#Vscode

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




# Set window wallpaper
# Define constants for the SystemParametersInfo function
# Set the path to your wallpaper image
$wallpaperPath = "D:\window-setup\wallpaper.png"
# Update the wallpaper registry settings
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name Wallpaper -Value $wallpaperPath
# Refresh the desktop to apply the changes
Invoke-Expression -Command "RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters ,1 ,True"
# Optionally, set the wallpaper style (0 = Tiled, 2 = Centered, 6 = Stretched)
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name WallpaperStyle -Value 2
# Set the wallpaper to change immediately
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name TileWallpaper -Value 0


 
Update-Environment-Path

Copy-Item -Path .\PROFILE.ps1 -Destination $PROFILE -Force
Copy-Item -Path .\settings.json -Destination "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Force
. $PROFILE

.\setup-config-file.ps1
.\git-setup.bat

 
Write-Host "Script execution finished , please check output for any error and restart your machine!!!!" -ForegroundColor blue  -BackgroundColor Yellow
Write-Host "Check out install optional pacakges, all scoop packages have already install in this script" -ForegroundColor blue  -BackgroundColor Yellow
Write-Host "Check does unikey work" -ForegroundColor blue  -BackgroundColor Yellow
Write-Host "Check window terminal default, go to setting > default > apparent > Coloscheme: Sonokai Shusia" -ForegroundColor blue  -BackgroundColor Yellow
Write-Host "Change terminal config json with file settings.json in this repo (Update now i have automatic do this)" -ForegroundColor blue  -BackgroundColor Yellow
Write-Host "Further setting for rainsmeter https://github.com/Jax-Core/JaxCore" -ForegroundColor blue  -BackgroundColor Yellow
Write-Host "Change profile from file in this repo with vim $PROFILE (Update now i have automatic do this)" -ForegroundColor blue  -BackgroundColor Yellow
Write-Host "Change lock screen: W-i => persionalization => change lock screen" -ForegroundColor blue  -BackgroundColor Yellow


# Install nvchard 
git clone https://github.com/NvChad/NvChad $HOME\AppData\Local\nvim --depth 1 


# Clean desktop shortcuts
cd ~\Desktop\
rm *.lnk
cd C:\Users\Public\Desktop\
rm *.lnk
