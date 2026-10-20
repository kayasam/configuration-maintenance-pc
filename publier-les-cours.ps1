param([string]$Message='Mettre a jour la formation PC',[switch]$PrepareOnly)
$ErrorActionPreference='Stop'
if ($PrepareOnly) { & "$PSScriptRoot/construire.ps1"; return }
& "$PSScriptRoot/construire.ps1"
$confirmation=Read-Host 'Publier sur GitHub Pages ? [o/N]'
if ($confirmation -match '^(o|oui|y|yes)$') { & "$PSScriptRoot/publier.ps1" -Push -Message $Message }
else { Write-Host 'Version locale conservee.' }
