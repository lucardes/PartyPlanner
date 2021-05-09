import SwiftUI

struct CreateEvent: View {
    @Environment(\.presentationMode) var presentationMode
    @State var name: String = ""
    @ObservedObject var numberOfPeople = NumbersOnly()
    
    @State private var startDate = Date()
    @State private var endDate = Date() + 1
    
    @State var selection: String = "Red"
    @State var selectionemoji: String = "heart.fill"

    @State var okEnabled: Bool = false
        
        var body: some View {
            NavigationView {
                ScrollView() {
                    VStack(alignment: .leading, spacing: 0){
                        
                        Section(header: Text("")){
                            
                            Divider().padding(.top, 80)
                            
                            TextField("Nome do Evento", text: $name, onEditingChanged: { (changed) in
                            })
                            .foregroundColor(.black)
                            .padding(.vertical, 11)
                            .padding(.horizontal, 16)
                            .background(Color.white)
                            
                            Divider()
                            
                            TextField("Número de pessoas esperado", text: $numberOfPeople.value, onEditingChanged: { (changed) in
                                })
                                .padding(.vertical, 11)
                                .padding(.horizontal, 16)
                                .background(Color.white)
                                .keyboardType(.decimalPad)
                                
                                Divider()
                        }
                        
                        Section(header: Text("")){
                            
                            Divider().padding(.top, 32)
                            
                            DatePicker("Começa", selection: $startDate, in: Date()...)
                                .accentColor(.purple)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 16)
                                .background(Color.white)
                            
                            Divider()
                            
                            DatePicker("Termina", selection: $endDate, in: Date()...)
                                .accentColor(.purple)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 16)
                                .background(Color.white)
                            
                            Divider()
                            
                        }
                        
                        Section(header: Text("")){
                            
                            VStack {
                                ColorSwatchView(selection: $selection)
                                
                                EmojiSwatchView(selectionemoji: $selectionemoji)
                            }.padding(.top, 16)
                            
                        }
                        
                    }
                }
                .navigationBarTitle(Text("Novo Evento"), displayMode: .inline)
                .navigationBarItems(leading: Button("Cancelar") {
                    presentationMode.wrappedValue.dismiss()
                }.foregroundColor(.purple), trailing: Button("OK") {
                    //add event to list here
                    presentationMode.wrappedValue.dismiss()
                }.disabled(name.isEmpty || numberOfPeople.value == "").accentColor(.purple))
                .background(Color("Background")).ignoresSafeArea()
                
            }
        }
    
    
}


struct CreateEvent_Previews: PreviewProvider {
    static var previews: some View {
        CreateEvent()
            .previewDevice("iPhone 12")
    }
}
