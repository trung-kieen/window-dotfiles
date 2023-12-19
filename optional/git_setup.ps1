# Base on https://aaneloy.github.io/Github-SSH-windows-11/
$userName = "kien"
$email = "trungkiennk4869@gmail.com"
$currentPath = Get-Location
$sshFilePath = "$env:USERPROFILE\.ssh\id_ed25519"
$sshDirectoryPath = "$env:USERPROFILE\.ssh"

git config --global user.name $userName
git config --global user.email $email

# Create folder 
New-Item -ItemType Directory -Path $sshDirectoryPath -Force | Out-Null

# Create key 
cd $sshDirectoryPath
ssh-keygen -t ed25519 -C $email
eval "$(ssh-agent -s)"
ssh-add $sshFilePath


# Setup key connect with github
$fileContent = Get-Content -Path $sshFilePath -Raw
Write-Host "The SSH key has been copied to the clipboard."
Write-Host "----------------- SSH key ------------------"
Write-Host $fileContent
Set-Clipboard -Value $fileContent
Write-Host "--------------------------------------------"
Write-Host "Access site https://github.com/settings/keys"
Write-Host "Put this to git ssh github setting  and then press enter to continue"
cd $currentPath
Read-Host

