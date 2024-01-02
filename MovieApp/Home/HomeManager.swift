//
//  HomeManager.swift
//  MovieApp
//
//  Created by BUDLCIT on 2023. 12. 15..
//

import Foundation

class HomeManager: MovieListUseCase {
    func getMovies(endpoint: MovieEndpoint, completion: @escaping ((Movie?, String?) -> Void)) {
        NetworkManager.request(model: Movie.self, endpoint: endpoint.rawValue, completion: completion)
    }
    
//    func getMovies(endpoint: Endpoints, completion: @escaping ((Movie?, String?)->Void)) {
//        NetworkManager.request(model: Movie.self,
//                               endpoint: endpoint.rawValue) { data, errorMessage in
//            if let errorMessage {
//                completion(nil, errorMessage)
//            } else if let data {
//                completion(data, nil)
//            }
//        }
//    }
    
}
