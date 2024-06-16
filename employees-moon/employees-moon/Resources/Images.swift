import SwiftUI

enum ImageName: String {
    case close
    case employeeIcon = "employees_icon"
    case refresh
    case search
}

extension Image {
    init(image: ImageName) {
        self.init(image.rawValue)
    }
}
