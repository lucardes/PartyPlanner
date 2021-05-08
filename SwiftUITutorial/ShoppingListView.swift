import SwiftUI
let testDataItensBebidas = [
    Item(name: "Guaraná", unity: .lata, category: .bebidas, quantityPerPerson: 1, pricePerPerson: 5.00, quantityToBuy:  4, quantityBought: 4 ),
    Item(name: "Cerveja", unity: .lata, category: .bebidas, quantityPerPerson: 1, pricePerPerson: 5.00, quantityToBuy:  6, quantityBought: 6 ),
    Item(name: "Vodka", unity: .unidade, category: .bebidas, quantityPerPerson: 1, pricePerPerson: 5.00, quantityToBuy:  2, quantityBought: 1 ),
    Item(name: "Paratudo", unity: .unidade, category: .bebidas, quantityPerPerson: 1, pricePerPerson: 5.00, quantityToBuy:  1, quantityBought: 0 )
]

let testDataItensComidas = [
    Item(name: "Bolo", unity: .unidade, category: .comidas, quantityPerPerson: 1, pricePerPerson: 5.00, quantityToBuy:  1, quantityBought: 0 ),
    Item(name: "Bolinha de Queijo", unity: .unidade, category: .comidas, quantityPerPerson: 1, pricePerPerson: 5.00, quantityToBuy:  50, quantityBought: 50 ),
    Item(name: "Mini churros", unity: .unidade, category: .comidas, quantityPerPerson: 1, pricePerPerson: 5.00, quantityToBuy:  50, quantityBought: 50 ),
    Item(name: "Brigadeiro", unity: .unidade, category: .comidas, quantityPerPerson: 1, pricePerPerson: 5.00, quantityToBuy:  50, quantityBought: 0 )
]

let arrayVazio: [Item] = []

struct ShoppingList: View {
    
    @State var emptyItem: Item = Item(name: "", unity: .unidade, category: .bebidas, quantityPerPerson: 0, pricePerPerson: 0, quantityToBuy: 0, quantityBought: 0)
    @State var itens: [Item] = testDataItensBebidas
    @State var itens2: [Item] = testDataItensComidas
    @State private var showModal: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, content: {
            List {
                Section(header: Text("Bebidas")){
                    ForEach (itens.indices) { idx in
                        ItemCell(item: self.$itens[idx])
                    }
                }
                
                Section(header: Text("Comidas")){
                    ForEach (itens2.indices) { idx in
                        ItemCell(item: self.$itens2[idx])
                    }
                }
            }.navigationTitle("Lista de compras")
            .listStyle(GroupedListStyle())
            
            Button(action: {
                self.showModal = true
            }) {
              HStack {
                Image(systemName: "plus.circle.fill")
                  .resizable()
                  .frame(width: 20, height: 20)
                Text("Incluir item")
              }
            }
            .padding()
            .accentColor(Color(UIColor.systemRed))
            .sheet(isPresented: self.$showModal) {
                CreateItem(item: $emptyItem)
            }
        })
        
        
    }
}

struct ItemCell: View {
    
    @Binding var item: Item
    @State private var showModal: Bool = false //aaaaaaaaa
    
    var body: some View {
        NavigationLink(destination: ItemDetails(item: $item)) {
            HStack {
                Image(systemName: item.quantityBought == item.quantityToBuy ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.systemRed))
                Text(item.name)
                Spacer()
                Text(String(item.quantityBought) + " de " + String(item.quantityToBuy))
                    .foregroundColor(Color(.systemGray))
            }
        }
    }
}

struct ItemDetails: View {
    
    @Binding var item: Item
    
