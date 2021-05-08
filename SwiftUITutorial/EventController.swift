//
//  EventController.swift
//  SwiftUITutorial
//
//  Created by lethycia maia on 07/05/21.
//

import Foundation
import SwiftUI

class EventController: ObservableObject {
    @Published var eventList:[Event] = []
    
    func add(_ event: Event) {
        eventList.append(event)
    }
    
    func list() -> [Event] {
        eventList
    }
    
    func find(_ id:UUID) -> Event? {
        let idx = eventList.firstIndex(where:{$0.id == id})
        return idx != nil ? eventList[idx!] : nil
    }
    
    static func testRepository() -> EventController {

        let repository = EventController()
        repository.eventList = [
            Event(
                name: "Aniversário de Mari",
                icon: "gift.fill",
                color: Color(UIColor.systemPurple),
                numberOfPeople: 3,
                startDate: Date(),
                endDate: Date()
            ),
            Event(
                name: "Casamento de Lucas",
                icon: "heart.fill",
                color: Color(UIColor.systemPurple),
                numberOfPeople: 4,
                startDate: Date(),
                endDate: Date()
            ),
            Event(
                name: "Churrasco do Zé",
                icon: "sun.max.fill",
                color: Color(UIColor.systemPurple),
                numberOfPeople: 5,
                startDate: Date(),
                endDate: Date()
            )

        ]

        return repository
    }
}
