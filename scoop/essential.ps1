
function Update-Environment-Path
{
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") `
        + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}
# Install essential with scoop
scoop bucket add extras
scoop bucket add main
scoop bucket add java
scoop bucket add versions
scoop install  curl sudo jq main
scoop install  firefox
Update-Environment-Path

sudo scoop install   7zip git openssh --global
scoop install   aria2 curl grep sed less touch neovim sudo  lf  make  ripgrep
