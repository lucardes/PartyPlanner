import SwiftUI

struct EventListView: View {
    
    @State private var showModal: Bool = false
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading, spacing: 24, content: {
                SearchBar(text: .constant(""))
         
        
            List {
                Section(header: Text("eventos futuros")){ //section eventos futuros
                
                    NavigationLink(destination: Text ("Item 1 Destination")) { //event screen
                        HStack{
                            Image(systemName: "heart.fill") //event.icon
                                .colorInvert()
                                .padding(11)
                                .background(Circle()
                                    .fill(Color(UIColor.systemYellow)) //event.color
                                    .frame(width: 30, height: 30))
                            Text("Casamento de Lucas") //Event.name
                                .frame(width: 200, height: 20, alignment: .leading)
                                .font(.system(size: 17))
                            Spacer()
                                Text("28/05") // event.date
                                    .foregroundColor(Color(.systemGray))
                        }
                        
                        
                     }
                    
                }
                
            }
            .navigationTitle("Eventos")
            .listStyle(GroupedListStyle())
                
            Button(action: {
                    self.showModal = true
                
            }) { // (7)
              HStack {
                Image(systemName: "plus.circle.fill") //(8)
                  .resizable()
                  .frame(width: 30, height: 30) // (11)
                Text("Criar Evento") // (9)
                    .fontWeight(.semibold)
                    .font(.system(size: 17))
              }.sheet(isPresented: self.$showModal) {
                CreateEvent()
              }

            }
            .padding()
            .accentColor(Color(UIColor.systemPurple)) // (13)
            
        
            })
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .background(Color("Background").ignoresSafeArea())
        }
                
    }
}

struct EventList_Previews: PreviewProvider {
    static var previews: some View {
        EventListView()
            .previewDevice("iPhone 12")
    }
}
