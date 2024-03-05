//
//  EncodeDecodeManager.swift
//  MVC_Todo
//
//  Created by softpuzzle on 2/28/24.
//

import Foundation

class CodableManager {
    
    //저장
    static func operateEncode(_ encode: Codable) -> Data {
        
        let encoder = JSONEncoder()
        // 담는거1
        if let encoded = try? encoder.encode(encode) {
            return encoded
        }
        return encode as! Data
        
    }
    
    //불러오기
    static func operateDecode(_ decode: Data) -> [TestModel] {
        
        let decoder = JSONDecoder()
        
        if let savedObject = try? decoder.decode([TestModel].self, from: decode) {
            return savedObject
        }
        return [TestModel]()
    }
    
}
