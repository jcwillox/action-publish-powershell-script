$path = $env:INPUT_PATH
$name = $env:INPUT_NAME

Write-Host "Path: $path"
Write-Host "Name: $name"

$scriptPath = Join-Path $env:GITHUB_WORKSPACE $path

if ($name) {
    if (-not $name.EndsWith(".ps1")) {
        $name = "${name}.ps1"
    }
    Rename-Item $scriptPath $name
    $path = Join-Path (Split-Path $scriptPath) $name
}

Write-Host "Publishing '$path' to PowerShell Gallery"

if (-not $env:INPUT_NUGET_API_KEY) {
    Write-Host "Error: Missing NuGet API Key"
    exit 1
}

Publish-Script -Path $path -NuGetApiKey $env:INPUT_NUGET_API_KEY

Write-Host "Published to PowerShell Gallery"
