# Feature
Automate proccess setup new device with package manager like scoop, choco and winget.
Script primary install new software via scoop because it don't  need Admin permition for this job.
# Setup
To install choco and scoop we need to set the PowerShell Execution Policy to something more permissive than "Restricted."
By pass policy with powershell as admin
```
Set-ExecutionPolicy AllSigned
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
```
Install Chocolatey in Admin
```
iwr -useb chocolatey.org/install.ps1 | iex
```
Install Scoop no Admin necessary however must ExecutionPolicy in admin before
```
iwr -useb get.scoop.sh | iex
```

Navigate to repo and run script
```
iex main.ps1
```


# Acknowledgment
Thanks to [jayharris](https://github.com/jayharris/dotfiles-windows), [jamestharpe](https://github.com/jamestharpe/windows-development-environment/blob/main/env-windows.ps1).
