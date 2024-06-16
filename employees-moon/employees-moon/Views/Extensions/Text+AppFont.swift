import SwiftUI

extension Text {
    func appFont(font: AppFont = .regular, size: FontSize) -> some View {
        self.font(.custom(font.rawValue, size: size.rawValue))
            .foregroundStyle(.white)
    }
}
