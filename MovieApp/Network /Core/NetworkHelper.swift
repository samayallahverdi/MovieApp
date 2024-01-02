//
//  NetworkHelper.swift
//  MovieApp
//
//  Created by BUDLCIT on 2023. 12. 08..
//

import Foundation
import Alamofire

class NetworkHelper {
    
    static let baseURL = "https://api.themoviedb.org/3/"
    
    static let headers: HTTPHeaders = ["Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwMTdjMzAxMDZiODQwMWM5ZGY3ZmFhNmQ1ODQ3ZDc2MiIsInN1YiI6IjY1NmFlNzkyNmVlY2VlMDBjNjgzODk2MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.o0cXnrSKeMv26zVShHsYMI5x7lF0_th0UGHUpMM1wok"]
    static let imagePath = "https://image.tmdb.org/t/p/original/"
}
