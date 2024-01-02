//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by BUDLCIT on 2023. 12. 04..
//

import Foundation
import UIKit

struct HomeModel {
    let title: String
    let movies: [MovieResult]
}

class HomeViewModel {
    var movies = [HomeModel]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    private let manager = HomeManager()

    
    func getItems() {
        getMovies(title: "Now Playing", endpoint: .nowPlaying)
        getMovies(title: "Popular", endpoint: .popular)
        getMovies(title: "Top Rated", endpoint: .topRated)
        getMovies(title: "Upcoming", endpoint: .upcoming)
    }
    
    func getMovies(title: String, endpoint: MovieEndpoint) {
        manager.getMovies(endpoint: endpoint) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.movies.append(.init(title: title, movies: data.results ?? []))
                self.success?()
            }
        }
    }
   
}
