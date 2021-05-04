//
//  Item.swift
//  PartyPlanner
//
//  Created by Lucas de Souza on 03/05/21.
//

import Foundation

enum itemUnity {
    case mL
    case g
    case unidade
    case lata
}

enum itemCategory {
    case bebidas
    case comidas
    case decoracao
    case outros
}

public struct Item {
    var name: String
    var unity: itemUnity
    var category: itemCategory
    var quantityPerPerson: Float
    var pricePerPerson: Float
    var quantityToBuy: Int
    var quantityBought: Int
}
