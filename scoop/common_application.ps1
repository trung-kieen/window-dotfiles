function ScoopInstall {
    param (
        [string]$packageName
    )

    # Check if the package is already installed
    if (-not (scoop which $packageName))
    {
        # If not installed, then install the package
        scoop install $packageName
    }
    else
    {
        # If already installed, display a message
        Write-Host "$packageName is already installed."
    }
}
ScoopInstall flow-launcher 
ScoopInstall extras/terminal-icons  
ScoopInstall obsidian 
ScoopInstall anki 
ScoopInstall winrar 
ScoopInstall sublime-text 
ScoopInstall flux 
ScoopInstall brave 
ScoopInstall extras/sharex 


ScoopInstall everything  
ScoopInstall figma  
ScoopInstall powertoys 
ScoopInstall googlechrome

ScoopInstall lazygit 
ScoopInstall vim 
ScoopInstall vscode


ScoopInstall espanso

espansod.exe install misspell-en
ScoopInstall  roundedtb


