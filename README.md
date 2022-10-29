# cs561-swift

## Crack Station
The purpose of Crack Station is to decrypt the SHA1 `[a-z0-9A-Z]` Hash strings which len are shorter than three and SHA256 `[a-z0-9A-Z?!]` Hash strings which len are shorter than four. People who use this library can decrypt other's short password easily. Therefore, poeple may concern more about the issue of password security.


### How to use it?
* **Environment Version**
Swift version 5.7 (swift-5.7-RELEASE)
Target: x86_64-unknown-linux-gnu

* **Added** a *dependency* in `Package.swift`

```
dependencies: [
        .package(url: "git@github.com:yuchen19971209/CrackStation.git", from: "1.0.4"),
    ],
```
```
targets: [
        .target(
            name: ...,
            dependencies: ["CrackStation"])
        .....
]
```

* **Import CrackStation** under your Sources *swift* file
```
import CrackStation
```

* Call **decrypt()** function and *Input* **shaHash String** as your encrypt string, then the function will *return* **plaintext**. If the shaHash String does **not appear** in hash mapping dictionary or **nil**, it will return *nil*.


### Latest stable release Version
* v1.0.4

### Author's name
Yu-Chen, Chen

