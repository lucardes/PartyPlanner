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
    var color: UIColor
    var numberOfPeople: Int = 0
    var listOfItems: [Item] = []
    //var date: Date
    
//    var mainImage: String {
//        name.replacingOccurrences(of: " ", with: "-").lowercased()
//    }

//    #if DEBUG
//    static let example = MenuItem(id: UUID(), name: "Maple French Toast", photoCredit: "Joseph Gonzalez", price: 6, restrictions: ["G", "V"], description: "Sweet, fluffy, and served piping hot, our French toast is flown in fresh every day from Maple City, Canada, which is where all maple syrup in the world comes from. And if you believe that, we have some land to sell you…")
//#endif
}
