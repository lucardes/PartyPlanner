import SwiftUI

struct EventListView: View {
    
    @State private var showModal: Bool = false
    
    let repository: [Event] = [
        Event(name: "Aniversário de Mari", icon: "gift.fill", color: Color(UIColor.systemRed), date: Date()),
        Event(name: "Casamento de Lucas", icon: "heart.fill", color: Color(UIColor.systemYellow), date: Date()),
//        Event(name: "Aniversário de Mari", icon: "gift.fill", color: Color(UIColor.systemRed), date: Date()),
//        Event(name: "Casamento de Lucas", icon: "heart.fill", color: Color(UIColor.systemYellow), date: Date()),
//        Event(name: "Aniversário de Mari", icon: "gift.fill", color: Color(UIColor.systemRed), date: Date()),
//        Event(name: "Casamento de Lucas", icon: "heart.fill", color: Color(UIColor.systemYellow), date: Date()),
//        Event(name: "Aniversário de Mari", icon: "gift.fill", color: Color(UIColor.systemRed), date: Date()),
//        Event(name: "Casamento de Lucas", icon: "heart.fill", color: Color(UIColor.systemYellow), date: Date()),
//        Event(name: "Aniversário de Mari", icon: "gift.fill", color: Color(UIColor.systemRed), date: Date()),
//        Event(name: "Casamento de Lucas", icon: "heart.fill", color: Color(UIColor.systemYellow), date: Date()),
//        Event(name: "Aniversário de Mari", icon: "gift.fill", color: Color(UIColor.systemRed), date: Date()),
//        Event(name: "Casamento de Lucas", icon: "heart.fill", color: Color(UIColor.systemYellow), date: Date()),
//        Event(name: "Aniversário de Mari", icon: "gift.fill", color: Color(UIColor.systemRed), date: Date()),
//        Event(name: "Casamento de Lucas", icon: "heart.fill", color: Color(UIColor.systemYellow), date: Date()),
//        Event(name: "Aniversário de Mari", icon: "gift.fill", color: Color(UIColor.systemRed), date: Date()),
//        Event(name: "Casamento de Lucas", icon: "heart.fill", color: Color(UIColor.systemYellow), date: Date()),
//        Event(name: "Aniversário de Mari", icon: "gift.fill", color: Color(UIColor.systemRed), date: Date()),
//        Event(name: "Casamento de Lucas", icon: "heart.fill", color: Color(UIColor.systemYellow), date: Date()),
        Event(name: "Churrasco do Zé", icon: "sun.max.fill", color: Color(UIColor.systemPurple), date: Date())
    ]
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading, spacing: 24, content: {
                SearchBar(text: .constant(""))
         
                List {
                    Section(header: Text("eventos futuros")){ //section eventos futuros
                        ForEach(repository){ event in
                            NavigationLink(destination: Text ("Item 1 Destination")) { //event view
                                EventItemView(event: event)
                             }
                        }
                    }
    //                Section(header: Text("eventos passados")){
    //
    //                }
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
                    CreateEvent()
                  }

                }
                .padding()
                .accentColor(Color(UIColor.systemPurple))
            })

            .background(Color("Background").ignoresSafeArea())
        }
        
    }
}

struct EventList_Previews: PreviewProvider {
    
    var repository = EventController.testRepository()
    
    static var previews: some View {
        EventListView()
            .previewDevice("iPhone 12")
    }
}
