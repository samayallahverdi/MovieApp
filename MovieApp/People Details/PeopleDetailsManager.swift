//
//  PeopleDetailsManager.swift
//  MovieApp
//
//  Created by BUDLCIT on 2023. 12. 19..
//

import Foundation

class PeopleDetailsManager {
    func getPopleDetailsList(peopleId: Int?, completion: @escaping ((PeopleDetailsModel?, String?) -> Void)) {
        let url = "\(PeopleDetailsEndpoint.peopleDetails.rawValue)\(peopleId ?? 0)/movie_credits"
        NetworkManager.request(model: PeopleDetailsModel.self, endpoint: url) { data, errorMessage in
            if let errorMessage {
                completion(nil, errorMessage)
            } else if let data {
                completion(data, nil)
            }
        }
    }
}
