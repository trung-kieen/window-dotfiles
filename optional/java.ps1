# Tool for java development ide, build tool, etc
function Update-Environment-Path
{
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") `
        + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}


scoop bucket add java
scoop install   openjdk
scoop install adoptopenjdk
scoop install maven
scoop install gradle
Update-Environment-Path
scoop install  intellijidea-community
