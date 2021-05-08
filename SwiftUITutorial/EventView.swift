import SwiftUI


struct EventView: View {
    
    @State var eventColor = Color(.systemRed)
    @State var numOfPeople = ""
    @StateObject var eventController = EventController()
    @State var emptyItem: Item = Item()
    @State var beverages: [Item] = testDataItensBebidas
    @State var foods: [Item] = testDataItensComidas
    @State private var showModal: Bool = false
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading){
                List {
                    TextField("Nº de Convidados", value: $numOfPeople, formatter: NumberFormatter(), onEditingChanged: { (changed) in
                    })
                    .keyboardType(.numberPad)
                    
                    Section(header: Text("Bebidas")){
                        ForEach (beverages.indices) { idx in
                            ItemCellTotal(item: self.$beverages[idx])
                        }
                    }
                    
                    Section(header: Text("Comidas")){
                        ForEach (foods.indices) { idx in
                            ItemCellTotal(item: self.$foods[idx])
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
            .navigationTitle("Nome do evento") //event.name
        }
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
