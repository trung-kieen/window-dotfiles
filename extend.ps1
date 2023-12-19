# Run this after `main.ps1` file when you have free time 
# Not all everything in this is common use even me so take a look and comment which thing you don't want





.\optional\choco_packages.ps1
.\optional\applications.ps1
.\optional\winget.ps1
.\optional\dev_tool.ps1
.\optional\java.ps1



# Install all font install this repo will spend a lot of time
# User can go to this file and choose to install specific font 
# .\utils\nerd_fonts.ps1


# .\optional\git_setup.ps1
# .\optional\wsl.ps1

# Neovim setup 
pip install --user --upgrade pynvim
git clone https://github.com/NvChad/NvChad $HOME\AppData\Local\nvim --depth 1
