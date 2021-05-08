import Foundation

enum itemUnity:String, CaseIterable {
    case mL
    case g
    case unidade
    case lata
}

enum itemCategory:String, CaseIterable {
    case bebidas
    case comidas
    case decoracao
    case outros
}

public struct Item {
    
    var id = UUID()
    var name: String
    var unity: itemUnity
    var category: itemCategory
    var quantityPerPerson: Float
    var pricePerItem: Float
    var quantityToBuy: Int
    var quantityBought: Int
    var observation: String
    
    init(name: String, unity: itemUnity, category: itemCategory, quantityPerPerson: Float, pricePerItem: Float, quantityToBuy: Int, quantityBought: Int) {
        self.id = UUID()
        self.name = ""
        self.unity = unity
        self.category = category
        self.quantityPerPerson = quantityPerPerson
        self.pricePerItem = pricePerItem
        self.quantityToBuy = quantityToBuy
        self.quantityBought = quantityBought
        self.observation = ""
    }
    
    init() {
        self.id = UUID()
        self.name = ""
        self.unity = .unidade
        self.category = .bebidas
        self.quantityPerPerson = 0
        self.pricePerItem = 0
        self.quantityToBuy = 0
        self.quantityBought = 0
        self.observation = ""
    }

}
