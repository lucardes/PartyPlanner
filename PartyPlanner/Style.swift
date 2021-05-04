import Foundation
import SwiftUI

extension Text {
    func customText() -> some View {
        self.font(.system(size: 34, weight: .bold))
            .tracking(0.37)
    }
}

