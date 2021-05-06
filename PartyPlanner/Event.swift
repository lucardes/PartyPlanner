//
//  Event.swift
//  PartyPlanner
//
//  Created by Lucas de Souza on 03/05/21.
//

import Foundation
import SwiftUI

struct Event {
    
    var id: String = UUID().uuidString
    var name: String
    var icon: String
    var color: Color
    var numberOfPeople: Int = 0
    var listOfItems: [Item] = []
    var date: Date
}
