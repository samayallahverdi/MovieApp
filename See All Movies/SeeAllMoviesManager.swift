//
//  SeeAllMoviesManager.swift
//  MovieApp
//
//  Created by BUDLCIT on 2023. 12. 21..
//

import Foundation

class SeeAllMoviesManager {
    func getMovies(pageNumber: Int, endpoint: MovieEndpoint, completion: @escaping ((Movie?, String?) -> Void)) {
        let url = endpoint.rawValue + "?page=\(pageNumber)"
        NetworkManager.request(model: Movie.self, endpoint: url, completion: completion)
    }
}
