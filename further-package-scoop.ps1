# NOTE: If not run correctly please use powershell non admin

function Update-Environment-Path
{
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") `
        + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

# Install scoop
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
scoop install ripgrep


pip install --user --upgrade pynvim 
# Install nvim plug
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force

Update-Environment-Path

scoop install msys2 
Update-Environment-Path

scoop install rainmeter flow-launcher obsidian anki winrar sublime-text flux brave vim
scoop install extras/wpsoffice
