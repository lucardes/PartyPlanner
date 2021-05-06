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
    
//    static func testRepository() -> EventController {
//
//        let repository = testRepository()
//        repository.eventList = [Event(name: "Aniversário de Mari", icon: "􀑊", color: UIColor.systemPurple),
//                                Event(name: "Casamento de Lucas", icon: "􀊵", color: UIColor.systemPurple),
//                                Event(name: "Churrasco do Zé", icon: "􀆮", color: UIColor.systemPurple)
//        ]
//
//        return repository
//
//    }
}
