enum LocalizaionScreen: String {
    case detail = "EmployeeDetail"
    case main = "Main"
}


extension String {
    static func localized(_ key: String, _ table: LocalizaionScreen) -> String {
        String(localized: LocalizationValue(key), table: table.rawValue)
    }
}
