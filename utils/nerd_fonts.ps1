# Font suport icon
git clone https://github.com/ryanoasis/nerd-fonts.git  --depth 1
cd nerd-fonts

# Install specific font
# .\install.ps1 JetBrainsMono -WindowsCompatibleOnly

# Install all fonts
.\install.ps1 
cd ..\
Remove-Item -Path "nerd-fonts"  -Recurse -Force
Write-Output 'Be sure to configure Windows Terminal fonts! Suggest using "fontFace": "MesloLGM NF"'

