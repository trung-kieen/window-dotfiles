
$picturePath = "D:\Pictures"
$devPath= "D:\.dev"
if (-not (Test-Path $picturePath -PathType Container)) {
  git clone git@github.com:trung-kieen/Pictures.git $picturePath
}
if (-not (Test-Path $devPath -PathType Container)) {
  git clone git@github.com:trung-kieen/.dev.git $devPath
}
