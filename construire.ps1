$ErrorActionPreference = 'Stop'
$previousUtf8 = $env:PYTHONUTF8
$env:PYTHONUTF8 = '1'
Push-Location $PSScriptRoot
try {
  & python scripts/import-pc.py
  if ($LASTEXITCODE) { throw 'Import PC echoue.' }
  & python scripts/prepare-site.py
  if ($LASTEXITCODE) { throw 'Préparation échouée.' }
  & python scripts/pc-compatibility.py
  if ($LASTEXITCODE) { throw 'Compatibilite des anciennes adresses echouee.' }
  & node quartz/bootstrap-cli.mjs build
  if ($LASTEXITCODE) { throw 'Construction Quartz échouée.' }
  & python scripts/check-site.py
  if ($LASTEXITCODE) { throw 'Vérifications échouées.' }
} finally { Pop-Location; $env:PYTHONUTF8 = $previousUtf8 }
