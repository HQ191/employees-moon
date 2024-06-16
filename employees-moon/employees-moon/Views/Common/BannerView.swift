import SwiftUI

enum BannerStyle {
    case success
    case warning
    case refresh
    
    var color: Color {
        switch self {
        case .success:
            return .green
        case .warning, .refresh:
            return .yellow
        }
    }
    
    var icon: Image {
        switch self {
        case .success:
            return Image(systemName: "checkmark")
        case .warning:
            return Image(systemName: "exclamationmark.triangle")
        case .refresh:
            return Image(image: .close)
        }
    }
}

struct BannerView: View {
    
    @Binding var isPresented: Bool
    let style: BannerStyle
    let message: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            buildLabelView()
            Rectangle()
                .fill(style.color)
                .frame(maxWidth: .nano, maxHeight: .xxxl)
        }
        .overlay(buildCloseButton(), alignment: .topTrailing)
        .frame(maxWidth: .infinity)
        .background(.blackOffset)
        .rounded(radius: .nano)
    }
}

private extension BannerView {
    func buildLabelView() -> some View {
        HStack {
            style.icon
                .padding(.quarck)
                .frame(width: .xs, height: .xs)
                .background(style.color)
                .clipShape(Circle())
            
            Text(message).appFont(size: .body)
                .padding(.horizontal, .nano)
                .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .padding(.xs)
        .frame(maxWidth: .infinity)
    }
    
    func buildCloseButton() -> some View {
        Button {
            withAnimation {
                isPresented = false
            }
        } label: {
            Spacer()
            Image(image: .close)
                .resizable()
                .frame(width: .xxxs, height: .xxxs, alignment: .top)
        }
        .padding(.nano)
        .frame(alignment: .center)
    }
}
