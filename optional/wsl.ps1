# Wsl installtion proccess require:
# + Window update for .NET Environment 3.5 
# + Enable Intel virtualization technology in BIOS setttings
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
dism.exe /online /enable-feature /featurename:Microsoft-Window-Subsystem-Linux /all /norestart
# Restart ? Sorry i not sure it require restart to apply change or not 
# If you can not open wsl restart and try to run this script again
wsl --install
wsl install -d Ubuntu
