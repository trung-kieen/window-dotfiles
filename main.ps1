
function Update-Environment-Path
{
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") `
        + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}
Write-Warning  "Please make sure to install following software by provider website directly as these require userinput/not available on choco library" -ForegroundColor DarkRed


.\utils\package_manager.ps1
.\utils\essential.ps1
.\scoop\common_enviroment.ps1
.\scoop\common_application.ps1
.\utils\settings.ps1
.\utils\theming.ps1
.\utils\vscode_extension.ps1
.\utils\remove_default_app.ps1
.\utils\privacy.ps1
.\utils\user_profile.ps1




