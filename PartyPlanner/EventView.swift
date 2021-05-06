import SwiftUI


struct EventView: View {
    
    @State var numOfPeople = 0
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 24
        ){
            NavigationView {
                List {
                    TextField("N Participantes", value: $numOfPeople, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                    Section(header: Text("oi")){
                        ForEach(events, id: \.self){ event in
                            Text("oi")
                            
                        }
                    }
                }
                .navigationTitle("Aniversário de Mari")
                .listStyle(GroupedListStyle())
            }
        }
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

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        EventView()
            .previewDevice("iPhone 12")
    }
}
