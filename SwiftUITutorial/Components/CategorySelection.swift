//
//  CategorySelection.swift
//  SwiftUITutorial
//
//  Created by Danilo Miranda Gusicuma on 08/05/21.
//

import SwiftUI



struct CategorySelection: View {
    
    var category:itemCategory
    @Binding var selectedCategory:itemCategory
    var color: Color
    
    var body: some View {
        HStack {
            if (category == selectedCategory) {
                Image(systemName: "checkmark").foregroundColor(color)
            } else {
                Image(systemName: "checkmark").foregroundColor(Color.white)
            }
            switch(category){
            case .bebidas:
                Text("Bebidas")
            case .comidas:
                Text("Comidas")
            case .decoracao:
                Text("Decoração")
            case .outros:
                Text("Outros")
                
            }
        }.onTapGesture {
            self.selectedCategory = category
        }
    }
}
