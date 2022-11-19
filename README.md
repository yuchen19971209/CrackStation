# CrackStation, a Decrypter implementation
An library that cracks short length characters.

## Overview
CrackStation is a highly performant library written in Swift that cracks passwords hashed using one way function (can’t be decrypted/reversed) using brute force method. CrackStation can crack SHA1 and SHA256 `[a-z0-9A-Z?!]` unsalted hashes of length less than four and return the password.

## Mission Statement
While SHA is hard to crack, it can still be easily cracked by implementing a CrackStation library if the password is too short. Therefore, the purpose of this library is to wake people up to be more concerned about password security, and when they set their passwords, they should avoid setting them too short.


## Installation
### Swift Package Manager
The [Swift Package Manager](https://www.swift.org/package-manager) is "a tool for managing the distribution of Swift code. It's integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies."

Once you have your Swift package set up, add CrackStation to the list of dependencies in your `Package.swift` file:

```
dependencies: [
        .package(url: "git@github.com:yuchen19971209/CrackStation.git", .upToNextMajor(from: "1.0.8")),
    ],
```

## Usage
### The API
Public API have only two functions: `init` for creating a decrypter and `decrypt` for decrypting hashes back to plain-text passwords. 

The function `init` set the dictionary `LookUpTable` which is load from disk. 

The input parameter of the function `decrypt` is a ShaHash string, and the function output will return the password.

If the shaHash String does **not appear** in hash mapping dictionary or **nil**, it will return *nil*.

### An example
Below is a sample call site.

First you need to **import**

```
import CrackStation
```

Then write your own test function and **call site**.
```
//Given
let CrackLibrary = CrackStation()

func testOneLetter() throws{
        for letter in "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789?!" {
            // Given
            let password = String(letter)
            let shaHash = encrypt(password)

            // When
            let crackedPassword = CrackLibrary.decrypt(shaHash: shaHash)

            // Then
            XCTAssertEqual(crackedPassword, password)
        }
}

private func encrypt(_ password: String) -> String {
        let dataToHash = Data(password.utf8)
        let prefix = "SHA 1 digest: "
        let shaHashDescription = String(Insecure.SHA1.hash(data: dataToHash).description)
        let shaHash = String(shaHashDescription.dropFirst(prefix.count - 1))
        return shaHash
}
```

## Author
Yu-Chen, Chen


