//
//  UpdateListView.swift
//  SwiftUITutorial
//
//  Created by Danilo Miranda Gusicuma on 08/05/21.
//

import SwiftUI

struct UpdateListView: View {
    
    @State var name:String = ""
    @State var category:itemCategory = .bebidas
    @State var quantityToBuy: Float = 1
    @State var quantityBought: Float = 0
    @State var observation: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            VStack (alignment: .leading) {
                List {
                    Section {
                        TextField("Item", text: $name, onEditingChanged: {
                            (changed) in
                        })
                    }
                    
                    Section(header: Text("Quantidade total a comprar")) {
                        TextField("0", value: $quantityToBuy, formatter: NumberFormatter(), onEditingChanged: {
                            (changed) in
                            
                        })
                    }
                        
                    Section(header: Text("Quantidade já comprada")) {
                        TextField("0", value: $quantityBought, formatter: NumberFormatter(), onEditingChanged: {
                            (changed) in
                        })
                    }
                        
                    Section {
                        TextField("Observações", text: $observation, onEditingChanged: {
                            (changed) in
                        })
                    }
                }
                .listStyle(GroupedListStyle())
            }
            .navigationBarTitle(Text("Novo item"), displayMode: .inline)
            .navigationBarItems(leading: Button("Cancelar") {
                presentationMode.wrappedValue.dismiss()
            }.foregroundColor(.red), trailing: Button("OK") {
                //add item
                presentationMode.wrappedValue.dismiss()
            }.accentColor(.red)
            .disabled(name.isEmpty || quantityToBuy == 0).accentColor(.red))
            .background(Color("Background")).ignoresSafeArea()
        }
    }
}

struct UpdateListView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateListView()
    }
}
