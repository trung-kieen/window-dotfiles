# Setup firefox theme cascade
.\utils\firefox.ps1

# Common code fonts
scoop bucket add nerd-fonts
scoop install  nerd-fonts/JetBrains-Mono
scoop install  Cascadia-Code


# Set window wallpaper
# Define constants for the SystemParametersInfo function
# Set the path to your wallpaper image
$scriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Definition
$wallpaperPath =  "$scriptDirectory\../resource/wallpaper.png"


# Update the wallpaper registry settings
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name Wallpaper -Value $wallpaperPath
# Refresh the desktop to apply the changes
Invoke-Expression -Command "RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters ,1 ,True"
# Optionally, set the wallpaper style (0 = Tiled, 2 = Centered, 6 = Stretched)
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name WallpaperStyle -Value 2
# Set the wallpaper to change immediately
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name TileWallpaper -Value 0



$personalizationPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" 
$imgLockScreen = "..\resource\lockscreen.png"

# Check if the registry key exists
if (Test-Path $personalizationPath) {
    # Set LockScreenImage property
    Set-ItemProperty -Path $personalizationPath -Name LockScreenImage -Value $imgLockScreen
    
    # Set NoLockScreenChange property
    New-ItemProperty -Path $personalizationPath -Name 'NoLockScreenChange' -Value 1 -PropertyType DWord

    Write-Host "Lock screen is set successfully."
} else {
    Write-Host "Registry key not found. Can not set lock screen."
}


# Clean desktop shortcuts 
# Use ulauncher to search for applications instead. 
# Make your desktop more clean for creative
Remove-Item "$env:USERPROFILE\Desktop\*.lnk"
Remove-Item "C:\Users\Public\Desktop\*.lnk"

