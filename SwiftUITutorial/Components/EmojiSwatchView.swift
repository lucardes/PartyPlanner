import SwiftUI

struct EmojiSwatchView: View {

    @Binding var selectionemoji: String

    var body: some View {

        let swatches = [
            "heart.fill",
            "flame.fill",
            "sun.max.fill",
            "gift.fill",
            "music.note",
            "star.fill",
        ]

        let columns = [
            GridItem(.adaptive(minimum: 50))
        ]

        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(swatches, id: \.self){ swatch in
                ZStack {
                    Image(systemName: swatch)
                        .foregroundColor(.black)
                        .frame(width: 45, height: 45)
                        .onTapGesture(perform: {
                            selectionemoji = swatch
                        })
                        .background(Circle()
                        .fill(Color("LightGray"))
                        )
                        .padding(10)

                    if selectionemoji == swatch {
                        Circle()
                            .stroke(Color("LightGray"), lineWidth: 5)
                            .frame(width: 55, height: 55)
                    }
                }.aspectRatio(contentMode: .fit)
            }
        }.padding(.horizontal, 10)
    }
}

struct EmojiSwatchView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiSwatchView(selectionemoji: .constant("Green"))
            .previewDevice("iPod touch (7th generation)")
    }
}
