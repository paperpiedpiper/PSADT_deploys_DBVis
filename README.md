### One of the deployment payload scripts I made in PSADT for Powershell

#### This repository is to be downloaded, packaged as an .intunewin type of archive
  - To be posted with the following commands:
INSTALL:
PowerShell.exe -ExecutionPolicy Bypass -File Deploy-Application.ps1 -DeploymentType Install

UNINSTALL:
PowerShell.exe -ExecutionPolicy Bypass -File Deploy-Application.ps1 -DeploymentType Uninstall

# ==========================================================================

As per the app owner's ticket, this install wrapper also does:
- Start folder cleanup
- Sets the app to never update automatically .. does this for all users using ActiveSetup mechanism (that runs another .ps1 on profile login)
