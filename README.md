Move this folder to D:\window-setup.
Check out update.
Then open powershell with admin.
Install choco with this command.


```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```




Run this main script:

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;

iex "D:\window-setup\main-installation.ps1"

```
There are other heavy packages in optional-package.ps1.
Consider to reuse other packages list 
https://gist.github.com/jetstreamin/d59be158acb494bf0dbe2591c9385274
https://github.com/berkanuslu/choco-development-enviroment-setup/blob/main/setup_development_environment.ps1

After install window plz go to msconfig and change RAM usage.

# Usefull tool in this installation 
- Use lfcd to navigation file
