//
//  PeopleListUseCase.swift
//  MovieApp
//
//  Created by BUDLCIT on 2023. 12. 15..
//

import Foundation
protocol PeopleListUseCase {
    func getPopleList(pageNumber: Int, completion: @escaping ((People?, String?) -> Void))
    
}
