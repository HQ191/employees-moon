import SwiftUI

enum DetailStrings: String {
    case title
    case contactInfo
    case email
    case firstName
    case lastName
    case phone
    case personalInfo
    case position
    case workedOn
}

extension String {
    static func detail(_ key: DetailStrings) -> String {
        .localized(key.rawValue, .detail)
    }
}
