//
//  MovieDetailsUseCase.swift
//  MovieApp
//
//  Created by BUDLCIT on 2023. 12. 15..
//

import Foundation

protocol MovieDetailsUseCase {
    func getMovieDetails(movieId: Int?,endpoint: MovieDetailEndpoint,completion: @escaping ((MovieDetailsModel?, String?) -> Void))
}
