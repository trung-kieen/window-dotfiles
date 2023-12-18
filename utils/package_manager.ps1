
# system path after installation
function Update-Environment-Path
{
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") `
        + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

$ifChocoInstalled = powershell choco -v
#Choco installation
if(-not($ifChocoInstalled)){
    Write-host "Chocolatey is not installed, installation begin now " -ForegroundColor "Green"
        Set-ExecutionPolicy Bypass -Scope Process -Force;

    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
        Update-Environment-Path
}
else{
    Write-host "Chocolatey $ifChocoInstalled is already installed" -ForegroundColor "Green"
}

$ifScoopInstalled = powershell scoop -v
if(-not($ifScoopInstalled)){
# Scopp installation
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
        irm get.scoop.sh | iex
        Update-Environment-Path
}




$ifGITInstalled = powershell git --version

if(-not($ifGITInstalled)){
    Write-host "Git is not installed, installation begin now " -ForegroundColor "Green"
        Set-ExecutionPolicy Bypass -Scope Process -Force;

    choco install git --yes
        scoop install  git

        Update-Environment-Path

}

else{
    Write-host "$ifGITInstalled is already installed" -ForegroundColor "Green"
}
