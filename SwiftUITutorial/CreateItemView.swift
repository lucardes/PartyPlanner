import SwiftUI

struct CreateItemView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var color: Color
    @State var itemName = ""
    @State var quantityByPerson: Float = 0
    @State var unity: itemUnity = .mL
    @State var selectedCategory: itemCategory = .bebidas
    
    var body: some View {
        
        NavigationView{
            VStack (alignment: .leading) {
                List{
                    Section {
                        TextField("Item", text: $itemName, onEditingChanged: {
                            (changed) in
                        })
                        TextField("Quantidade por pessoa", value: $quantityByPerson, formatter: NumberFormatter(), onEditingChanged: {
                            (changed) in
                        })
                        NavigationLink(
                            //TODO: unity selection view
                            destination: UnitySelectionView(selectedUnity: $unity, color: $color),
                            label: {
                                switch(unity){
                                case .mL:
                                    Text("mL")
                                case .unidade:
                                    Text("unidade")
                                case .g:
                                    Text("g")
                                case .lata:
                                    Text("lata")
                                }
                            })
                    }
                    
                    Section(header: Text("Categoria")){
                        ForEach( itemCategory.allCases, id: \.self ){ itemcategory in
                            CategorySelection(category: itemcategory, selectedCategory: $selectedCategory, color: $color)
                        }
                    }
                }
                .listStyle(GroupedListStyle())
            }
            .navigationBarTitle(Text("Novo Evento"), displayMode: .inline)
            .navigationBarItems(leading: Button("Cancelar") {
                presentationMode.wrappedValue.dismiss()
            }.foregroundColor(.purple), trailing: Button("OK") {
                //add event to list here
                presentationMode.wrappedValue.dismiss()
            }.disabled(itemName.isEmpty).accentColor(.purple))
            .background(Color("Background")).ignoresSafeArea()
        }
    }
}
//
//struct SwiftUIView_Previews: PreviewProvider {
//    @State var color = Color(.systemRed)
//    static var previews: some View {
//        CreateItemView(color: $color)
//    }
//}
