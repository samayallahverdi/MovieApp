//
//  PeopleDetailsViewModel.swift
//  MovieApp
//
//  Created by BUDLCIT on 2023. 12. 19..
//

import Foundation

class PeopleDetailsViewModel {
    
    var peopleDetails = [PeopleCast]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    
    private let manager = PeopleDetailsManager()
    
    func getPeopleDetails(peopleId: Int?){
        manager.getPopleDetailsList(peopleId: peopleId) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.peopleDetails = data.cast ?? []
                self.success?()
            }
        }
        }
    }
    

