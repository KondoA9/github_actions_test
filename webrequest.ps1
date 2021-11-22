function GetInstaller {  
    Invoke-WebRequest "https://marketplace.visualstudio.com/_apis/public/gallery/publishers/VisualStudioClient/vsextensions/MicrosoftVisualStudio2022InstallerProjects/0.1.0/vspackage" -OutFile "VSInstallerProjSetup.vsix"   
}

for ($i=0; $i -lt 10; $i++){
    GetInstaller

    if (Test-Path "VSInstallerProjSetup.vsix") {
        exit 0
    } elseif ($i -eq 9) {
        Write-Output "Failed to get installer"
        exit 1
    }

    Start-Sleep 3
}