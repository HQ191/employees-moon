import SwiftUI

extension View {
    func rounded(radius: CGFloat = .nano) -> some View {
        self.clipShape(RoundedRectangle(cornerRadius: radius))
    }
}
