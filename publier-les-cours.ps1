param(
  [string]$Message,
  [switch]$PrepareOnly
)

$ErrorActionPreference = "Stop"

$sourceRoot = "C:\Users\kayaw\Nextcloud\Obsidian\CoffreSam\Formations\configuration-maintenance-pc"
$sourceHtmlRoot = "C:\Users\kayaw\Nextcloud\Obsidian\CoffreSam\cours-html\configuration-maintenance-pc"
$sourceHtmlAssets = "C:\Users\kayaw\Nextcloud\Obsidian\CoffreSam\cours-html\assets"
$projectRoot = "D:\Projet-git\configuration-maintenance-pc"
$staticRoot = Join-Path $projectRoot "site-content"
$stageRoot = Join-Path $projectRoot ".publication-stage"
$destinationContent = Join-Path $projectRoot "content"
$stageCourses = Join-Path $stageRoot "cours"
$stageTp = Join-Path $stageRoot "tp"
$stageResources = Join-Path $stageRoot "Ressources"
$stageAssets = Join-Path $stageRoot "assets"
$utf8WithoutBom = [Text.UTF8Encoding]::new($false)

function Assert-Directory {
  param([string]$Path, [string]$Description)
  if (-not (Test-Path -LiteralPath $Path -PathType Container)) {
    throw "$Description introuvable : $Path"
  }
}

function Assert-File {
  param([string]$Path, [string]$Description)
  if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
    throw "$Description introuvable : $Path"
  }
}

