# Setup user profile
Copy-Item -Path .\resource\PROFILE.ps1 -Destination $PROFILE -Force
Copy-Item -Path .\resource\settings.json -Destination "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Force
# Active user profile restart terminal to apply change
. $PROFILE

