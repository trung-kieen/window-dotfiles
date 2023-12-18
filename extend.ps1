# Run this after main installation when you have free time


# Clean desktop shortcuts 
# Use ulauncher to search for applications instead. 
# Make your desktop more clean 
cd ~\Desktop\
rm *.lnk
cd C:\Users\Public\Desktop\
rm *.lnk


# Nerd font installating will comsume much time
.\utils\nerd_fonts.ps1

.\optional\choco_packages.ps1
.\optional\applications.ps1
.\optional\winget.ps1
.\optional\dev_tool.ps1
.\optional\java.ps1


# Neovim setup 
pip install --user --upgrade pynvim
git clone https://github.com/NvChad/NvChad $HOME\AppData\Local\nvim --depth 1

