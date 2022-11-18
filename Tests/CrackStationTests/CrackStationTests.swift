import XCTest
import Foundation
import Crypto
@testable import CrackStation


final class CrackStationTests: XCTestCase {

    //(SHA1) Unit test hash mapping not nil
    func testCrackNotNil(){
        //Given
        let CrackLibrary = CrackStation()

        //When
        let password = CrackLibrary.decrypt(shaHash: "86f7e437faa5a7fce15d1ddcb9eaeaea377667b8")

        //Then
        XCTAssertNotNil(password)
    }

    //(SHA1) Unit test suppose to give wrong string e.g. over one character(Hello)
    func testCrackWrongString(){
        //Given
        let CrackLibrary = CrackStation()

        //When
        let password = CrackLibrary.decrypt(shaHash: "f7ff9e8b7bb2e09b70935a5d785e0cc5d9d0abf0")

        //Then
        XCTAssertNil(password)
    }

    //(SHA1) Unit test hash mapping get correct value
    func testCrackValue() {
        //Given
        let CrackLibrary = CrackStation()

        //When
        let password = CrackLibrary.decrypt(shaHash: "909f99a779adb66a76fc53ab56c7dd1caf35d0fd")

        //Then
        XCTAssertNotNil(password)
        XCTAssert(password == "Z")
    }

    //(SHA2) Unit test getting correct mapping value
    func testLoadingLookupTableFromDisk() {
        //Given
        let CrackLibrary = CrackStation()
        
        //When
        let password = CrackLibrary.decrypt(shaHash: "b8eb0368512d7f2aa3384b66a4f0c05335c6bd58db48325d3a39c86d7fc7974a")

        //Then
        XCTAssertEqual(password, "2!")
    }

    //(SHA1) Unit test getting correct mapping value
    func testLoadingLookupTableFromDisk3char() {
        //Given
        let CrackLibrary = CrackStation()
        
        //When
        let password = CrackLibrary.decrypt(shaHash: "3f6d6a8699144a0028a6f47b26a3c6f70306023f")

        //Then
        XCTAssertEqual(password, "Tin")
    }
}
