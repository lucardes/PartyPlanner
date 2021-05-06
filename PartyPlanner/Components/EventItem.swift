//
//  TableItem.swift
//  PartyPlanner
//
//  Created by lethycia maia on 05/05/21.
//

import Foundation

struct EventItem: Identifiable {
    var id: String = UUID().uuidString
    var icon: String
    var title: String
    
    init(icon: String, title: String) {
        self.icon = icon
        self.title = title
    }
}

//#if DEBUG
//let testDataTableItem = [
//  TableItem(title: "Implement UI"),
//  TableItem(title: "Connect to Firebase"),
//  TableItem(title: "????"),
//  TableItem(title: "PROFIT!!!")
//]
//#endif
