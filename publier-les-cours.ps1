param(
  [string]$Message,
  [switch]$PrepareOnly
)

$ErrorActionPreference = "Stop"

$sourceRoot = "C:\Users\kayaw\Nextcloud\Obsidian\CoffreSam\Formations\configuration-maintenance-pc"
$sourceImages = Join-Path $sourceRoot "Ressources\images"
$sourceHtmlAssets = "C:\Users\kayaw\Nextcloud\Obsidian\CoffreSam\cours-html\assets"
$projectRoot = "D:\Projet-git\configuration-maintenance-pc"
$staticRoot = Join-Path $projectRoot "site-content"
$stageRoot = Join-Path $projectRoot ".publication-stage"
$archiveStageRoot = Join-Path $projectRoot ".student-vault-stage"
$archiveStageVault = Join-Path $archiveStageRoot "Configuration-Maintenance-PC"
$archiveDestination = Join-Path $projectRoot "student-vault\Configuration-Maintenance-PC"
$destinationContent = Join-Path $projectRoot "content"
$stageCourses = Join-Path $stageRoot "cours"
$stageAssets = Join-Path $stageRoot "assets"
$stageImages = Join-Path $stageRoot "Ressources\images"
$archiveImages = Join-Path $archiveStageVault "Ressources\images"
$utf8WithoutBom = [Text.UTF8Encoding]::new($false)

$chapterDefinitions = @(
  @{ Slug = "01-role-du-technicien"; Title = "01. Rôle du technicien"; Course = "01-role-du-technicien.md"; Tp = "01-tp-role-technicien.md"; TpTitle = "TP 1 — Support et ticketing" },
  @{ Slug = "02-composants-pc"; Title = "02. Composants du PC"; Course = "02-composants-pc.md"; Tp = "02-tp-composants-pc.md"; TpTitle = "TP 2 — Choisir une configuration" },
  @{ Slug = "03-pc-portables"; Title = "03. Choisir un PC portable"; Course = "03-pc-portables.md"; Tp = $null; TpTitle = $null },
  @{ Slug = "04-bios-demarrage"; Title = "04. BIOS et démarrage"; Course = "04-bios-demarrage.md"; Tp = "04-tp-bios-demarrage.md"; TpTitle = "TP 3 — BIOS, UEFI et démarrage" },
  @{ Slug = "05-stockage"; Title = "05. Stockage et systèmes"; Course = "05-stockage.md"; Tp = "05-tp-stockage.md"; TpTitle = "TP 4 — Stockage et partitionnement" },
  @{ Slug = "06-peripheriques"; Title = "06. Périphériques et réseau"; Course = "06-peripheriques.md"; Tp = "06-tp-peripheriques.md"; TpTitle = "TP 5 — Connectiques et réseau" }
)

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