function Assert-InProject {
  param([string]$Path)
  $fullPath = [IO.Path]::GetFullPath($Path)
  $fullProject = [IO.Path]::GetFullPath($projectRoot)
  if (-not $fullPath.StartsWith($fullProject + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) {
    throw "Chemin hors du projet refusé : $fullPath"
  }
}

function Remove-SafeDirectory {
  param([string]$Path)
  if (-not (Test-Path -LiteralPath $Path -PathType Container)) { return }
  Assert-InProject -Path $Path
  $resolved = (Resolve-Path -LiteralPath $Path).Path
  if ($resolved -ne [IO.Path]::GetFullPath($Path)) {
    throw "Chemin inattendu refusé : $resolved"
  }
  Remove-Item -LiteralPath $resolved -Recurse -Force
}

function Copy-MirroredDirectory {
  param([string]$Source, [string]$Destination, [string[]]$ExcludedFiles = @())
  Assert-InProject -Path $Destination
  New-Item -ItemType Directory -Path $Destination -Force | Out-Null
  $arguments = @($Source, $Destination, "/MIR", "/R:2", "/W:1", "/NFL", "/NDL", "/NJH", "/NJS", "/NP")
  if ($ExcludedFiles.Count -gt 0) {
    $arguments += "/XF"
    $arguments += $ExcludedFiles
  }
  & robocopy @arguments | Out-Null
  if ($LASTEXITCODE -ge 8) {
    throw "La copie de $Source a échoué avec le code Robocopy $LASTEXITCODE."
  }
}

Write-Host ""
Write-Host "Publication de Configuration et maintenance PC" -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan

Assert-Directory (Join-Path $sourceRoot "cours") "Le dossier des cours"
Assert-Directory (Join-Path $sourceRoot "tp") "Le dossier des TP"
Assert-Directory $sourceHtmlRoot "Le dossier des cours HTML"
Assert-Directory $sourceHtmlAssets "Le dossier des ressources HTML"
Assert-Directory $staticRoot "Les pages fixes du site"
Assert-Directory (Join-Path $projectRoot ".git") "Le dépôt Git"
Assert-File (Join-Path $sourceRoot "Ressources\programme\programme.md") "Le programme Markdown"
Assert-File (Join-Path $sourceRoot "Ressources\programme\configuration-et-maintenance-pc.pdf") "Le programme PDF"

$quizChapters = @(
  "01-role-du-technicien",
  "02-composants-pc",
  "03-pc-portables",
  "04-bios-demarrage",
  "05-stockage",
  "06-peripheriques",
  "07-maintenance-diagnostic"
)
$requiredQuizFiles = @(
  "assets\quiz\quiz.css",
  "assets\quiz\quiz-engine.js",
  "assets\quiz\quiz-banks.js"
)
$requiredQuizFiles += $quizChapters | ForEach-Object { "cours\quiz\$_.html" }
foreach ($relativePath in $requiredQuizFiles) {
  Assert-File (Join-Path $staticRoot $relativePath) "Ressource de quiz obligatoire"
}

Remove-SafeDirectory $stageRoot
New-Item -ItemType Directory -Path $stageCourses, $stageTp, $stageResources, $stageAssets -Force | Out-Null

Write-Host "1/6 - Copie des cours et des TP..."
Copy-MirroredDirectory (Join-Path $sourceRoot "cours") $stageCourses @("*.excalidraw", "*.excalidraw.md")
Copy-MirroredDirectory (Join-Path $sourceRoot "tp") $stageTp @("*.excalidraw", "*.excalidraw.md")

Write-Host "2/6 - Copie des versions HTML et des ressources..."
Get-ChildItem -LiteralPath $sourceHtmlRoot -File -Filter "*.html" | ForEach-Object {
  $destinationName = if ($_.Name -eq "index.html") {
    "parcours-interactif.html"
  } else {
    $_.BaseName + "-interactif.html"
  }
  Copy-Item -LiteralPath $_.FullName -Destination (Join-Path $stageCourses $destinationName) -Force
}

$htmlChapterFiles = @(Get-ChildItem -LiteralPath $sourceHtmlRoot -File -Filter "*.html" | Where-Object { $_.Name -ne "index.html" })
Get-ChildItem -LiteralPath $stageCourses -File -Filter "*.html" | ForEach-Object {
  $htmlPath = $_.FullName
  $html = [IO.File]::ReadAllText($htmlPath)
  foreach ($chapterFile in $htmlChapterFiles) {
    $html = $html.Replace($chapterFile.Name, "$($chapterFile.BaseName)-interactif.html")
  }
  [IO.File]::WriteAllText($htmlPath, $html, $utf8WithoutBom)
}
Copy-MirroredDirectory $sourceHtmlAssets $stageAssets
Copy-MirroredDirectory (Join-Path $staticRoot "assets\quiz") (Join-Path $stageAssets "quiz")
Copy-MirroredDirectory (Join-Path $staticRoot "cours\quiz") (Join-Path $stageCourses "quiz")
Copy-Item -LiteralPath (Join-Path $sourceRoot "Ressources\programme\programme.md") -Destination $stageResources -Force
Copy-Item -LiteralPath (Join-Path $sourceRoot "Ressources\programme\configuration-et-maintenance-pc.pdf") -Destination $stageResources -Force

$staticMappings = @(
  @{ Source = "index.md"; Destination = "index.md" },
  @{ Source = "cours\index.md"; Destination = "cours\index.md" },
  @{ Source = "tp\index.md"; Destination = "tp\index.md" },
  @{ Source = "Ressources\index.md"; Destination = "Ressources\index.md" }
)
foreach ($mapping in $staticMappings) {
  $source = Join-Path $staticRoot $mapping.Source
  $destination = Join-Path $stageRoot $mapping.Destination
  Assert-File $source "Page fixe"
  Copy-Item -LiteralPath $source -Destination $destination -Force
}

Write-Host "3/6 - Masquage des documents privés..."
$hiddenDocuments = 0
Get-ChildItem -LiteralPath $stageRoot -Recurse -File -Filter "*.md" | ForEach-Object {
  $document = [IO.File]::ReadAllText($_.FullName)
  $isCorrection = $_.Name -like "*correction*.md"
  $isPublic = $document -match '(?m)^publier:\s*true\s*$'
  $isPrivate = $document -match '(?m)^publier:\s*false\s*$'
  if ($isPrivate -or ($isCorrection -and -not $isPublic)) {
    [IO.File]::Delete($_.FullName)
    $hiddenDocuments++
  }
}
Write-Host "$hiddenDocuments document(s) conservé(s) uniquement dans le coffre."

Write-Host "4/6 - Ajout des liens HTML et des téléchargements..."
Get-ChildItem -LiteralPath $stageCourses -File -Filter "*.md" | Where-Object { $_.Name -ne "index.md" } | ForEach-Object {
  $original = [IO.File]::ReadAllText($_.FullName)
  $htmlName = $_.BaseName + "-interactif.html"
  $htmlUrl = "https://kayasam.github.io/configuration-maintenance-pc/cours/$htmlName"
  $quizName = $_.BaseName + ".html"
  $quizUrl = "https://kayasam.github.io/configuration-maintenance-pc/cours/quiz/$quizName"
  $downloadUrl = "https://kayasam.github.io/configuration-maintenance-pc/telechargements/cours/$($_.Name)"
  $quizPath = Join-Path (Join-Path $stageCourses "quiz") $quizName
  if ((Test-Path -LiteralPath (Join-Path $stageCourses $htmlName)) -and (Test-Path -LiteralPath $quizPath)) {
    $block = "`n`n> [!TIP] Ressources du chapitre`n> - [Faire le quiz — 20 questions]($quizUrl)`n> - [Ouvrir la version HTML interactive]($htmlUrl)`n> - <a href=`"$downloadUrl`" download>Télécharger ce cours en Markdown</a>`n"
    $h1 = [regex]::new('(?m)^(#\s+.+)\r?$')
    $updated = $h1.Replace($original, { param($match) $match.Value + $block }, 1)
    [IO.File]::WriteAllText($_.FullName, $updated, $utf8WithoutBom)
  }
}

Get-ChildItem -LiteralPath $stageTp -File -Filter "*.md" | Where-Object { $_.Name -ne "index.md" } | ForEach-Object {
  $original = [IO.File]::ReadAllText($_.FullName)
  $downloadUrl = "https://kayasam.github.io/configuration-maintenance-pc/telechargements/tp/$($_.Name)"
  $block = "`n`n> [!TIP] Ressource du TP`n> - <a href=`"$downloadUrl`" download>Télécharger ce TP en Markdown</a>`n"
  $h1 = [regex]::new('(?m)^(#\s+.+)\r?$')
  $updated = $h1.Replace($original, { param($match) $match.Value + $block }, 1)
  [IO.File]::WriteAllText($_.FullName, $updated, $utf8WithoutBom)
}

Write-Host "5/6 - Synchronisation du contenu public..."
Copy-MirroredDirectory $stageRoot $destinationContent
Remove-SafeDirectory $stageRoot

Push-Location $projectRoot
try {
  Write-Host "6/6 - Formatage et vérification du build Quartz..."
  & npx prettier content site-content quartz/styles/custom.scss quartz/styles/pc.scss --write
  if ($LASTEXITCODE -ne 0) { throw "Le formatage a échoué." }
  & npx quartz build
  if ($LASTEXITCODE -ne 0) { throw "Le build Quartz a échoué. Aucun commit n'a été créé." }

  if ($PrepareOnly) {
    Write-Host ""
    Write-Host "Préparation et build terminés sans commit ni envoi Git." -ForegroundColor Green
    exit 0
  }

  $changes = @(& git status --porcelain)
  if ($changes.Count -eq 0) {
    Write-Host "Aucune modification à publier." -ForegroundColor Yellow
    exit 0
  }

  & git status --short
  if ([string]::IsNullOrWhiteSpace($Message)) {
    $Message = Read-Host "Message de publication (Entrée pour le message proposé)"
  }
  if ([string]::IsNullOrWhiteSpace($Message)) {
    $Message = "Mise à jour de la formation PC - $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
  }

  $confirmation = Read-Host "Publier maintenant sur GitHub ? [o/N]"
  if ($confirmation -notmatch '^(o|oui|y|yes)$') {
    Write-Host "Publication annulée. Les fichiers préparés restent disponibles localement." -ForegroundColor Yellow
    exit 0
  }

  & git add -A
  if ($LASTEXITCODE -ne 0) { throw "Impossible de préparer les fichiers Git." }
  & git commit -m $Message
  if ($LASTEXITCODE -ne 0) { throw "La création du commit a échoué." }
  & git push -u origin main
  if ($LASTEXITCODE -ne 0) { throw "L'envoi vers GitHub a échoué." }

  Write-Host "Publication envoyée. GitHub Pages sera actualisé dans quelques minutes." -ForegroundColor Green
  Write-Host "https://kayasam.github.io/configuration-maintenance-pc/"
}
finally {
  Pop-Location
  Remove-SafeDirectory $stageRoot
}
