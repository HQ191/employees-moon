import SwiftUI

enum FontSize: CGFloat {
    case h1 = 24
    case h2 = 20
    case body = 16
    case bodySmall = 14
    case caption = 12
}

enum AppFont: String {
    case regular = "PublicSans-Regular"
    case bold = "PublicSans-Bold"
    case semiBold = "PublicSans-SemiBold"
}

extension Font {
    static func font(_ font: AppFont = .regular, size: FontSize) -> Font {
        Font.custom(font.rawValue, size: size.rawValue)
    }
}
