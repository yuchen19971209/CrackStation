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
}
