# Hello World!
### So I was wondering, who exactly decides where the Packages go, when you run `wally install`
### This goofy test helps figure this out
**Attempts #9 and #13 are worth looking into**

-# **On #9 wally could give us more information (same can be applied to #7)**

-# **On #13 I had no idea what wally was referring to, good thing we have AI available today...**


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

Contents of **[testingHelper.ps1](<testingHelper.ps1>)**

*(Roblox Package Manager wally must be installed for it to work)*

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


- Attempt #7
```toml
[package]
name = "coffilhg/test"
version = ""
```
*wally install results in:*
```bash
failed to parse manifest at path .\wally.toml

Caused by:
    expected more input for key `package.version` at line 3 column 11
```


- Attempt #8
```toml
[package]
name = "coffilhg/test"
version = "more input"
```
*wally install results in:*
```bash
failed to parse manifest at path .\wally.toml

Caused by:
    encountered unexpected token: AlphaNumeric("more") for key `package.version` at line 3 column 11
```


- Attempt #9
```toml
[package]
name = "coffilhg/test"
version = "123"
```
*wally install results in:*
```bash
failed to parse manifest at path .\wally.toml

Caused by:
    expected more input for key `package.version` at line 3 column 11
```


- Attempt #10
```toml
[package]
name = "coffilhg/test"
version = "1.2.3"
```
*wally install results in:*
```bash
failed to parse manifest at path .\wally.toml

Caused by:
    missing field `registry` for key `package` at line 1 column 1
```


- Attempt #11
```toml
[package]
name = "coffilhg/test"
version = "1.2.3"
registry = ""
```
*wally install results in:*
```bash
failed to parse manifest at path .\wally.toml

Caused by:
    missing field `realm` for key `package` at line 1 column 1
```


- Attempt #12
```toml
[package]
name = "coffilhg/test"
version = "1.2.3"
registry = ""
realm = ""
```
*wally install results in:*
```bash
failed to parse manifest at path .\wally.toml

Caused by:
    unknown variant ``, expected one of `server`, `shared`, `dev` for key `package.realm` at line 1 column 1
```


- Attempt #13
```toml
[package]
name = "coffilhg/test"
version = "1.2.3"
registry = ""
realm = "dev"
```
*wally install results in:*
```bash
relative URL without a base
```

# First success!

- Attempt #14
```toml
[package]
name = "coffilhg/test"
version = "1.2.3"
registry = "https://github.com/upliftgames/wally-index"
realm = "dev"
```
*wally install results in:*
```bash
[INFO ] Updating package index https://github.com/upliftgames/wally-index...
[INFO ] Downloaded 0 packages!
```


- Attempt #15
```toml
[package]
name = "coffilhg/test"
version = "1.2.3"
registry = "https://github.com/upliftgames/wally-index"
realm = "dev"

[dependencies]
```
*wally install results in:*
```bash
[INFO ] Updating package index https://github.com/upliftgames/wally-index...
[INFO ] Downloaded 0 packages!
```


- Attempt #16
```toml
[package]
name = "coffilhg/test"
version = "1.2.3"
registry = "https://github.com/upliftgames/wally-index"
realm = "dev"

[dependencies]
CoffeeObjects = "coffilhg/coffeeobjects@2.3.5"
```
*wally install results in:*
```bash
[INFO ] Updating package index https://github.com/upliftgames/wally-index...
[INFO ] Downloaded 3 packages!
```


- Attempt #17
```toml
[package]
name = "coffilhg/test"
version = "1.2.3"
registry = "https://github.com/upliftgames/wally-index"
realm = "dev"

[dependencies]
CoffeeObjects = "coffilhg/coffeeobjects@2.3.5"

[server-dependencies]

[dev-dependencies]
```
*wally install results in:*
```bash
[INFO ] Updating package index https://github.com/upliftgames/wally-index...
[INFO ] Downloaded 3 packages!
```


- Attempt #18
```toml
[package]
name = "coffilhg/test"
version = "1.2.3"
registry = "https://github.com/upliftgames/wally-index"
realm = "dev"

[dependencies]
CoffeeObjects = "coffilhg/coffeeobjects@2.3.5"

[server-dependencies]
ProfileStoreV2 = "coffilhg/profilestorev2@2.0.3"

[dev-dependencies]
TestEZ = "roblox/testez@0.4.1"
```
*wally install results in:*
```bash
[INFO ] Updating package index https://github.com/upliftgames/wally-index...
[INFO ] Downloaded 5 packages!
```

# In conclusion...
`wally` is ultimately the one who decides how to name the Dirs where Packages go
| [x] goes to | dependencies | server-dependencies | dev-dependencies |
|-------------|--------------|---------------------|------------------|
| dir name | Packages | ServerPackages | DevPackages |

# What if these dirs exist and are populated / used already?

- Attempt #19
```toml
[package]
name = "coffilhg/test"
version = "1.2.3"
registry = "https://github.com/upliftgames/wally-index"
realm = "dev"

[dependencies]
CoffeeObjects = "coffilhg/coffeeobjects@2.3.5"

[server-dependencies]
ProfileStoreV2 = "coffilhg/profilestorev2@2.0.3"

[dev-dependencies]
TestEZ = "roblox/testez@0.4.1"
```
*wally install results in:*
```bash
[INFO ] Updating package index https://github.com/upliftgames/wally-index...
[INFO ] Downloaded 5 packages!
```

# `Wally` just deletes them, glad I had git commit'ed them!