# Define the source directory
$sourceLocalDir= "D:\window-setup\local-file"
$sourceRoamingDir= "D:\window-setup\roaming-file"

# Define the destination directory
$destLocalDir= [System.Environment]::GetFolderPath('LocalApplicationData')
$destRoamingDir= [System.Environment]::GetFolderPath('ApplicationData')

# Check if the source directory exists
if (Test-Path -Path $sourceLocalDir -PathType Container) {
    # Loop through the files in the source directory
    $files = Get-ChildItem -Path $sourceLocalDir -File
    foreach ($file in $files) {
        $destLocalDir= Join-Path -Path $destLocalDir -ChildPath $file.Name
        Copy-Item -Path $file.FullName -Destination $destLocalDir -Force
        Write-Host "Copied $($file.Name) to $($destLocalDir)"
    }
}
else {
    Write-Host "Source directory $sourceLocalDir not found. Setup skipped."
}


if (Test-Path -Path $sourceRoamingDir -PathType Container) {
    # Loop through the files in the source directory
    $files = Get-ChildItem -Path $sourceRoamingDir -File
    foreach ($file in $files) {
        $destRoamingDir= Join-Path -Path $destRoamingDir -ChildPath $file.Name
        Copy-Item -Path $file.FullName -Destination $destRoamingDir -Force
        Write-Host "Copied $($file.Name) to $($destRoamingDir)"
    }
}
else {
    Write-Host "Source directory $sourceRoamingDir not found. Setup skipped."
}

