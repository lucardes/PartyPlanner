import SwiftUI


struct EventView: View {
    
    @State var eventColor = Color(.systemRed)
    @ObservedObject var event:Event
    @State var numberOfPeople:Int = 4
    @State var color:Color = Color(.systemRed)
    @State var emptyItem: Item = Item()
    @State var beverages: [Item] = testDataItensBebidas
    @State var foods: [Item] = testDataItensComidas
    @State private var showModal: Bool = false
    
    var body: some View {
        
        VStack(alignment: .leading){
            List {
                
                TextField("Nº de Convidados", value: $numberOfPeople, formatter: NumberFormatter(), onEditingChanged: { (changed) in
                        self.event.numberOfPeople = numberOfPeople
                    })
                    .keyboardType(.numberPad)
                
                Section(header: Text("Itens")){
                    ForEach(event.list(), id: \.id) { item in
                        ItemCellTotal(item: item)
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
            .navigationTitle("Evento")
            .sheet(isPresented: self.$showModal) {
                CreateItemView(color: $color)
            }
        }
    }
}

struct ItemCellTotal: View {
    
    @ObservedObject var item: Item
    @State private var showModal: Bool = false //aaaaaaaaa
    
    var body: some View {
        NavigationLink(destination: ItemDetails(item: item)) {
            HStack {
                Text(item.name)
                Spacer()
                Text(String(item.quantityToBuy))
                    .foregroundColor(Color(.systemGray))
            }
        }
    }
}

//struct EventView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            EventView()
//                .previewDevice("iPhone 12")
//        }
//    }
//}
