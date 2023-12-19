
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

scoop install atom putty postman  db-visualizer

gsudo choco install tortoisegit --yes
gsudo choco install docker-desktop --yes
gsudo choco install redis-desktop-manager --yes
gsudo choco install zeplin --yes


# choco install eclipse --yes
# choco install visualstudio2019buildtools --yes
