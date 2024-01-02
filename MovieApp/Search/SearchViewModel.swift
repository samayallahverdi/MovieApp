//
//  SearchViewModel.swift
//  MovieApp
//
//  Created by BUDLCIT on 2023. 12. 11..
//

import Foundation

class SearchViewModel {
    var searchMovies = [MovieResult]()
    private let manager = SearchManager()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func search(key: String) {
        manager.search(endpoint: .search, key: key) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.searchMovies = data.results ?? []
                self.success?()
            }
        }
    }
}


