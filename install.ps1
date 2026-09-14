[CmdletBinding()]
param(
    [string]$Destination
)

$ErrorActionPreference = "Stop"
$RepositoryRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$SkillFile = Join-Path $RepositoryRoot "SKILL.md"
$ReferencesDirectory = Join-Path $RepositoryRoot "references"

if ([string]::IsNullOrWhiteSpace($Destination)) {
    if ([string]::IsNullOrWhiteSpace($env:CODEX_SKILL_DIR)) {
        $Destination = Join-Path $env:USERPROFILE ".agents\skills\dji-cloud-api"
    } else {
        $Destination = $env:CODEX_SKILL_DIR
    }
}

if (-not (Test-Path -LiteralPath $SkillFile -PathType Leaf)) {
    throw "SKILL.md was not found in $RepositoryRoot"
}
if (-not (Test-Path -LiteralPath (Join-Path $ReferencesDirectory "INDEX.md") -PathType Leaf)) {
    throw "references/INDEX.md was not found in $RepositoryRoot"
}

New-Item -ItemType Directory -Path $Destination -Force | Out-Null
$DestinationReferences = Join-Path $Destination "references"
New-Item -ItemType Directory -Path $DestinationReferences -Force | Out-Null
Copy-Item -LiteralPath $SkillFile -Destination (Join-Path $Destination "SKILL.md") -Force
Copy-Item -Path (Join-Path $ReferencesDirectory "*") -Destination $DestinationReferences -Recurse -Force

Write-Host "Installed dji-cloud-api skill to $Destination"
