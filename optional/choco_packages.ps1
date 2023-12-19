# Install-ChocolateyPackage -packageNameation require powershell or window terminal run as admin
# Some software in here have comment in to advoid duplicate with scoop install in main script 
# But this is an opertunity to run individual software version like have two firefox to use with different user.


function Verify-Elevated {
    # Get the ID and security principal of the current user account
    $myIdentity=[System.Security.Principal.WindowsIdentity]::GetCurrent()
    $myPrincipal=new-object System.Security.Principal.WindowsPrincipal($myIdentity)
    # Check to see if we are currently running "as Administrator"
    return $myPrincipal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)
}
# Use gsudo or this this evaluate for admin access script
if (!(Verify-Elevated)) {
   $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
   $newProcess.Arguments = $myInvocation.MyCommand.Definition;
   $newProcess.Verb = "runas";
   [System.Diagnostics.Process]::Start($newProcess);
   exit
}



function Update-Environment-Path
{
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") `
        + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}


if(-not($ifChocoInstalled)){
    Write-host "Chocolatey is not installed, installation begin now " -ForegroundColor "Green"
    Set-ExecutionPolicy Bypass -Scope Process -Force;
	
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
 
    Update-Environment-Path
 
    }
 
 else{
    Write-host "Chocolatey $ifChocoInstalled is already installed" -ForegroundColor "Green"
}
 
$installedPackages = choco list --local-only --limit-output --id-only
function Install-ChocolateyPackage {
    param(
        [string]$packageName
    )

    # Check if the package is installed
    if ($installedPackages -contains $packageName) {
        Write-Host "$packageName is already installed."
    }
    # Avoid duplicate with scoop pacakge 
    elseif(scoop which $packageName){
        Write-Host "$packageName is already installed."
    }
    else {
        # Install the package
        choco install $packageName -y
        Write-Host "$packageName has been installed."
    }
}

 Install-ChocolateyPackage -packageName nerd-fonts-jetbrainsmono 
 Install-ChocolateyPackage -packageName rust
 Install-ChocolateyPackage -packageName nodejs.install 
 Install-ChocolateyPackage -packageName postman 
 Install-ChocolateyPackage -packageName intellijidea-community 

 Install-ChocolateyPackage -packageName microsoft-windows-terminal 
 Install-ChocolateyPackage -packageName firacode  
 Install-ChocolateyPackage -packageName responsively figma drawio github-desktop powertoys  

 Install-ChocolateyPackage -packageName vscode 

 # Install-ChocolateyPackage -packageName googlechrome 
#  Install-ChocolateyPackage -packageName sysinternals 
#  Install-ChocolateyPackage -packageName procexp 

 # Install-ChocolateyPackage -packageName everything 
# See https://learn.microsoft.com/en-us/windows/powertoys/?WT.mc_id=twitter-0000-docsmsft
 # Install-ChocolateyPackage -packageName gcc 
  # Install-ChocolateyPackage -packageName firefox 
 # Install-ChocolateyPackage -packageName  openjdk  
 # Install-ChocolateyPackage -packageName  gradle   
 # Install-ChocolateyPackage -packageName  maven  

 # Install-ChocolateyPackage -packageName python3 
 # Install-ChocolateyPackage -packageName pip 
 # Install-ChocolateyPackage -packageName adoptopenjdk 
 # Install-ChocolateyPackage -packageName maven 
