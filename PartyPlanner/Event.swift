//
//  Event.swift
//  PartyPlanner
//
//  Created by Lucas de Souza on 03/05/21.
//

import Foundation
import SwiftUI

struct Event {
    var name: String
    var icon: String
    var color: SwiftUI.Color
    var numberOfPeople: Int
    var listOfItems: [Item]
}
