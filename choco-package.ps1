#Choco installation require powershell or window terminal run as admin
# Some software in here have comment in to advoid duplicate with scoop install in main script 
# But this is an opertunity to run individual software version like have two firefox to use with different user.

function Update-Environment-Path
{
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") `
        + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}


if(-not($ifChocoInstalled)){
    Write-host "Chocolatey is not installed, installation begin now " -ForegroundColor Green
    Set-ExecutionPolicy Bypass -Scope Process -Force;
	
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
 
    Update-Environment-Path
 
    }
 
 else{
    Write-host "Chocolatey $ifChocoInstalled is already installed" -ForegroundColor Green
}
 
 # choco install firefox --yes
 # choco install  openjdk --yes 
 # choco install  gradle  --yes 
 # choco install  maven --yes 
 choco install nerd-fonts-jetbrainsmono --yes
 choco install rust
 choco install nodejs.install --yes
 choco install postman --yes
 # choco install python3 --yes
 # choco install pip --yes
 # choco install adoptopenjdk --yes
 # choco install maven --yes
 choco install intellijidea-community --yes

 choco install microsoft-windows-terminal --yes
 # choco install googlechrome --yes
#  choco install sysinternals --yes
#  choco install procexp --yes
 choco install firacode --yes # See https://www.youtube.com/watch?v=KI6m_B1f8jc
 # choco install everything --yes
# See https://learn.microsoft.com/en-us/windows/powertoys/?WT.mc_id=twitter-0000-docsmsft
 choco install responsively figma drawio github-desktop powertoys  --yes

 # choco install gcc --yes
 choco install unikey --yes
 choco install vscode --yes
