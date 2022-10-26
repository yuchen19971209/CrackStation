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
        let ans = CrackLibrary.decrypt(shaHash: "86f7e437faa5a7fce15d1ddcb9eaeaea377667b8")
        //print(ans)

        //Then
        XCTAssertNotNil(ans)
    }

    //(SHA1) Unit test suppose to give wrong string e.g. over one character(Hi!)
    func testCrackWrongString(){
        //Given
        let CrackLibrary = CrackStation()

        //When
        let ans = CrackLibrary.decrypt(shaHash: "c0a0ad26a634840c67a210fefdda76577b03a111")
        //print(ans)

        //Then
        XCTAssertNil(ans)
    }

    //(SHA1) Unit test hash mapping get correct value
    func testCrackValue() {
        //Given
        let CrackLibrary = CrackStation()

        //When
        let ans = CrackLibrary.decrypt(shaHash: "909f99a779adb66a76fc53ab56c7dd1caf35d0fd")
        //print(ans)

        //Then
        XCTAssertNotNil(ans)
        XCTAssert(ans == "Z")
    }

    //(SHA2) Unit test getting correct mapping value
    func testLoadingLookupTableFromDisk() {
        //Given
        let CrackLibrary = CrackStation()
        
        //When
        let answer = CrackLibrary.decrypt(shaHash: "b8eb0368512d7f2aa3384b66a4f0c05335c6bd58db48325d3a39c86d7fc7974a")
        //print(answer)

        //Then
        XCTAssertEqual(answer, "2!")
    }
}
