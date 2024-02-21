//
//  D_Network.swift
//  MVC_Todo
//
//  Created by 김동율 on 2/19/24.
//

import Foundation
import Alamofire

class D_Network {
    static let shared = D_Network()
    
    func fetchDataFromAPI(completion: @escaping ([TestModel]?, Error?) -> Void) {
        // Replace with your API endpoint
        let apiUrl = "https://jsonplaceholder.typicode.com/posts"

        AF.request(apiUrl).responseDecodable(of: [TestModel].self) { response in
            switch response.result {
            case .success(let items):
                completion(items, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    
}


