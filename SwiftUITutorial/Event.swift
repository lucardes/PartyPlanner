//
//  Event.swift
//  SwiftUITutorial
//
//  Created by lethycia maia on 07/05/21.
//

import Foundation
import SwiftUI

class Event: Identifiable, ObservableObject  {
    
    init(name:String, icon:String, color: Color, numberOfPeople: Int, startDate:Date, endDate:Date) {
        self.id = UUID()
        self.name = name
        self.icon = icon
        self.color = color
        self.numberOfPeople = numberOfPeople
        self.listOfItems = []
        self.startDate = startDate
        self.endDate = endDate
    }
    
    var id = UUID()
    var name: String
    var icon: String
    var color: Color
    var numberOfPeople: Int = 0
    @Published var listOfItems: [Item] = []
    var startDate: Date
    var endDate: Date
    
    func addItem(newItem: Item){
        self.listOfItems.append(newItem)
    }
    
    func list() -> [Item] {
        listOfItems
    }
}
