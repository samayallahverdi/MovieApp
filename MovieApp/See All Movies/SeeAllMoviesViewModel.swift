//
//  SeeAllMoviesViewModel.swift
//  MovieApp
//
//  Created by BUDLCIT on 2023. 12. 21..
//

import Foundation


class SeeAllMoviesViewModel {
    var movieData: Movie?
    var movies = [MovieResult]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    private let manager = SeeAllMoviesManager()
    
    
    func getMovies(selectedCategory: String){
        manager.getMovies(pageNumber: (movieData?.page ?? 0) + 1, endpoint: MovieEndpoint(rawValue: selectedCategory) ?? .nowPlaying) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.movieData = data
                self.movies.append(contentsOf: data.results ?? [])
                self.success?()
            }
        }
         
    }
//    func pagination(index: Int) {
//        if index == items.count - 1 && (movieData?.page ?? 0 <= movieData?.totalPages ?? 0) {
//            getMovies(selectedCategory: String)
//        }
//    }
//    func reset() {
//        peopleData = nil
//        items.removeAll()
//    }
}
