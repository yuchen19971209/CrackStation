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
}
