//
//  MovieDetailsManager.swift
//  MovieApp
//
//  Created by BUDLCIT on 2023. 12. 15..
//

import Foundation

class MovieDetailsManager: MovieDetailsUseCase {

    func getMovieDetails(movieId: Int?,endpoint: MovieDetailEndpoint, completion: @escaping ((MovieDetailsModel?, String?) -> Void)) {
       
        NetworkManager.request(model: MovieDetailsModel.self,
                               endpoint: "\(endpoint.rawValue)\(movieId ?? 0)") { data, errorMessage in
            if let errorMessage {
                completion(nil, errorMessage)
            } else if let data {
                completion(data, nil)
            }
        }
    }
    func getCastDetails(movieId: Int?, completion: @escaping ((CastDetailsModel?, String?) -> Void)) {
       
        NetworkManager.request(model: CastDetailsModel.self,
                               endpoint: "\(MovieDetailEndpoint.movieInfo.rawValue)\(movieId ?? 0)/credits") { data, errorMessage in
            if let errorMessage {
                completion(nil, errorMessage)
            } else if let data {
                completion(data, nil)
            }
        }
    }
   
}

