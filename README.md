# Require

-   Move this folder to D:\window-setup.
-   Check out update.
-   Then open powershell with admin.
-   Install choco with this command.

Scoop by pass policy

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

Scoop require for policy

```
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

Use file explore to navigate to window-setup folder. Type powershell in address and run:

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
iex main.ps1
```

Some of package are not available in scoop need to install via choco but choco require powershell, terminal with admin permission.

```
.\choco-package.ps1
```

There are other heavy packages in `optional-package.ps1`.
Consider to reuse other packages list:
[link 1](https://gist.github.com/jetstreamin/d59be158acb494bf0dbe2591c9385274)
[link 2](https://github.com/berkanuslu/choco-development-enviroment-setup/blob/main/setup_development_environment.ps1)

# Futher setup

After install window plz go to msconfig and change RAM usage.

# Usefull tool in this installation

-   Use lfcd to navigation file

# Setup user setting further

Window settings directory

```
cd  $env:USERPROFILE\AppData\Local
```

# Setup further packages with script

Open terminal with admin

```
.\after-installtation.ps1
```

# Credit

# https://github.com/jamestharpe/windows-development-environment/blob/main/env-windows.ps1

# https://dev.to/dmehro/automate-development-environment-setup-via-powershell-20pf

See more function alias https://github.com/felixrieseberg/windows-development-environment/blob/master/Microsoft.PowerShell-profile.ps1

https://github.com/jayharris/dotfiles-windows
