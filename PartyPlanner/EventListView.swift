import SwiftUI

struct EventList: View {
    
//    var futureEvents : [TableItem] = testDataTableItem
//    var pastEvents : [TableItem] = testDataTableItem
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading, spacing: 24, content: {
                SearchBar(text: .constant(""))
         
        
            List {
                //ForEach(menu) { section in
                Section(header: Text("eventos futuros")){
                //  ForEach(section.items) { item in
                //      Text(item.name)}}}
                
                Text("1")
                Text("2")
                Text("3")
                Text("4")
                }
                
            }
            .navigationTitle("Eventos")
            .listStyle(GroupedListStyle())
                
            Button(action: {}) { // (7)
              HStack {
                Image(systemName: "plus.circle.fill") //(8)
                  .resizable()
                  .frame(width: 20, height: 20) // (11)
                Text("Criar Evento") // (9)
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
 
        
        
//        VStack(
//            alignment: .leading,
//            spacing: 24
//        ){
//            Text("Eventos")
//                .customText()
//                .padding(.top, 40)
//                .padding(.horizontal, 16)
//            SearchBar(text: .constant(""))
//
//
//
//        }
//        .frame(
//            minWidth: 0,
//            maxWidth: .infinity,
//            minHeight: 0,
//            maxHeight: .infinity,
//            alignment: .topLeading
//        )
//        .background(Color("Background").ignoresSafeArea())
                
        
    }
}

struct EventList_Previews: PreviewProvider {
    static var previews: some View {
        EventList()
            .previewDevice("iPhone 12")
    }
}
