import Foundation
import Crypto

public struct CrackStation: Decrypter {

    private let LookUpTable: [String: String]

    //Run this the very first time
    public init() {
        if let path = Bundle.module.url(forResource: "hash_MVP", withExtension: "json"){
            do{
                let data = try Data(contentsOf: path)
                let jsonResult = try JSONSerialization.jsonObject(with: data)

                if let IsDict: Dictionary = jsonResult as? Dictionary<String, String> {
                    LookUpTable = IsDict
                } else {
                    LookUpTable = [:]
                }
            }catch{
                LookUpTable = [:]
            }
        }else{
            LookUpTable = [:]
        }
    }

    public func decrypt(shaHash: String) -> String?{
        let password = LookUpTable[shaHash]
        return password
    }
}
