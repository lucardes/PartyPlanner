import SwiftUI

struct EventListView: View {
    
    @ObservedObject var observedObject: EventController
    @State private var showModal: Bool = false
    
    let repository: [Event] = [
        Event(name: "Aniversário de Mari", icon: "gift.fill", color: Color(UIColor.systemRed), numberOfPeople: 3, startDate: Date(), endDate: Date()),
        Event(name: "Casamento de Lucas", icon: "heart.fill", color: Color(UIColor.systemYellow), numberOfPeople: 4, startDate: Date(), endDate: Date()),
        Event(name: "Churrasco do Zé", icon: "sun.max.fill", color: Color(UIColor.systemPurple), numberOfPeople: 5, startDate: Date(), endDate: Date())
    ]
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading, spacing: 24, content: {
                SearchBar(text: .constant(""))
         
                List {
                    Section(header: Text("eventos futuros")){ //section eventos futuros
                        ForEach(observedObject.list()){ event in
                            NavigationLink(destination: EventView(event: event)) { //event view
                                EventItemView(event: event)
                             }
                        }
                    }
                    Section(header: Text("eventos passados")){
    
                    }
                }
                .navigationTitle("Eventos")
                .listStyle(GroupedListStyle())
                    
                Button(action: {
                        self.showModal = true
                }) {
                  HStack {
                    Image(systemName: "plus.circle.fill")
                      .resizable()
                      .frame(width: 30, height: 30)
                    Text("Criar Evento")
                        .fontWeight(.semibold)
                        .font(.system(size: 17))
                  }.sheet(isPresented: self.$showModal) {
                    CreateEvent(observedObject: observedObject)
                  }

                }
                .padding()
                .accentColor(Color(UIColor.systemPurple))
            })

            .background(Color("Background").ignoresSafeArea())
        }
        
    }
}

//struct EventList_Previews: PreviewProvider {
//    
//    var repository = EventController.testRepository()
//    
//    static var previews: some View {
//        EventListView(observedObject: observedObject)
//            .previewDevice("iPhone 12")
//    }
//}
