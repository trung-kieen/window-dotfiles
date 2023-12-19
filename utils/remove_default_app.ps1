function Verify-Elevated {
    # Get the ID and security principal of the current user account
    $myIdentity=[System.Security.Principal.WindowsIdentity]::GetCurrent()
    $myPrincipal=new-object System.Security.Principal.WindowsPrincipal($myIdentity)
    # Check to see if we are currently running "as Administrator"
    return $myPrincipal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)
}
# Use gsudo or this this evaluate for admin access script
if (!(Verify-Elevated)) {
   $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
   $newProcess.Arguments = $myInvocation.MyCommand.Definition;
   $newProcess.Verb = "runas";
   [System.Diagnostics.Process]::Start($newProcess);
   exit
}



function Uninstall-App {
    param (
        [string]$AppName
    )
    # Display message to the user
    Write-Host "Uninstalling app: $AppName"

    # Uninstall the app for current users
    Get-AppxPackage $AppName -AllUsers | Remove-AppxPackage -AllUsers

    # Uninstall the app for new users
    Get-AppXProvisionedPackage -Online | Where-Object DisplayName -eq $AppName | Remove-AppxProvisionedPackage -Online -AllUsers
}

$AppsToUninstall = @("AmazonVideo.PrimeVideo", "*.AutodeskSketchBook" , "Microsoft.BingFinance", "Microsoft.BingNews", "Microsoft.BingSports", "Microsoft.BingWeather", "king.com.BubbleWitch3Saga", "Microsoft.WindowsCommunicationsApps", "king.com.CandyCrushSodaSaga", "Clipchamp.Clipchamp", "Microsoft.549981C3F5F10", "Disney.37853FC22B2CE", "*.DisneyMagicKingdoms", "DolbyLaboratories.DolbyAccess", "Facebook.Facebook*", "Microsoft.MicrosoftOfficeHub", "Facebook.Instagram*", "Microsoft.WindowsMaps", "*.MarchofEmpires", "Microsoft.Messaging", "Microsoft.OneConnect", "Microsoft.Office.OneNote", "Microsoft.Paint", "Microsoft.People", "Microsoft.Windows.Photos", "Microsoft.Print3D", "Microsoft.SkypeApp", "*.SlingTV", "Microsoft.MicrosoftSolitaireCollection", "SpotifyAB.SpotifyMusic", "Microsoft.MicrosoftStickyNotes", "Microsoft.Office.Sway", "*.TikTok", "Microsoft.ToDos", "*.Twitter", "Microsoft.WindowsSoundRecorder", "Microsoft.XboxGamingOverlay", "Microsoft.YourPhone")
# "Microsoft.GamingApp" , "Microsoft.ZuneMusic", "Microsoft.ZuneVideo"
foreach ($App in $AppsToUninstall) {
    Uninstall-App -AppName $App
}



# Uninstall Windows Media Player
Disable-WindowsOptionalFeature -Online -FeatureName "WindowsMediaPlayer" -NoRestart -WarningAction SilentlyContinue | Out-Null




