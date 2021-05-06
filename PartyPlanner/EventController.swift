import Foundation
import SwiftUI

class EventController: ObservableObject {
    private var eventList:[Event] = []
    
    func add(_ event: Event) {
        eventList.append(event)
    }
    
    func list() -> [Event] {
        eventList
    }
    
    static func testRepository() -> EventController {


        let repository = EventController()
        repository.eventList = [Event(name: "Aniversário de Mari", icon: "􀑊", color: Color(UIColor.systemPurple), date: Date()),
                                Event(name: "Casamento de Lucas", icon: "􀊵", color: Color(UIColor.systemPurple), date: Date()),
                                Event(name: "Churrasco do Zé", icon: "􀆮", color: Color(UIColor.systemPurple), date: Date())
        ]

        return repository

    }
}