    var body: some View {
        VStack (alignment: .leading) {
            List {
                Section {
                    TextField("Item", text: $item.name, onEditingChanged: {
                        (changed) in
                    })
                }
                
                Section(header: Text("Categoria")){
                    HStack {
                        if (item.category == .bebidas) {
                            Image(systemName: "checkmark").foregroundColor(Color(.systemRed))
                        } else {
                            Image(systemName: "circle").foregroundColor(Color.white)
                        }
                        Text("Bebidas")
                    }
                    HStack {
                        if (item.category == .comidas) {
                            Image(systemName: "checkmark").foregroundColor(Color(.systemRed))
                        } else {
                            Image(systemName: "circle").foregroundColor(Color.white)
                        }
                        Text("Comidas")
                    }
                    HStack {
                        if (item.category == .decoracao) {
                            Image(systemName: "checkmark").foregroundColor(Color(.systemRed))
                        } else {
                            Image(systemName: "circle").foregroundColor(Color.white)
                        }
                        Text("Decoração")
                    }
                    HStack {
                        if (item.category == .outros) {
                            Image(systemName: "checkmark").foregroundColor(Color(.systemRed))
                        } else {
                            Image(systemName: "circle").foregroundColor(Color.white)
                        }
                        Text("Outros")
                    }
                }
                
                Section(header: Text("Quantidade total a comprar")) {
                    TextField("0", value: $item.quantityToBuy, formatter: NumberFormatter(), onEditingChanged: {
                        (changed) in
                    })
                }
                    
                Section(header: Text("Quantidade já comprada")) {
                    TextField("0", value: $item.quantityBought, formatter: NumberFormatter(), onEditingChanged: {
                        (changed) in
                    })
                }
                    
                Section {
                    TextField("Observações", text: $item.observation, onEditingChanged: {
                        (changed) in
                    })
                }
            }
            .listStyle(GroupedListStyle())
        }
        .navigationBarTitle(Text("Editar item"), displayMode: .inline)
    }
}

struct CreateItem: View {
    
    @Binding var item: Item
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            VStack (alignment: .leading) {
                List {
                    Section {
                        TextField("Item", text: $item.name, onEditingChanged: {
                            (changed) in
                        })
                    }
                    
                    Section(header: Text("Categoria")){
                        HStack {
                            if (item.category == .bebidas) {
                                Image(systemName: "checkmark").foregroundColor(Color(.systemRed))
                            } else {
                                Image(systemName: "circle").foregroundColor(Color.white)
                            }
                            Text("Bebidas")
                        }
                        HStack {
                            if (item.category == .comidas) {
                                Image(systemName: "checkmark").foregroundColor(Color(.systemRed))
                            } else {
                                Image(systemName: "circle").foregroundColor(Color.white)
                            }
                            Text("Comidas")
                        }
                        HStack {
                            if (item.category == .decoracao) {
                                Image(systemName: "checkmark").foregroundColor(Color(.systemRed))
                            } else {
                                Image(systemName: "circle").foregroundColor(Color.white)
                            }
                            Text("Decoração")
                        }
                        HStack {
                            if (item.category == .outros) {
                                Image(systemName: "checkmark").foregroundColor(Color(.systemRed))
                            } else {
                                Image(systemName: "circle").foregroundColor(Color.white)
                            }
                            Text("Outros")
                        }
                    }
                    
                    Section(header: Text("Quantidade total a comprar")) {
                        TextField("0", value: $item.quantityToBuy, formatter: NumberFormatter(), onEditingChanged: {
                            (changed) in
                        })
                    }
                        
                    Section(header: Text("Quantidade já comprada")) {
                        TextField("0", value: $item.quantityBought, formatter: NumberFormatter(), onEditingChanged: {
                            (changed) in
                        })
                    }
                        
                    Section {
                        TextField("Observações", text: $item.observation, onEditingChanged: {
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
                //add event to list here
                presentationMode.wrappedValue.dismiss()
            }.accentColor(.red)
            .disabled(item.name.isEmpty || item.quantityToBuy == 0).accentColor(.red))
            .background(Color("Background")).ignoresSafeArea()
        }
    }
}



// PREVIEW
struct ShoppingList_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingList()
            .previewDevice("iPhone 12")
    }
}
