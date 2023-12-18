
# Common code fonts
scoop bucket add nerd-fonts
scoop install  nerd-fonts/JetBrains-Mono
scoop install  Cascadia-Code


# Set window wallpaper
# Define constants for the SystemParametersInfo function
# Set the path to your wallpaper image
$wallpaperPath = "..\resource\wallpaper.png"
# Update the wallpaper registry settings
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name Wallpaper -Value $wallpaperPath
# Refresh the desktop to apply the changes
Invoke-Expression -Command "RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters ,1 ,True"
# Optionally, set the wallpaper style (0 = Tiled, 2 = Centered, 6 = Stretched)
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name WallpaperStyle -Value 2
# Set the wallpaper to change immediately
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name TileWallpaper -Value 0


# Set lock screen
Set-ItemProperty "HKLM:\Software\Policies\Microsoft\Windows\Personalization" "LockScreenImage" "..\resource\lockscreen.png"

