//
//  PeopleManager.swift
//  MovieApp
//
//  Created by BUDLCIT on 2023. 12. 15..
//

import Foundation

class PeopleManager: PeopleListUseCase {
    func getPopleList(pageNumber: Int, completion: @escaping ((People?, String?) -> Void)) {
        let url = PeopleEndpoint.popularactors.rawValue + "?page=\(pageNumber)"
        NetworkManager.request(model: People.self, endpoint: url) { data, errorMessage in
            if let errorMessage {
                completion(nil, errorMessage)
            } else if let data {
                completion(data, nil)
            }
        }
    }
}
