import SwiftUI

struct BannerModifier: ViewModifier {
    @Binding var isPresented: Bool
    
    let style: BannerStyle
    let message: String
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if isPresented {
                VStack {
                    Spacer()
                    BannerView(isPresented: $isPresented, style: style, message: message)
                        .transition(.move(edge: .bottom))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                withAnimation {
                                    isPresented = false
                                }
                            }
                        }
                }
                .padding(.vertical, .xxs)
                .animation(.easeInOut, value: isPresented)
            }
        }
    }
}

extension View {
    func banner(isPresented: Binding<Bool>, style: BannerStyle, message: String) -> some View {
        self.modifier(BannerModifier(isPresented: isPresented, style: style, message: message))
    }
}
