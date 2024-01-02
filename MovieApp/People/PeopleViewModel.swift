//
//  PeopleViewModel.swift
//  MovieApp
//
//  Created by BUDLCIT on 2023. 12. 08..
//

import Foundation

class PeopleViewModel {
    var peopleData: People?
    var items = [PeopleResult]()
    
    private let manager = PeopleManager()
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    
    func getPopleList() {
        manager.getPopleList(pageNumber: (peopleData?.page ?? 0) + 1) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.peopleData = data
                self.items.append(contentsOf: data.results ?? [])
                self.success?()
            }
        }
    }
    func pagination(index: Int) {
        if index == items.count - 1 && (peopleData?.page ?? 0 <= peopleData?.totalPages ?? 0) {
            getPopleList()
        }
    }
    func reset() {
        peopleData = nil
        items.removeAll()
    }
}


