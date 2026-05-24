param(
    [Parameter(Mandatory = $true)]
    [string]$Version,

    [string]$ReleaseDir = "",
    [string]$Repo = "sysliveprime-ctrl/anthology-db"
)

$ErrorActionPreference = "Stop"

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    throw "GitHub CLI 'gh' is not installed or not in PATH."
}

if (-not $ReleaseDir) {
    $ReleaseDir = Join-Path (Split-Path -Parent $PSScriptRoot) "release\$Version"
}

if (-not (Test-Path -LiteralPath $ReleaseDir)) {
    throw "Release asset folder not found: $ReleaseDir"
}

$assets = Get-ChildItem -LiteralPath $ReleaseDir -File
if (-not $assets) {
    throw "No release assets found in: $ReleaseDir"
}

$existing = gh release view $Version --repo $Repo 2>$null
if ($LASTEXITCODE -ne 0) {
    gh release create $Version --repo $Repo --title $Version --notes "Anthology DB manifest release $Version"
}

gh release upload $Version --repo $Repo --clobber @($assets.FullName)
