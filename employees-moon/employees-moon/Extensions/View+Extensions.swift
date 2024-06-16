import SwiftUI

extension View {
    var anyView: AnyView {
        AnyView(self)
    }
    
    func rounded(radius: CGFloat = .nano) -> some View {
        self.clipShape(RoundedRectangle(cornerRadius: radius))
    }
}
