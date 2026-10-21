#Requires -Version 5.1
<#
.SYNOPSIS
    Packages the Fabric IQ plugin as a ZIP for the OpenAI plugin directory (ChatGPT and Codex).

.DESCRIPTION
    Packages only the files the Agent Plugins format needs (plugin.json, mcp.json, skills/, assets/,
    README.md, LICENSE) from plugins/fabriciq into dist/fabriciq-chatgpt.zip, with plugin.json at
    the ZIP root. Claude-only files (.claude-plugin/, .mcp.json, logo.png) are left out.

.PARAMETER AllowTodoClientId
    Builds even if mcp.json still contains the TODO client ID placeholder. Use for local tests only.
#>
[CmdletBinding()]
param(
    [switch]$AllowTodoClientId
)

$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

$repoRoot = Split-Path -Parent $PSScriptRoot
$pluginDir = (Resolve-Path (Join-Path $repoRoot 'plugins\fabriciq')).Path
$distDir = Join-Path $repoRoot 'dist'
$zipPath = Join-Path $distDir 'fabriciq-chatgpt.zip'

$include = @('plugin.json', 'mcp.json', 'skills', 'assets', 'README.md', 'LICENSE')

foreach ($item in $include) {
    if (-not (Test-Path (Join-Path $pluginDir $item))) {
        throw "Missing required item: plugins/fabriciq/$item"
    }
}

foreach ($json in @('plugin.json', 'mcp.json')) {
    try {
        Get-Content (Join-Path $pluginDir $json) -Raw | ConvertFrom-Json | Out-Null
    }
    catch {
        throw "plugins/fabriciq/$json is not valid JSON: $($_.Exception.Message)"
    }
}

if ((Get-Content (Join-Path $pluginDir 'mcp.json') -Raw) -match 'TODO-') {
    if ($AllowTodoClientId) {
        Write-Warning 'mcp.json still contains a TODO client ID. Do not submit this package.'
    }
    else {
        throw 'mcp.json still contains a TODO client ID. Set the ChatGPT Entra app client ID, or pass -AllowTodoClientId for a local test build.'
    }
}

New-Item -ItemType Directory -Path $distDir -Force | Out-Null
if (Test-Path $zipPath) { Remove-Item $zipPath -Force }

$files = foreach ($item in $include) {
    $path = Join-Path $pluginDir $item
    if (Test-Path $path -PathType Container) {
        Get-ChildItem $path -Recurse -File
    }
    else {
        Get-Item $path
    }
}

# Write entries with forward slashes; Compress-Archive on Windows PowerShell 5.1 uses backslashes.
$zip = [System.IO.Compression.ZipFile]::Open($zipPath, [System.IO.Compression.ZipArchiveMode]::Create)
try {
    foreach ($file in $files) {
        $entryName = $file.FullName.Substring($pluginDir.Length + 1).Replace('\', '/')
        [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile(
            $zip, $file.FullName, $entryName, [System.IO.Compression.CompressionLevel]::Optimal) | Out-Null
    }
}
finally {
    $zip.Dispose()
}

Write-Host "Created $zipPath"
