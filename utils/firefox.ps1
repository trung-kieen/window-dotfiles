# Install firefox cascade theme 
git clone https://github.com/andreasgrafen/cascade

$firefoxProfilePath = Join-Path $env:APPDATA 'Mozilla\Firefox\Profiles\*.default-release'

$matchingProfiles = Get-Item -Path $firefoxProfilePath

# Loop over each matching profile maybe user can use more than one profile 
foreach ($profile in $matchingProfiles) {
    $profilePath = $profile.FullName
    $destinationPath = Join-Path $profilePath 'chrome'
    
    Copy-Item -Path .\cascade\chrome -Destination $destinationPath -Recurse -Force
}

# Remove the 'cascade' repository
Remove-Item -Path .\cascade -Recurse -Force