function Add-PublicMetadata {
  param([string]$Path, [string]$Title, [string[]]$Aliases)
  $content = [IO.File]::ReadAllText($Path)
  $aliasLines = ($Aliases | ForEach-Object { "  - `"$_`"" }) -join "`n"
  $metadata = "title: `"$Title`"`naliases:`n$aliasLines"

  if ($content -match '\A---\r?\n') {
    $frontmatter = [regex]::Match($content, '\A---\r?\n(?<body>.*?)\r?\n---\r?\n', [Text.RegularExpressions.RegexOptions]::Singleline)
    if (-not $frontmatter.Success) { throw "Frontmatter invalide : $Path" }
    $body = $frontmatter.Groups['body'].Value
    if ($body -notmatch '(?m)^title:') { $body += "`n" + ($metadata -split "`n")[0] }
    if ($body -notmatch '(?m)^aliases?:') { $body += "`naliases:`n$aliasLines" }
    $content = "---`n$body`n---`n" + $content.Substring($frontmatter.Length)
  } else {
    $content = "---`n$metadata`n---`n`n$content"
  }
  [IO.File]::WriteAllText($Path, $content, $utf8WithoutBom)
}

function Remove-RetiredChapterLinks {
  param([string]$Html)
  $cleanHtml = [regex]::Replace(
    $Html,
    '<a\b[^>]*href="(?:\.\./)?07-maintenance-diagnostic/07-maintenance-diagnostic-interactif\.html"[^>]*>.*?</a>',
    '',
    [Text.RegularExpressions.RegexOptions]::Singleline
  )
  return [regex]::Replace($cleanHtml, '(?m)^[ \t]+$', '')
}

Write-Host ""
Write-Host "Publication de Configuration et maintenance PC" -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan

Assert-Directory (Join-Path $sourceRoot "cours") "Le dossier des cours"
Assert-Directory $sourceImages "Le dossier central des images"
Assert-Directory $sourceHtmlAssets "Le dossier des ressources HTML"
Assert-Directory $staticRoot "Les pages fixes du site"
Assert-Directory (Join-Path $projectRoot ".git") "Le dépôt Git"

foreach ($chapter in $chapterDefinitions) {
  $sourceChapter = Join-Path $sourceRoot "cours\$($chapter.Slug)"
  Assert-Directory $sourceChapter "Dossier du chapitre $($chapter.Slug)"
  Assert-File (Join-Path $sourceChapter $chapter.Course) "Cours du chapitre $($chapter.Slug)"
  Assert-File (Join-Path $sourceChapter "$($chapter.Slug)-interactif.html") "HTML du chapitre $($chapter.Slug)"
  if ($chapter.Tp) {
    Assert-File (Join-Path $sourceChapter "tp\$($chapter.Tp)") "TP du chapitre $($chapter.Slug)"
  }
}
Assert-File (Join-Path $sourceRoot "cours\parcours-interactif.html") "Parcours HTML"

$quizChapters = @(
  "01-role-du-technicien",
  "02-composants-pc",
  "03-pc-portables",
  "04-bios-demarrage",
  "05-stockage",
  "06-peripheriques"
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
Remove-SafeDirectory $archiveStageRoot
New-Item -ItemType Directory -Path $stageCourses, $stageAssets, (Join-Path $archiveStageVault "cours") -Force | Out-Null
Copy-MirroredDirectory $sourceImages $stageImages
Copy-MirroredDirectory $sourceImages $archiveImages

Write-Host "1/6 - Classement des cours et des TP par chapitre..."
foreach ($chapter in $chapterDefinitions) {
  $chapterRoot = Join-Path $stageRoot $chapter.Slug
  $sourceChapter = Join-Path $sourceRoot "cours\$($chapter.Slug)"
  $archiveChapter = Join-Path $archiveStageVault "cours\$($chapter.Slug)"
  New-Item -ItemType Directory -Path $chapterRoot -Force | Out-Null
  $courseDestination = Join-Path $chapterRoot "index.md"
  New-Item -ItemType Directory -Path $archiveChapter -Force | Out-Null
  Copy-Item -LiteralPath (Join-Path $sourceChapter $chapter.Course) -Destination $courseDestination -Force
  Copy-Item -LiteralPath (Join-Path $sourceChapter $chapter.Course) -Destination (Join-Path $archiveChapter $chapter.Course) -Force
  $archiveHtmlPath = Join-Path $archiveChapter "$($chapter.Slug)-interactif.html"
  $archiveHtml = Remove-RetiredChapterLinks -Html ([IO.File]::ReadAllText((Join-Path $sourceChapter "$($chapter.Slug)-interactif.html")))
  [IO.File]::WriteAllText($archiveHtmlPath, $archiveHtml, $utf8WithoutBom)
  Add-PublicMetadata -Path $courseDestination -Title $chapter.Title -Aliases @("/cours/$($chapter.Slug)")

  if ($chapter.Tp) {
    $tpRoot = Join-Path $chapterRoot "tp"
    $archiveTpRoot = Join-Path $archiveChapter "tp"
    New-Item -ItemType Directory -Path $tpRoot, $archiveTpRoot -Force | Out-Null
    $tpDestination = Join-Path $tpRoot $chapter.Tp
    Copy-Item -LiteralPath (Join-Path $sourceChapter "tp\$($chapter.Tp)") -Destination $tpDestination -Force
    Copy-Item -LiteralPath (Join-Path $sourceChapter "tp\$($chapter.Tp)") -Destination (Join-Path $archiveTpRoot $chapter.Tp) -Force
    Add-PublicMetadata -Path $tpDestination -Title $chapter.TpTitle -Aliases @("/tp/$([IO.Path]::GetFileNameWithoutExtension($chapter.Tp))")

    $tpIndex = @"
---
title: "Exercices pratiques"
---

# Exercices pratiques

- [[$([IO.Path]::GetFileNameWithoutExtension($chapter.Tp))|$($chapter.TpTitle)]]
"@
    [IO.File]::WriteAllText((Join-Path $tpRoot "index.md"), $tpIndex, $utf8WithoutBom)
  }
}

Write-Host "2/6 - Copie des versions HTML et des ressources..."
foreach ($chapter in $chapterDefinitions) {
  $sourceHtml = Join-Path $sourceRoot "cours\$($chapter.Slug)\$($chapter.Slug)-interactif.html"
  $publicHtml = Join-Path $stageCourses "$($chapter.Slug)-interactif.html"
  Copy-Item -LiteralPath $sourceHtml -Destination $publicHtml -Force
  $html = Remove-RetiredChapterLinks -Html ([IO.File]::ReadAllText($publicHtml))
  foreach ($targetChapter in $chapterDefinitions) {
    $html = $html.Replace("../$($targetChapter.Slug)/$($targetChapter.Slug)-interactif.html", "$($targetChapter.Slug)-interactif.html")
  }
  [IO.File]::WriteAllText($publicHtml, $html, $utf8WithoutBom)
}
$sourceParcours = Join-Path $sourceRoot "cours\parcours-interactif.html"
$publicParcours = Join-Path $stageCourses "parcours-interactif.html"
$parcoursHtml = Remove-RetiredChapterLinks -Html ([IO.File]::ReadAllText($sourceParcours))
$parcoursHtml = $parcoursHtml.Replace("Sept chapitres", "Six chapitres")
foreach ($targetChapter in $chapterDefinitions) {
  $parcoursHtml = $parcoursHtml.Replace("$($targetChapter.Slug)/$($targetChapter.Slug)-interactif.html", "$($targetChapter.Slug)-interactif.html")
}
[IO.File]::WriteAllText($publicParcours, $parcoursHtml, $utf8WithoutBom)
[IO.File]::WriteAllText((Join-Path $archiveStageVault "cours\parcours-interactif.html"), (Remove-RetiredChapterLinks -Html ([IO.File]::ReadAllText($sourceParcours))).Replace("Sept chapitres", "Six chapitres"), $utf8WithoutBom)
Copy-MirroredDirectory $sourceHtmlAssets $stageAssets
Copy-MirroredDirectory (Join-Path $staticRoot "assets\quiz") (Join-Path $stageAssets "quiz")
Copy-MirroredDirectory (Join-Path $staticRoot "cours\quiz") (Join-Path $stageCourses "quiz") -ExcludedFiles @("07-maintenance-diagnostic.html")

$staticMappings = @(
  @{ Source = "index.md"; Destination = "index.md" }
)
foreach ($mapping in $staticMappings) {
  $source = Join-Path $staticRoot $mapping.Source
  $destination = Join-Path $stageRoot $mapping.Destination
  Assert-File $source "Page fixe"
  Copy-Item -LiteralPath $source -Destination $destination -Force
}

$imagePattern = '!\[\[([^]|]+\.(?:svg|jpe?g|png|webp|gif))(?:\|[^]]+)?\]\]'
Get-ChildItem -LiteralPath $stageRoot -Recurse -File -Filter "*.md" | ForEach-Object {
  $markdownPath = $_.FullName
  $markdown = [IO.File]::ReadAllText($markdownPath)
  $markdown = [regex]::Replace(
    $markdown,
    $imagePattern,
    {
      param($match)
      $imageName = $match.Groups[1].Value
      "![$imageName](Ressources/images/$imageName)"
    },
    [Text.RegularExpressions.RegexOptions]::IgnoreCase
  )
  $retiredChapterLink = '\[\[Formations/configuration-maintenance-pc/cours/07-maintenance-diagnostic/07-maintenance-diagnostic\.md\]\]'
  $markdown = [regex]::Replace($markdown, "\s+Voir $retiredChapterLink\.", ".")
  $markdown = [regex]::Replace($markdown, "(?m)^[-*]\s+[^\r\n]*$retiredChapterLink\s*\r?\n?", "")
  [IO.File]::WriteAllText($markdownPath, $markdown, $utf8WithoutBom)
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

Write-Host "4/6 - Ajout des liens HTML, quiz et téléchargements..."
foreach ($chapter in $chapterDefinitions) {
  $markdownPath = Join-Path (Join-Path $stageRoot $chapter.Slug) "index.md"
  $original = [IO.File]::ReadAllText($markdownPath)
  $htmlName = $chapter.Slug + "-interactif.html"
  $htmlUrl = "https://kayasam.github.io/configuration-maintenance-pc/cours/$htmlName"
  $quizName = $chapter.Slug + ".html"
  $quizUrl = "https://kayasam.github.io/configuration-maintenance-pc/cours/quiz/$quizName"
  $downloadUrl = "https://kayasam.github.io/configuration-maintenance-pc/telechargements/cours/$($chapter.Course)"
  $quizPath = Join-Path (Join-Path $stageCourses "quiz") $quizName
  if ((Test-Path -LiteralPath (Join-Path $stageCourses $htmlName)) -and (Test-Path -LiteralPath $quizPath)) {
    $block = "`n`n> [!TIP] Ressources du chapitre`n> - [Faire le quiz — 20 questions]($quizUrl)`n> - [Ouvrir la version HTML interactive]($htmlUrl)`n> - <a href=`"$downloadUrl`" download>Télécharger ce cours en Markdown</a>`n"
    $h1 = [regex]::new('(?m)^(#\s+.+)\r?$')
    $updated = $h1.Replace($original, { param($match) $match.Value + $block }, 1)
    [IO.File]::WriteAllText($markdownPath, $updated, $utf8WithoutBom)
  }
}

Get-ChildItem -LiteralPath $stageRoot -Recurse -File -Filter "*.md" | Where-Object {
  $_.Directory.Name -eq "tp" -and $_.Name -ne "index.md"
} | ForEach-Object {
  $original = [IO.File]::ReadAllText($_.FullName)
  $downloadUrl = "https://kayasam.github.io/configuration-maintenance-pc/telechargements/tp/$($_.Name)"
  $block = "`n`n> [!TIP] Ressource du TP`n> - <a href=`"$downloadUrl`" download>Télécharger ce TP en Markdown</a>`n"
  $h1 = [regex]::new('(?m)^(#\s+.+)\r?$')
  $updated = $h1.Replace($original, { param($match) $match.Value + $block }, 1)
  [IO.File]::WriteAllText($_.FullName, $updated, $utf8WithoutBom)
}

Write-Host "5/6 - Synchronisation du contenu public..."
Copy-MirroredDirectory $stageRoot $destinationContent
Copy-MirroredDirectory $archiveStageVault $archiveDestination
Remove-SafeDirectory $stageRoot
Remove-SafeDirectory $archiveStageRoot

Push-Location $projectRoot
try {
  Write-Host "6/6 - Formatage et vérification du build Quartz..."
  & npx prettier content site-content quartz/styles/custom.scss quartz/styles/pc.scss quartz/styles/explorer-pc.scss --write
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
  Remove-SafeDirectory $archiveStageRoot
}
