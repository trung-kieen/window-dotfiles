# system path after installation
function Update-Environment-Path
{
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") `
        + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}


############################################
########## Development environment #########
############################################
scoop bucket add java
scoop install   openjdk
scoop install adoptopenjdk
scoop install maven
scoop install gradle
Update-Environment-Path
scoop install  intellijidea-community
