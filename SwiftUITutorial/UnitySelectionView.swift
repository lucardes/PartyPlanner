//
//  UnitySelectionView.swift
//  SwiftUITutorial
//
//  Created by Danilo Miranda Gusicuma on 08/05/21.
//

import SwiftUI

struct UnitySelectionView: View {
    
    @Binding var selectedUnity: itemUnity
    @Binding var color: Color
    
    var body: some View {
        VStack{
            List{
                Section(header: Text("Unidade")){
                    ForEach( itemUnity.allCases, id: \.self ){ itemunity in
                        UnitySelection(unity: itemunity, selectedUnity: $selectedUnity, color: $color)
                    }
                }
            }
            .listStyle(GroupedListStyle())
        }
    }
}
