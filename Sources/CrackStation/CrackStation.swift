import Foundation
import Crypto
public struct CrackStation: Decrypter {
    //public private(set) var text = "Hello, World!"

    private var lookupTable: [String: String] = [:]

    private func loadDictionaryFromDisk() throws -> [String : String] {
        guard let path = Bundle.module.url(forResource: "hash", withExtension: "json") else { return [:] }

        let data = try Data(contentsOf: path)
        let jsonResult = try JSONSerialization.jsonObject(with: data)

        if let lookupTable: Dictionary = jsonResult as? Dictionary<String, String> {
            return lookupTable
        } else {
            return [:]
        }
    }

    //Run this the very first time
    public init() {
        lookupTable = try!loadDictionaryFromDisk()
    }

    public func decrypt(shaHash: String) -> String?{
        //If my dictionary is empty, then throw an error
        if lookupTable.isEmpty == true
        {
            //return "Dictionary is empty"
            return "Dictionary is empty"
        }
        
        return lookupTable[shaHash]
    }
    /*
    func loadDictionaryFromDisk() throws -> [String : String] {
        guard let path = Bundle.module.url(forResource: "hash", withExtension: "json") else { return [:] }

        let data = try Data(contentsOf: path)
        let jsonResult = try JSONSerialization.jsonObject(with: data)

        if let lookupTable: Dictionary = jsonResult as? Dictionary<String, String> {
            return lookupTable
        } else {
            return [:]
        }
    }

    public func crack(password: String) throws -> String?{
  
        //When
        let lookupTable = try loadDictionaryFromDisk()

        //If my dictionary is empty, then throw an error
        if lookupTable.isEmpty == true
        {
            //return "Dictionary is empty"
            return "Dictionary is empty"
        }
        
        return lookupTable[password]
    }*/
}
