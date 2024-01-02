//
//  SearchManager.swift
//  MovieApp
//
//  Created by BUDLCIT on 2023. 12. 15..
//

import Foundation

class SearchManager {
    func search(endpoint: SearchEndpoint,key: String, completion: @escaping ((Movie?, String?) -> Void)) {
        
        let params : [String: Any] = ["query": key]
        
        NetworkManager.request(model: Movie.self,
                               endpoint: endpoint.rawValue,
                               parameters: params
        ) { data, errorMessage in
            if let errorMessage {
               completion(nil, errorMessage)
            } else if let data {
                completion(data, nil)
            }
        }
        
        
    }
}
