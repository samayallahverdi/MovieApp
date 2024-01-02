//
//  MovieListUseCase.swift
//  MovieApp
//
//  Created by BUDLCIT on 2023. 12. 15..
//

import Foundation
protocol MovieListUseCase {
    func getMovies(endpoint: MovieEndpoint, completion: @escaping ((Movie?, String?)->Void))
}
