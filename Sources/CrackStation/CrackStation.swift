import Foundation
import Crypto
public struct CrackStation: Decrypter {

    private var lookupTable: [String: String] = [:]

    private func loadDictionaryFromDisk() -> [String : String] {
        guard let path = Bundle.module.url(forResource: "hash_MVP", withExtension: "json") else { return [:] }

        do{
            let data = try Data(contentsOf: path)
            let jsonResult = try JSONSerialization.jsonObject(with: data)

            if let lookupTable: Dictionary = jsonResult as? Dictionary<String, String> {
                return lookupTable
            } else {
                return [:]
            }
        }catch{
            return [:]
        }
    }

    //Run this the very first time
    public init() {
        lookupTable = loadDictionaryFromDisk()
    }

    public func decrypt(shaHash: String) -> String?{
        //If my dictionary is empty, then throw an error
        let password = lookupTable[shaHash]
        return password
    }
}
