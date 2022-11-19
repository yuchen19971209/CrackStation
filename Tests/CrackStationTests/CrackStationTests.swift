import XCTest
import Foundation
import Crypto
@testable import CrackStation

final class CrackStationTests: XCTestCase {
    //Given
    let CrackLibrary = CrackStation()

    //(SHA1) Unit test hash mapping not nil
    func testCrackNotNil(){

        //When
        let password = CrackLibrary.decrypt(shaHash: "86f7e437faa5a7fce15d1ddcb9eaeaea377667b8")

        //Then
        XCTAssertNotNil(password)
    }

    //(SHA1) Unit test suppose to give wrong string e.g. over one character(Hello)
    func testCrackWrongString(){
        //When
        let password = CrackLibrary.decrypt(shaHash: "f7ff9e8b7bb2e09b70935a5d785e0cc5d9d0abf0")

        //Then
        XCTAssertNil(password)
    }

    //(SHA1) Unit test hash mapping get correct value
    func testCrackValue() {
        //When
        let password = CrackLibrary.decrypt(shaHash: "909f99a779adb66a76fc53ab56c7dd1caf35d0fd")

        //Then
        XCTAssertNotNil(password)
        XCTAssert(password == "Z")
    }

    func testOneLetter() throws{
        for letter in "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789?!" {
            // Given
            let password = String(letter)
            let shaHash = encrypt(password)
            let shaHash256 = encrypt256(password)

            // When
            let crackedPassword = CrackLibrary.decrypt(shaHash: shaHash)
            let crackedPassword256 = CrackLibrary.decrypt(shaHash: shaHash256)

            // Then
            XCTAssertEqual(crackedPassword, password)
            XCTAssertEqual(crackedPassword256, password)
        }
    }

    func testTwoLetter() throws{
        var sum = 0
        for i in "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789?!" {
            for j in "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789?!"{
                var letter = ""
                letter.append(i)
                letter.append(j)

                // Given
                let password = String(letter)
                let shaHash = encrypt(password)
                let shaHash256 = encrypt256(password)

                // When
                let crackedPassword = CrackLibrary.decrypt(shaHash: shaHash)
                let crackedPassword256 = CrackLibrary.decrypt(shaHash: shaHash256)

                // Then
                XCTAssertEqual(crackedPassword, password)
                XCTAssertEqual(crackedPassword256, password)
                sum += 1
            }
        }
        print(sum)
    }
    

    func testThreeLetter() throws{
        var sum = 0
        for i in "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789?!" {
            for j in "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789?!"{
                for z in "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789?!"{
                    var letter = ""
                    letter.append(i)
                    letter.append(j)
                    letter.append(z)

                    // Given
                    let password = String(letter)
                    let shaHash = encrypt(password)
                    let shaHash256 = encrypt256(password)

                    // When
                    let crackedPassword = CrackLibrary.decrypt(shaHash: shaHash)
                    let crackedPassword256 = CrackLibrary.decrypt(shaHash: shaHash256)

                    // Then
                    XCTAssertEqual(crackedPassword, password)
                    XCTAssertEqual(crackedPassword256, password)
                    sum += 1
                }
            }
        }
        print(sum)
    }

    private func encrypt(_ password: String) -> String {
        let dataToHash = Data(password.utf8)
        let prefix = "SHA 1 digest: "
        let shaHashDescription = String(Insecure.SHA1.hash(data: dataToHash).description)
        let shaHash = String(shaHashDescription.dropFirst(prefix.count - 1))
        return shaHash
    }

    private func encrypt256(_ password: String) -> String {
        let dataToHash = Data(password.utf8)
        let prefix = "SHA 256 digest: "
        let shaHashDescription = String(SHA256.hash(data: dataToHash).description)
        let shaHash = String(shaHashDescription.dropFirst(prefix.count - 1))
        return shaHash
    }
}
