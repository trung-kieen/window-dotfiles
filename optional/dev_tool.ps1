
function Update-Environment-Path
{
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") `
        + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}
# Install additional development environment
scoop install ruby go perl zig
scoop install main/php
scoop install extras/xampp
Update-Environment-Path

choco install docker-desktop --yes
scoop install atom putty postman  db-visualizer
sudo choco install tortoisegit --yes


sudo choco install redis-desktop-manager --yes
sudo choco install zeplin --yes


# choco install eclipse --yes
# choco install visualstudio2019buildtools --yes
