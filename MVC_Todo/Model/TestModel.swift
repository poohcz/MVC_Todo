//
//  Model.swift
//  MVC_Todo
//
//  Created by 김동율 on 2/19/24.
//

import Foundation

struct TestModel: Codable {
    let id: Int
    let userId: Int
    let body: String
    let title: String
    
    
    
    
    
    
    
    
//    let id: Int?
//    let userId: Int?
//    let body: String?
//    let title: String?
//    
//    enum CodingKeys: CodingKey {
//        case id, userId, body, title
//    }
//    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        id = (try? values.decode(Int.self, forKey: .id)) ?? nil
//        userId = (try? values.decode(Int.self, forKey: .userId)) ?? nil
//        body = (try? values.decode(String.self, forKey: .body)) ?? nil
//        title = (try? values.decode(String.self, forKey: .title)) ?? nil
//    }
}
