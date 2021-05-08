//
//  Event.swift
//  SwiftUITutorial
//
//  Created by lethycia maia on 07/05/21.
//

import Foundation
import SwiftUI

struct Event: Identifiable  {
    
    var id = UUID()
    var name: String
    var icon: String
    var color: Color
    var numberOfPeople: Int = 0
    var listOfItems: [Item] = []
    var date: Date
}
