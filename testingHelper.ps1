function iterate($title) {
    $tomlContent = (Get-Content -Path wally.toml -Raw) -replace "`r`n", "`n"

    Write-Host "Running wally install...";

    $wallyResult = (wally install 2>&1 | Out-String).TrimEnd() -replace "`r`n", "`n";

    # Escape triple backticks so PowerShell doesn't interpret them
    $bt = '```'

    $out = @"


- $title
$($bt)toml
$tomlContent
$bt
*`wally install` results in:*
$($bt)bash
$wallyResult
$bt
"@

    Add-Content -Path README.md -Value $out
}