[Feature](#feature) - [Setup](#setup) - [Extension](#extension) - [Acknowledgment](#acknowledgment)


# Feature
<a name="feature"></a>
Setting up a new device using package managers like Scoop, Chocolatey, and Winget. The script primarily installs new software via Scoop, as it does not require Admin permissions for execution.
- Change system privacy settings
- Customize firefox apprearence
- Install code font
- Install common apllication, development tool with package manager
- Setup user profie - $PROFILE 
- Remove some window default apllications: cortana, calendar, mail, bing weather, etc
- Install nerd fonts  (extend)
- Install wsl (extend)
- Setup github ssh (extend)
For [extension](#extension) mark please see detail in file `extend.ps1`.
# Setup
<a name="setup"></a>
To install Chocolatey and Scoop, the PowerShell Execution Policy needs to be set to something more permissive than "Restricted." Bypass the policy with PowerShell as an *administrator*:
```
Set-ExecutionPolicy AllSigned
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
```
Clone and navigate to the repository and run the script. Some action will require administrator.
```
iex main.ps1
```
# Extension 
<a name="extension"></a>
For some extended config like setup github ssh, install wsl, nerd font and other development tool consider look up `extend.ps1`. Not every feature in script are *enable* by default. Comment in and out what you need in this file and run:
```
iex extend.ps1
```
# Acknowledgment
<a name="acknowledgment"></a>
Special thanks to [jayharris](https://github.com/jayharris/dotfiles-windows), [jamestharpe](https://github.com/jamestharpe/windows-development-environment/blob/main/env-windows.ps1) for their great repo.
