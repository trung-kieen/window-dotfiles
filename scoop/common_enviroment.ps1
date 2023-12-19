
function Update-Environment-Path
{
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") `
        + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}


function ScoopInstall {
    param (
        [string]$packageName
    )

    # Check if the package is already installed
    if (-not (scoop which $packageName))
    {
        # If not installed, then install the package
        scoop install $packageName
    }
    else
    {
        # If already installed, display a message
        Write-Host "$packageName is already installed."
    }
}


# Install main  develop environment
ScoopInstall python
ScoopInstall msys2  
ScoopInstall clangd
Update-Environment-Path
ScoopInstall gcc 
ScoopInstall gdb
Update-Environment-Path



gsudo npm install --global --production npm-windows-upgrade
gsudo npm-windows-upgrade --npm-version latest

