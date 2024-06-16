import SwiftUI

struct ListRowHiddenModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .listRowInsets(.init())
            .listRowSeparator(.hidden)
    }
}

extension View {
    func listRowHiddenStyle() -> some View {
        self.modifier(ListRowHiddenModifier())
    }
}
