//
//  MovieDetailsViewModel.swift
//  MovieApp
//
//  Created by BUDLCIT on 2023. 12. 15..
//

import Foundation

struct MovieDetailModel {
    let type: MovieDetailItemType
}

enum MovieDetailItemType {
    case poster(String?)
    case title(String?)
    case info(MovieDetails)
    case description(String?)
    case cast([Cast]?)
}

struct MovieDetails {
    let rating: String?
    let genres: [Genre]
    let length: String?
    let language: [SpokenLanguage]
}

class MovieDetailsViewModel {
    
    var movieItems = [MovieDetailModel]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    private let manager = MovieDetailsManager()
    
    func getMovieInfoItems(movieId: Int?) {
        manager.getMovieDetails(movieId: movieId, endpoint: .movieInfo) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.movieItems.append(.init(type: .poster(data.posterPath)))
                self.movieItems.append(.init(type: .title(data.title)))
                self.movieItems.append(.init(type: .info(.init(rating: "\(data.voteAverage ?? 0.0)",
                                                               genres: data.genres ?? [], length: "\(data.runtime ?? 0)",
                                                               language: data.spokenLanguages ?? []))))
                self.movieItems.append(.init(type: .description(data.overview)))
                self.success?()
            }
        }
        manager.getCastDetails(movieId: movieId) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.movieItems.append(.init(type: .cast(data.cast)))
                
                self.success?()
            }
        }
    }
  
}
