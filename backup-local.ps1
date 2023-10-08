# Define the list of folders to back up from AppData\Local
$foldersToBackup = @(
    "AutoDarkMode",
    "flux",
    "oh-my-posh"
)

# Define the source directory
$sourceDirectory = [System.Environment]::GetFolderPath('LocalApplicationData')

# Define the destination directory
$destinationDirectory = "D:\window-setup\local-file"

# Create the destination directory if it doesn't exist
if (-not (Test-Path -Path $destinationDirectory -PathType Container)) {
    New-Item -Path $destinationDirectory -ItemType Directory -Force
}

# Loop through each folder in the list and copy it to the destination
foreach ($folder in $foldersToBackup) {
    $sourcePath = Join-Path -Path $sourceDirectory -ChildPath $folder
    $destinationPath = Join-Path -Path $destinationDirectory -ChildPath $folder
    
    if (Test-Path -Path $sourcePath -PathType Container) {
        Copy-Item -Path $sourcePath -Destination $destinationPath -Recurse -Force
        Write-Host "Backed up $folder to $destinationPath"
    }
    else {
        Write-Host "Folder $folder not found in $sourceDirectory. Skipped."
    }
}
