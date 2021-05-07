//
//  DogRepository.swift
//  SwiftUITutorial
//
//  Created by SERGIO J RAFAEL ORDINE on 27/04/21.
//

import Foundation

class DogRepository: ObservableObject {
    private var dogList:[Dog] = []
    
    func add(_ dog: Dog) {
        dogList.append(dog)
    }
    
    func list() -> [Dog] {
        dogList
    }
    
    static func testRepository() -> DogRepository {
        
        let repository = DogRepository()
        repository.dogList = [Dog(name: "Totó",
                                  breed: "Vira-lata caramelo",
                                  thumbnail: "dog1"),
                              Dog(name: "Thor",
                                  breed: "Pastor",
                                  thumbnail: "dog5"),
                              Dog(name: "Lulu",
                                  breed: "Maltês",
                                  thumbnail: "dog4")
        ]
        
        return repository
        
    }
    
}
