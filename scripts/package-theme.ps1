$ErrorActionPreference = "Stop"

$themeFiles = @(
    "assets",
    "partials",
    "author.hbs",
    "default.hbs",
    "error.hbs",
    "home.hbs",
    "index.hbs",
    "page.hbs",
    "post.hbs",
    "tag.hbs",
    "package.json",
    "README.md"
)

$zipPath = Join-Path $PSScriptRoot "..\\directory-plus.zip"
$zipPath = [System.IO.Path]::GetFullPath($zipPath)

if (Test-Path $zipPath) {
    Remove-Item $zipPath -Force
}

$resolvedPaths = foreach ($item in $themeFiles) {
    Join-Path $PSScriptRoot "..\\$item"
}

Compress-Archive -Path $resolvedPaths -DestinationPath $zipPath
Write-Host "Theme package created at $zipPath"
