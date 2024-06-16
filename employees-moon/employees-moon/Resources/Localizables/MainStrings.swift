enum MainStrings: String {
    case failedRefresh
    case noEmployees
    case searchByName
    case title
}

extension String {
    static func main(_ key: MainStrings) -> String {
        .localized(key.rawValue, .main)
    }
}
