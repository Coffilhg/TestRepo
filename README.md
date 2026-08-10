# Hello World!

Running `wally install` with...

- *No `wally.toml` file*
```bash
failed to open file `.\wally.toml`

Caused by:
    The system cannot find the file specified. (os error 2)
```

- *Empty `wally.toml` file*
```bash
wally install
failed to parse manifest at path .\wally.toml

Caused by:
    missing field `package`
```

# Before you continue

run ``notepad $PROFILE`` in PowerShell and paste the following:

---

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

---

save the file and restart PowerShell or run `. $PROFILE`

# continue...

- Attempt #3
```toml
[package]
```
*`wally install` results in:*
```bash
failed to parse manifest at path .\wally.toml

Caused by:
    missing field `name` for key `package` at line 1 column 1
```
- Attempt #4
```toml
[package]
name = "Test"
```
*`wally install` results in:*
```bash
failed to parse manifest at path .\wally.toml

Caused by:
    a package name is of the form SCOPE/NAME for key `package.name` at line 2 column 8
```
- Attempt #5
```toml
[package]
name = "coffilhg/Test"
```
*`wally install` results in:*
```bash
failed to parse manifest at path .\wally.toml

Caused by:
    package name 'Test' is invalid (names can only contain lowercase characters, digits and '-') for key `package.name` at line 2 column 8
```
- Attempt #6
```toml
[package]
name = "coffilhg/test"
```
*`wally install` results in:*
```bash
failed to parse manifest at path .\wally.toml

Caused by:
    missing field `version` for key `package` at line 1 column 1
```
