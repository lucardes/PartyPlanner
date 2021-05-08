import SwiftUI


struct EventView: View {
    
    @State var eventColor = Color(.systemRed)
    @State var numOfPeople = 0
    @StateObject var eventController = EventController()
    @State var emptyItem: Item = Item()
    @State var itens: [Item] = testDataItensBebidas
    @State var itens2: [Item] = testDataItensComidas
    @State private var showModal: Bool = false
    
    var body: some View {
        
        VStack(alignment: .leading){
            List {
                
                TextField("N de Participantes", value: $numOfPeople, formatter: NumberFormatter())
                                        .keyboardType(.numberPad)
                
                Section(header: Text("Bebidas")){
                    ForEach (itens.indices) { idx in
                        ItemCellTotal(item: self.$itens[idx])
                    }
                }
                
                Section(header: Text("Comidas")){
                    ForEach (itens2.indices) { idx in
                        ItemCellTotal(item: self.$itens2[idx])
                    }
                }
            }
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
                CreateItemView(color: $eventColor)
            }
        }
        .navigationTitle("Lista de compras")
    }
}

struct ItemCellTotal: View {
    
    @Binding var item: Item
    @State private var showModal: Bool = false //aaaaaaaaa
    
    var body: some View {
        NavigationLink(destination: ItemDetails(item: $item)) {
            HStack {

                Text(item.name)
                Spacer()
                Text(String(item.quantityToBuy))
                    .foregroundColor(Color(.systemGray))
            }
        }
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EventView()
                .previewDevice("iPhone 12")
        }
    }
}
