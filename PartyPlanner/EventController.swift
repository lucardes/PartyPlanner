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
        repository.eventList = [Event(
                                    name: "casamento do Lucas",
                                    icon: "bolo",
                                    color: "Color1",
                                    numberOfPeople: 3,
                                    listOfItems: []
                                )]
        return repository
        
    }
}
