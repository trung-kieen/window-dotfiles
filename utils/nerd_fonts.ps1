# Font suport icon
git clone https://github.com/ryanoasis/nerd-fonts.git  --depth 1
cd nerd-fonts
.\install.ps1 JetBrainsMono -WindowsCompatibleOnly
cd ..\
Remove-Item -Path "nerd-fonts"  -Recurse -Force
Write-Output 'Be sure to configure Windows Terminal fonts! Suggest using "fontFace": "MesloLGM NF"'

