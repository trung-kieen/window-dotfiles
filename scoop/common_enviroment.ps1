
function Update-Environment-Path
{
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") `
        + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}
# Install main  develop environment
scoop   install   python
scoop install  main/gdb
scoop install  msys2  main/clangd
Update-Environment-Path
scoop install gcc gdb
Update-Environment-Path



npm install --global --production npm-windows-upgrade
npm-windows-upgrade --npm-version latest

