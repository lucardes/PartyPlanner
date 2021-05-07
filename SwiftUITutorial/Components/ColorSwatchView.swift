
import SwiftUI

struct ColorSwatchView: View {

    @Binding var selection: String

    var body: some View {

        let swatches = [
            "Red",
            "Orange",
            "Yellow",
            "Green",
            "Blue",
            "Purple",
        ]

        let columns = [
            GridItem(.adaptive(minimum: 50))
        ]

        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(swatches, id: \.self){ swatch in
                ZStack {
                    Circle()
                        .fill(Color(swatch))
                        .frame(width: 45, height: 45)
                        .onTapGesture(perform: {
                            selection = swatch
                        })
                        .padding(10)

                    if selection == swatch {
                        Circle()
                            .stroke(Color(swatch), lineWidth: 5)
                            .frame(width: 55, height: 55)
                    }
                }.aspectRatio(contentMode: .fit)
            }
        }.padding(.horizontal, 10)
    }
}

struct ColorSwatchView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSwatchView(selection: .constant("Green"))
            .previewDevice("iPod touch (7th generation)")
    }
}
