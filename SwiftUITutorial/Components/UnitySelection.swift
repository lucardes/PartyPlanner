//
//  CategorySelection.swift
//  SwiftUITutorial
//
//  Created by Danilo Miranda Gusicuma on 08/05/21.
//

import SwiftUI



struct UnitySelection: View {
    
    var unity: itemUnity
    @Binding var selectedUnity:itemUnity
    @Binding var color: Color
    
    var body: some View {
        HStack {
            if (unity == selectedUnity) {
                Image(systemName: "checkmark").foregroundColor(color)
            } else {
                Image(systemName: "checkmark").foregroundColor(Color.white)
            }
            switch(unity){
            case .mL:
                Text("mL")
            case .unidade:
                Text("unidade")
            case .g:
                Text("grama")
            case .lata:
                Text("lata")
                
            }
        }.onTapGesture {
            self.selectedUnity = unity
        }
    }
}
