import Foundation
import Crypto

public struct MockCrackStation: Decrypter {

    //Run this the very first time
    public init() {
    }


    public func decrypt(shaHash: String) -> String?{
        return nil
    }
}
