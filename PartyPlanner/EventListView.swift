import SwiftUI


struct EventList: View {
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 24
        ){
            Text("Eventos")
                .customText()
                .padding(.top, 40)
                .padding(.horizontal, 16)
            SearchBar(text: .constant(""))
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

struct EventList_Previews: PreviewProvider {
    static var previews: some View {
        EventList()
            .previewDevice("iPhone 12")
    }
}
